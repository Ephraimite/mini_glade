// To parse this JSON data, do
//
//     final verifyAccountNumberModel = verifyAccountNumberModelFromJson(jsonString);

import 'dart:convert';

VerifyAccountNumberModel verifyAccountNumberModelFromJson(String str) => VerifyAccountNumberModel.fromJson(json.decode(str));

String verifyAccountNumberModelToJson(VerifyAccountNumberModel data) => json.encode(data.toJson());

class VerifyAccountNumberModel {
  VerifyAccountNumberModel({
    this.status,
    this.resolved,
    this.data,
  });

  String? status;
  bool? resolved;
  Data? data;

  factory VerifyAccountNumberModel.fromJson(Map<String, dynamic> json) => VerifyAccountNumberModel(
    status: json["status"],
    resolved: json["resolved"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "resolved": resolved,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.accountName,
  });

  String? accountName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accountName: json["account_name"],
  );

  Map<String, dynamic> toJson() => {
    "account_name": accountName,
  };
}
