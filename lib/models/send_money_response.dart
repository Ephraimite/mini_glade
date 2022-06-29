// To parse this JSON data, do
//
//     final sendmoneyModel = sendmoneyModelFromJson(jsonString);

import 'dart:convert';


class SendMoneyModel {
  SendMoneyModel({
    this.status,
    this.transactionDate,
    this.txnRef,
    this.senderName,
    this.beneficiaryName,
    this.transactionAmount,
    this.narration,
    this.accountNumber,
    this.receivingBank
  });

  String? status;
  String? transactionDate;
  String? txnRef;
  String? senderName;
  String? beneficiaryName;
  String? transactionAmount;
  String? narration;
  String? accountNumber;
  String? receivingBank;


}
