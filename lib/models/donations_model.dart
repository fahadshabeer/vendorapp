// To parse this JSON data, do
//
//     final donationsModel = donationsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class DonationsModel {
  DonationsModel({
    required this.linkedPatients,
    required this.donarname,
    required this.title,
    required this.date,
    required this.donaremail,
    required this.donarcity,
    required this.donardistrict,
    required this.id,
    required this.donarnumofpatient,
    required this.donarstate,
    required this.amount,
  });

  List<LinkedPatient> linkedPatients;
  String donarname;
  String title;
  DateTime date;
  String donaremail;
  String donarcity;
  String donardistrict;
  String id;
  String donarnumofpatient;
  String donarstate;
  num amount;

  factory DonationsModel.fromRawJson(String str) => DonationsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DonationsModel.fromJson(Map<String, dynamic> json) => DonationsModel(
    linkedPatients: json["linkedPatients"]==null? []:List<LinkedPatient>.from(json["linkedPatients"].map((x) => LinkedPatient.fromJson(x))),
    donarname: json["donarname"],
    title: json["title"],
    date: json["date"].toDate(),
    donaremail: json["donaremail"],
    donarcity: json["donarcity"],
    donardistrict: json["donardistrict"],
    id: json["id"],
    donarnumofpatient: json["donarnumofpatient"],
    donarstate: json["donarstate"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "linkedPatients": List<dynamic>.from(linkedPatients.map((x) => x.toJson())),
    "donarname": donarname,
    "title": title,
    "date": date,
    "donaremail": donaremail,
    "donarcity": donarcity,
    "donardistrict": donardistrict,
    "id": id,
    "donarnumofpatient": donarnumofpatient,
    "donarstate": donarstate,
    "amount": amount,
  };
}

class LinkedPatient {
  LinkedPatient({
    required this.patientId,
    required this.delivered,
  });

  String patientId;
  bool delivered;

  factory LinkedPatient.fromRawJson(String str) => LinkedPatient.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LinkedPatient.fromJson(Map<String, dynamic> json) => LinkedPatient(
    patientId: json["patientId"],
    delivered: json["delivered"],
  );

  Map<String, dynamic> toJson() => {
    "patientId": patientId,
    "delivered": delivered,
  };
}
