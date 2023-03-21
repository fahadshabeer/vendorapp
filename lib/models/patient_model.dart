// To parse this JSON data, do
//
//     final patientModel = patientModelFromJson(jsonString);

import 'dart:convert';

PatientModel patientModelFromJson(String str) => PatientModel.fromJson(json.decode(str));

String patientModelToJson(PatientModel data) => json.encode(data.toJson());

class PatientModel {
  PatientModel({
    required this.district,
    required this.id,
    required this.state,
    required this.city,
    required this.name,
    required this.thumbImpression,
    required this.phone,
    required this.donationId,
    required this.linkedTo
  });

  String district;
  String id;
  String state;
  String city;
  String name;
  String? donationId;
  String thumbImpression;
  String phone;
  String? linkedTo;

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
    district: json["district"],
    id: json["id"],
    state: json["state"],
    city: json["city"],
    donationId: json["donationId"],
    name: json["name"],
    thumbImpression: json["thumbImpression"],
    phone: json["phone"],
    linkedTo: json["linkedTo"],
  );

  Map<String, dynamic> toJson() => {
    "district": district,
    "id": id,
    "state": state,
    "city": city,
    "name": name,
    "donationId": donationId,
    "thumbImpression": thumbImpression,
    "phone": phone,
    "linkedTo":linkedTo
  };
}
