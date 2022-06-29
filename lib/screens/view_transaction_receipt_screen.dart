import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mini_glade/components/filled_button_with_icon.dart';
import 'package:mini_glade/components/pdf.dart';
import 'package:mini_glade/components/resuseable_app_bar.dart';
import 'package:mini_glade/constants/colors.dart';
import 'package:mini_glade/models/send_money_response.dart';

class ViewTransactionReceiptScreen extends StatefulWidget {
  final String? status;
  final String? transactionDate;
  final String? txnRef;
  final String? senderName;
  final String? beneficiaryName;
  final String? transactionAmount;
  final String? narration;
  final String? accountNumber;
  final String? receivingBank;

  ViewTransactionReceiptScreen(
      this.status,
      this.transactionDate,
      this.txnRef,
      this.senderName,
      this.beneficiaryName,
      this.transactionAmount,
      this.narration,
      this.accountNumber,
      this.receivingBank);

  @override
  State<ViewTransactionReceiptScreen> createState() =>
      _ViewTransactionReceiptScreenState();
}

class _ViewTransactionReceiptScreenState
    extends State<ViewTransactionReceiptScreen> {
  @override
  Widget build(BuildContext context) {
    PdfUtil pdfUtil = PdfUtil(context);

    return Scaffold(
      appBar: ReuseableAppBar(
        title: Text('Transaction Receipt'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Image.asset('assets/images/black_logo.png')),
              SizedBox(height: 20.h),
              const Divider(
                color: Colors.black,
                height: 2,
                thickness: 1.0,
              ),
              Column(
                children: [
                  transactionHistoryItem(
                      "Transaction status", "${widget.status}"),
                  transactionHistoryItem(
                      "Transaction Date", "${widget.transactionDate}"),
                  transactionHistoryItem(
                      "Transaction reference", "${widget.txnRef}"),
                  transactionHistoryItem("Sender name", "${widget.senderName}"),
                  transactionHistoryItem(
                      "Beneficiary name", "${widget.beneficiaryName}"),
                  transactionHistoryItem(
                      "Transaction Amount", "${widget.transactionAmount}"),
                  transactionHistoryItem("Narration", "${widget.narration}"),
                  transactionHistoryItem(
                      "Account Number", "${widget.accountNumber}"),
                  transactionHistoryItem(
                      "Receiving Bank", "${widget.receivingBank}"),
                  SizedBox(height: 20.h,),
                  SizedBox(
                    width: 200,
                    child: FilledButtonWithIcon(
                      text: 'Share receipt',
                      shareIcon: Ionicons.share,
                      onPressed: () => PdfUtil(context).downloadAndShareStatement(
                        context,
                        SendMoneyModel(
                          status: 'Transfer Successful',
                          transactionDate: widget.transactionDate,
                          txnRef: widget.txnRef,
                          senderName: 'Ephraim Ibatt',
                          beneficiaryName: widget.beneficiaryName,
                          transactionAmount: widget.transactionAmount,
                          narration: widget.narration,
                          accountNumber: widget.accountNumber,
                          receivingBank: widget.receivingBank,
                        )),
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  transactionHistoryItem(String itemName, String itemValue) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text("$itemName: ",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.red)),
          ),
          SizedBox(width: 50.w),
          Expanded(
            flex: 1,
            child: Text("$itemValue",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
