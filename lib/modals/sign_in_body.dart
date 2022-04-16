// To parse this JSON data, do
//
//     final signUpBody = signUpBodyFromJson(jsonString);

import 'dart:convert';

SignInBody signInBodyFromJson(String str) => SignInBody.fromJson(json.decode(str));

String signInBodyToJson(SignInBody data) => json.encode(data.toJson());

class SignInBody {
  SignInBody({

    required this.email,
    required this.password,
  });


  String email;
  String password;

  factory SignInBody.fromJson(Map<String, dynamic> json) => SignInBody(

    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {

    "email": email,
    "password": password,
  };
}
