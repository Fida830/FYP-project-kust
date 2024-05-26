// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'dart:convert';

UsersModel customerModelFromJson(String str) =>
    UsersModel.fromJson(json.decode(str));

String customerModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
  String? cid;
  String? fullName;
  String? email;
  String? imageUrl;
  String? phoneNumber;
  String? CNIC;
  String? pickupDate;
  String? returnDate;

  UsersModel({
    this.cid,
    this.fullName,
    this.email,
    this.imageUrl,
    this.phoneNumber,
    this.CNIC,
    this.pickupDate,
    this.returnDate,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
    cid: json["cid"],
    fullName: json["fullName"],
    email: json["email"],
    imageUrl: json["imageUrl"],
    phoneNumber: json["phoneNumber"],
    CNIC: json["CNIC"],
    pickupDate: json["pickupDate"],
    returnDate: json["returnDate"],
  );

  Map<String, dynamic> toJson() => {
    "cid": cid,
    "fullName": fullName,
    "email": email,
    "imageUrl": imageUrl,
    "phoneNumber": phoneNumber,
    "CNIC": CNIC,
    "pickupDate": pickupDate,
    "returnDate": returnDate,
  };
}
