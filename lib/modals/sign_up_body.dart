// To parse this JSON data, do
//
//     final signUpBody = signUpBodyFromJson(jsonString);

import 'dart:convert';

SignUpBody signUpBodyFromJson(String str) => SignUpBody.fromJson(json.decode(str));

String signUpBodyToJson(SignUpBody data) => json.encode(data.toJson());

class SignUpBody {
  SignUpBody({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });

  String name;
  String phone;
  String email;
  String password;

  factory SignUpBody.fromJson(Map<String, dynamic> json) => SignUpBody(
    name: json["f_name"],
    phone: json["phone"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "f_name": name,
    "phone": phone,
    "email": email,
    "password": password,
  };
}
