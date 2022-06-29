import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:mini_glade/base/base_view.dart';
import 'package:mini_glade/components/custom_expansion.dart';
import 'package:mini_glade/components/general_widget/general_widget.dart';
import 'package:mini_glade/components/resuseable_app_bar.dart';
import 'package:mini_glade/components/reuseable_filled_button.dart';
import 'package:mini_glade/components/reuseable_text_field.dart';
import 'package:mini_glade/components/wallet_balance_card.dart';
import 'package:mini_glade/constants/colors.dart';
import 'package:mini_glade/view_models/send_money_viewmodel.dart';

class SendMoneyToOtherBanksScreen extends StatelessWidget {
  const SendMoneyToOtherBanksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SendMoneyViewModel>(
      vmBuilder: (context) => SendMoneyViewModel(context),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, SendMoneyViewModel viewModel) {
    return Scaffold(
      appBar: ReuseableAppBar(
        title: Text('Other Banks'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WalletBalanceCard(
                accountNumber: '8175891028',
                balance: 20000,
                currency: 'NGN',
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(' Select receivers bank'),
              SizedBox(
                height: 5.h,
              ),
              CustomExpansionTile(
                header: viewModel.selectedBank == null
                    ? 'Select Bank'
                    : viewModel.selectedBank!,
                leadingImage: 'assets/images/bank.png',
                children: [
                  SizedBox(
                    height: 300,
                    child: Scrollbar(
                      isAlwaysShown: true,
                      controller: viewModel.scrollController,
                      thickness: 4.0,
                      radius: Radius.circular(5.r),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            controller: viewModel.scrollController,
                            itemCount: viewModel.allBankList.length,
                            itemBuilder: (context, index) {
                              var items = viewModel.allBankList[index];
                              return ListTile(
                                selectedTileColor: colorPrimary,
                                title: InkWell(
                                    onTap: () {
                                      viewModel.updateSelectedBank(
                                          selectedItem: items.bankName,
                                          selectedBankCode: items.bankCode);
                                      viewModel.hasSelectedBank = true;
                                    },
                                    child: Text(items.bankName, style: TextStyle(fontSize: 14.sp),)),
                                trailing: Radio(
                                    activeColor: colorPrimary,
                                    value: items.bankName,
                                    groupValue: viewModel.selectedBank,
                                    onChanged: (value) {
                                      viewModel.updateSelectedBank(
                                          selectedItem: value.toString(),
                                          selectedBankCode: items.bankCode);
                                      viewModel.bankCode = items.bankCode;
                                      viewModel.hasSelectedBank = true;
                                    }),
                                contentPadding: EdgeInsets.all(0),
                              );
                            }),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(' Account number'),
              SizedBox(
                height: 5.h,
              ),
              // 0040000009
              ReuseableTextField(
                hintText: 'Enter account number',
                obscureText: false,
                shouldReadOnly:
                    viewModel.hasSelectedBank == false ? true : false,
                onTap: () {
                  if (viewModel.hasSelectedBank == false) {
                    showSnackBar('please select destination account', context);
                  }
                },
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  viewModel.accountNumber = value;
                  if (value.length == 10) {
                    dismissKeyboard();
                    viewModel.validateAccountNumber(
                        context, viewModel.accountNumber, viewModel.bankCode!);
                    log('bank code: ${viewModel.bankCode}');
                    viewModel.hasEnterAccountNumber = true;
                  }
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              viewModel.receiversName == null
                  ? Container()
                  : Text.rich(
                      TextSpan(text: 'receivers name : ', children: [
                        TextSpan(
                            text: viewModel.receiversName,
                            style: const TextStyle(
                                color: colorPrimary,
                                fontWeight: FontWeight.w600)),
                      ]),
                    ),
              SizedBox(
                height: 30.h,
              ),
              const Text(' Amount'),
              SizedBox(
                height: 5.h,
              ),
              ReuseableTextField(
                hintText: 'Enter amount',
                obscureText: false,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  viewModel.amount = value;
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(' Narration'),
              SizedBox(
                height: 5.h,
              ),
              ReuseableTextField(
                hintText: 'Narration',
                obscureText: false,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  viewModel.narration = value;
                },
              ),
              SizedBox(
                height: 50.h,
              ),
              ReuseableFilledButton(
                onPressed: () {
                  if (viewModel.amount.isEmpty) {
                    showSnackBar('Enter amount', context);
                  } else if (viewModel.narration!.isEmpty) {
                    showSnackBar('Enter narration', context);
                  } else {
                    viewModel.transactionRef =
                        DateTime.now().microsecondsSinceEpoch.toString();
                    log('OrderRef: ${viewModel.transactionRef}');

                    viewModel.sendMoney(
                        context,
                        viewModel.accountNumber,
                        viewModel.bankCode!,
                        viewModel.amount,
                        viewModel.receiversName!,
                        viewModel.narration!,
                        viewModel.transactionRef!);
                  }
                },
                isEnabled: viewModel.hasSelectedBank &&
                    viewModel.hasEnterAccountNumber,
                text: 'Send money',
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
