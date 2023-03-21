// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class UserDataModel {
  UserDataModel({
    required this.password,
    required this.address,
    required this.name,
    required this.id,
    required this.email,
  });

  String password;
  String address;
  String name;
  String id;
  String email;

  factory UserDataModel.fromRawJson(String str) => UserDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    password: json["password"],
    address: json["address"],
    name: json["name"],
    id: json["id"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "password": password,
    "address": address,
    "name": name,
    "id": id,
    "email": email,
  };
}
