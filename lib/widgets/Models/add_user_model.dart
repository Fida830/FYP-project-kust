// To parse this JSON data, do
//
//     final salonModel = salonModelFromJson(jsonString);

import 'dart:convert';

AddUserModel userModelFromJson(String str) =>
    AddUserModel.fromJson(json.decode(str));

String userModelToJson(AddUserModel data) =>
    json.encode(data.toJson(data.uid.toString()));

class AddUserModel {
  String? uid;
  String? fullName;
  String? email;
  String? phoneNo;
  String? address;
  String? CNIC;

  AddUserModel({
    this.uid,
    this.fullName,
    this.email,
    this.phoneNo,
    this.address,
    this.CNIC,
  });

  factory AddUserModel.fromJson(Map<String, dynamic> json) => AddUserModel(
    uid: json["uid"],
    fullName: json["fullName"],
    email: json["email"],
    phoneNo: json["phoneNo"],
    address: json["address"],
    CNIC: json["CNIC"],

  );

  Map<String, dynamic> toJson(String id) => {
    "uid": id,
    "fullName": fullName,
    "email": email,
    "phoneNo": phoneNo,
    "address": address,
    "CNIC": CNIC,
  };
}
