import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mini_glade/base/base_view_model/base_vm.dart';
import 'package:mini_glade/components/forgot_password_alert_screen.dart';
import 'package:mini_glade/components/general_widget/general_widget.dart';
import 'package:mini_glade/components/navigator.dart';
import 'package:mini_glade/components/pdf.dart';
import 'package:mini_glade/components/reuseable_transaction_success_page.dart';
import 'package:mini_glade/models/bank_list_response_model.dart';
import 'package:mini_glade/models/send_money_response.dart';
import 'package:mini_glade/models/verify_account_number_response_model.dart';
import 'package:mini_glade/screens/bottom_navigation_screen.dart';
import 'package:mini_glade/screens/view_transaction_receipt_screen.dart';
import 'package:mini_glade/services/base_api_service.dart';
import 'package:mini_glade/services/base_url.dart';

class SendMoneyViewModel extends BaseViewModel {
  String? selectedCategory;

  BuildContext context;

  SendMoneyViewModel(this.context);

  ScrollController scrollController = ScrollController();

  final BaseApiService _baseApiService = BaseApiService();
  bool _hasSelectedBank = false;

  bool get hasSelectedBank => _hasSelectedBank;
  bool _hasEnterAccountNumber = false;

  bool get hasEnterAccountNumber => _hasEnterAccountNumber;

  set hasEnterAccountNumber(bool value) {
    _hasEnterAccountNumber = value;
  }

  set hasSelectedBank(bool value) {
    _hasSelectedBank = value;
  }

  updateReceiversName(dynamic name) {
    receiversName = name;
    notifyListeners();
  }

  String? selectedBank = 'select bank';
  String accountNumber = '';
  String amount = '';
  String? bankCode = '';
  String? receiversName;
  String? narration = '';
  String? transactionRef;

  String transferRef = '';

  @override
  FutureOr<void> disposeState() {
    // TODO: implement disposeState
    throw UnimplementedError();
  }

  @override
  FutureOr<void> initState() {
    getListOfBanks(context);
  }

  updateSelectedBank({String? selectedItem, String? selectedBankCode}) {
    selectedBank = selectedItem!;
    bankCode = selectedBankCode;

    log('Selected bank: ${selectedBank.toString()}');
    log('Selected bank code: ${bankCode.toString()}');

    notifyListeners();
  }

  updateSelectedItem(String item) {
    selectedCategory = item;
    notifyListeners();
  }

  final Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'mid': 'GP_9695a6071e26433f929b490d7128ecbb',
    'key': 'b0e25a0647ed4276a42fcab6e1897103'
  };

  List<BankListModel> allBankList = [];

  getListOfBanks(BuildContext context) async {
    changeLoaderStatus(true);
    var url = BaseUrl.baseUrl + 'resources';
    final response = await BaseApiService()
        .putRequest(url: url, payload: {"inquire": "banks"});

    log('fetch banks response: $response');

    if (response['status'] == 104) {
      showSnackBar(response['message'], context);
      changeLoaderStatus(false);
    }
    Map<String, dynamic> map = response;

    allBankList = map.entries
        .map((entry) => BankListModel(entry.key, entry.value))
        .toList();

    changeLoaderStatus(false);
  }

  sendMoney(
    BuildContext context,
    String accountNumber,
    String bankCode,
    String amount,
    String senderName,
    String narration,
    String orderRef,
  ) async {
    changeLoaderStatus(true);
    var url = 'https://demo.api.glade.ng/disburse';
    var payload = {
      "action": "transfer",
      "amount": amount,
      "bankcode": bankCode,
      "accountnumber": accountNumber,
      "sender_name": senderName,
      "narration": narration,
      "orderRef": orderRef
    };
    final response = await http.put(
      Uri.parse(url),
      headers: _headers,
      body: jsonEncode(payload),
    );
    log('Send money request payload: $payload');

    var decodedResponse = jsonDecode(response.body);
    log('transfer response: $decodedResponse');

    if (response.statusCode == 200) {
      transferRef = decodedResponse['txnRef'];
      log('transfer ref: $transferRef');
      changeLoaderStatus(true);
      verifyTransfer(context, transferRef);
      // var baseResponse = SendmoneyModel.fromJson(decodedResponse);

    } else {
      changeLoaderStatus(false);

      log('Make Transfer Response: ${decodedResponse.toString()}');
      showSnackBar(decodedResponse['message'], context);
    }
  }

  String transactionDate = '';
  Future verifyTransfer(
    BuildContext context,
    String transferRef,
  ) async {
    changeLoaderStatus(true);
    var url = 'https://demo.api.glade.ng/disburse';
    // 0040000009
    var payload = {"action": "verify", "txnRef": transferRef};
// 0040000008
    final response = await http.put(
      Uri.parse(url),
      headers: _headers,
      body: jsonEncode(payload),
    );
    log('Verify transfer  payload: $payload');

    var decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      navigateToRoute(
        context,
        ReuseableSuccessSheet(
          buttonText: 'Continue',
          iconData: Icons.check,
          onPressed: () =>
              navigateAndRemoveUntilRoute(context, BottomNavigation()),
          title: 'Transfer Successful',
          successTitleText: 'Thank you for using Glade',
          shareReceiptPressed: () => PdfUtil(context).downloadAndShareStatement(
              context,
              SendMoneyModel(
                status: 'Transfer Successful',
                transactionDate: transactionDate,
                txnRef: transferRef,
                senderName: 'Ephraim Ibatt',
                beneficiaryName: receiversName,
                transactionAmount: amount,
                narration: narration,
                accountNumber: accountNumber,
                receivingBank: selectedBank,
              )),
          viewReceiptPressed: () => navigateToRoute(
              context,
              ViewTransactionReceiptScreen(
                  'Transfer Successful',
                  transactionDate,
                  transferRef,
                  'Ephraim Ibatt',
                  receiversName!,
                  amount,
                  narration!,
                  accountNumber,
                  selectedBank!)),
        ),
      );

      DateTime dateTime = DateTime.now().toLocal();
      transactionDate = DateFormat('EEE d MMM \n kk:mm:ss').format(dateTime);

      changeLoaderStatus(false);
    } else {
      log('Make Transfer Response: ${decodedResponse.toString()}');
      var snackBar = SnackBar(
        content: Text(decodedResponse['message']),
        backgroundColor: Colors.red.shade600,
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.all(10.0),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      changeLoaderStatus(false);
    }
  }

  validateAccountNumber(
      BuildContext context, String accountNumber, String bankCode) async {
    changeLoaderStatus(true);
    var url = BaseUrl.baseUrl + 'resources';
    final response = await http.put(
      Uri.parse(url),
      headers: _headers,
      body: jsonEncode({
        "inquire": "accountname",
        "accountnumber": accountNumber,
        "bankcode": bankCode
      }),
    );

    var decodedResponse = jsonDecode(response.body);
    log('response body: ${response.body}');

    if (response.statusCode == 200) {
      var res = VerifyAccountNumberModel.fromJson(decodedResponse);

      changeLoaderStatus(false);

      if (res.status == 'success' && res.resolved == true) {
        showDialog(
            context: context,
            builder: (context) {
              return CancelBookingDialog(
                title: 'Kindly confirm beneficiary name',
                text: res.data!.accountName ?? '',
                yesButtonPressed: () {
                  Navigator.pop(context);
                  updateReceiversName(res.data!.accountName!);
                },
                noButtonPressed: () {
                  Navigator.pop(context);
                  _hasSelectedBank = false;
                  _hasEnterAccountNumber = false;
                  updateReceiversName(null);
                },
              );
            });
      } else {
        changeLoaderStatus(false);
        showSnackBar(decodedResponse['message'], context);
      }
    } else {
      changeLoaderStatus(false);
      showSnackBar(decodedResponse['message'], context);
    }
  }

  viewReceipt() {}
}
