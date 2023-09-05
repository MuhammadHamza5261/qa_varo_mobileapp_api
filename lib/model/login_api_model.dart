// To parse this JSON data, do
//
//     final loginApiModel = loginApiModelFromJson(jsonString);

import 'dart:convert';

class LoginApiModel {
  int statusCode;
  bool isSuccess;
  String message;
  Data data;
  String error;

  LoginApiModel({
    required this.statusCode,
    required this.isSuccess,
    required this.message,
    required this.data,
    required this.error,
  });

  factory LoginApiModel.fromRawJson(String str) => LoginApiModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginApiModel.fromJson(Map<String, dynamic> json) => LoginApiModel(
    statusCode: json["statusCode"],
    isSuccess: json["isSuccess"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "isSuccess": isSuccess,
    "message": message,
    "data": data.toJson(),
    "error": error,
  };
}

class Data {
  String token;
  int superAdminId;
  String superAdminName;
  String email;

  Data({
    required this.token,
    required this.superAdminId,
    required this.superAdminName,
    required this.email,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    superAdminId: json["superAdminId"],
    superAdminName: json["superAdminName"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "superAdminId": superAdminId,
    "superAdminName": superAdminName,
    "email": email,
  };
}
