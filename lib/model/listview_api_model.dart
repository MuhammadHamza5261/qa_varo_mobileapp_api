// To parse this JSON data, do
//
//     final listApiModel = listApiModelFromJson(jsonString);

import 'dart:convert';

class ListApiModel {
  int statusCode;
  bool isSuccess;
  String message;
  Data data;
  String error;

  ListApiModel({
    required this.statusCode,
    required this.isSuccess,
    required this.message,
    required this.data,
    required this.error,
  });

  factory ListApiModel.fromRawJson(String str) => ListApiModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListApiModel.fromJson(Map<String, dynamic> json) => ListApiModel(
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
  List<FacilitiesList> facilitiesList;
  List<InProcess> inProcess;

  Data({
    required this.facilitiesList,
    required this.inProcess,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    facilitiesList: List<FacilitiesList>.from(json["facilitiesList"].map((x) => FacilitiesList.fromJson(x))),
    inProcess: List<InProcess>.from(json["inProcess"].map((x) => InProcess.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "facilitiesList": List<dynamic>.from(facilitiesList.map((x) => x.toJson())),
    "inProcess": List<dynamic>.from(inProcess.map((x) => x.toJson())),
  };
}

class FacilitiesList {
  int facilityId;
  String facilityName;
  int orderCount;
  String address;
  double longitude;
  double latitude;

  FacilitiesList({
    required this.facilityId,
    required this.facilityName,
    required this.orderCount,
    required this.address,
    required this.longitude,
    required this.latitude,
  });

  factory FacilitiesList.fromRawJson(String str) => FacilitiesList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FacilitiesList.fromJson(Map<String, dynamic> json) => FacilitiesList(
    facilityId: json["facilityId"],
    facilityName: json["facilityName"],
    orderCount: json["orderCount"],
    address: json["address"],
    longitude: json["longitude"]?.toDouble(),
    latitude: json["latitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "facilityId": facilityId,
    "facilityName": facilityName,
    "orderCount": orderCount,
    "address": address,
    "longitude": longitude,
    "latitude": latitude,
  };
}

class InProcess {
  int orderId;
  int facilityId;
  double longitude;
  double latitude;
  String address;

  InProcess({
    required this.orderId,
    required this.facilityId,
    required this.longitude,
    required this.latitude,
    required this.address,
  });

  factory InProcess.fromRawJson(String str) => InProcess.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InProcess.fromJson(Map<String, dynamic> json) => InProcess(
    orderId: json["orderId"],
    facilityId: json["facilityId"],
    longitude: json["longitude"]?.toDouble(),
    latitude: json["latitude"]?.toDouble(),
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "facilityId": facilityId,
    "longitude": longitude,
    "latitude": latitude,
    "address": address,
  };
}
