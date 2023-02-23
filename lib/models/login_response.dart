// To parse this JSON data, do
//
//     final restCountriesResponse = restCountriesResponseFromJson(jsonString);

// import 'dart:convert';

// LoginResponse restCountriesResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

// String restCountriesResponseToJson(LoginResponse data) => json.encode(data.toJson());

import 'package:chat_app/models/models.dart';

class LoginResponse {
  LoginResponse({
    required this.ok,
    required this.usuario,
    required this.token,
  });

  bool ok;
  Usuario usuario;
  String token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        ok: json["ok"],
        usuario: Usuario.fromJson(json["usuarioDB"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuarioDB": usuario.toJson(),
        "token": token,
      };
}
