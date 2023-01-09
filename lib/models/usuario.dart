// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    required this.nombre,
    required this.email,
    required this.uid,
    required this.activo,
  });

  String nombre;
  String email;
  String uid;
  bool activo;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        nombre: json["nombre"],
        email: json["email"],
        uid: json["uid"],
        activo: json["online"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "email": email,
        "uid": uid,
      };
}
