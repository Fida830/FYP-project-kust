// To parse this JSON data, do
//
//     final ownerModel = ownerModelFromJson(jsonString);

import 'dart:convert';

AdminModel ownerModelFromJson(String str) =>
    AdminModel.fromJson(json.decode(str));

String ownerModelToJson(AdminModel data) =>
    json.encode(data.toJson(data.oid.toString()));

class AdminModel {
  String? oid;
  String? fullName;
  String? email;
  String? imageUrl;
  String? phoneNumber;

  AdminModel({
    this.oid,
    this.fullName,
    this.email,
    this.imageUrl,
    this.phoneNumber,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
    oid: json["oid"],
    fullName: json["fullName"],
    email: json["email"],
    imageUrl: json["imageUrl"],
    phoneNumber: json["phoneNumber"],
  );

  Map<String, dynamic> toJson(String id) => {
    "oid": id,
    "fullName": fullName,
    "imageUrl": imageUrl,
    "phoneNumber": phoneNumber,
  };
}
