// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.orderCount,
  });

  int id;
  String name;
  String email;
  String phone;
  int orderCount;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["f_name"],
    email: json["email"],
    phone: json["phone"],
    orderCount: json["order_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "f_name": name,
    "email": email,
    "phone": phone,
    "order_count": orderCount,
  };
}
