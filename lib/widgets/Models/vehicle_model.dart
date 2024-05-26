// To parse this JSON data, do
//
//     final salonModel = salonModelFromJson(jsonString);

import 'dart:convert';

VehicleModel VehicleModelFromJson(String str) =>
    VehicleModel.fromJson(json.decode(str));

String VehicleModelToJson(VehicleModel data) =>
    json.encode(data.toJson(data.vid.toString()));


class VehicleModel {
  String? vid;
  String? VehicleName;
  String? VehicleModelYear;
  String? VehicleNo;
  String? VehicleColor;
  String? image;

  VehicleModel({
    this.vid,
    this.VehicleName,
    this.VehicleModelYear,
    this.VehicleNo,
    this.VehicleColor,
    this.image,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
    vid: json["vid"],
    VehicleName: json["VehicleName"],
    VehicleModelYear: json["VehicleModelYear"],
    VehicleNo: json["VehicleNo"],
    VehicleColor: json["VehicleColor"],
    image: json["image"],

  );

  Map<String, dynamic> toJson(String id) => {
    "vid": id,
    "VehicleName": VehicleName,
    "VehicleModelYear": VehicleModelYear,
    "VehicleNo": VehicleNo,
    "VehicleColor": VehicleColor,
    "image": image,
  };
}
