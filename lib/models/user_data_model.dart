// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class UserDataModel {
  UserDataModel({
    required this.name,
    required this.email,
  });

  String name;
  String email;

  factory UserDataModel.fromRawJson(String str) => UserDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
  };
}
