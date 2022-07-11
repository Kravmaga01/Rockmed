// To parse this JSON data, do
//
//     final banda = bandaFromJson(jsonString);

import 'dart:convert';

ModelBanda bandaFromJson(String str) => ModelBanda.fromJson(json.decode(str));

String bandaToJson(ModelBanda data) => json.encode(data.toJson());

class ModelBanda {
  ModelBanda({
    required this.codBand,
    required this.nombreBanda,
    required this.ubicacion,
    required this.numCellBanda,
    required this.correoBanda,
    required this.contrasena,
  });

  int codBand;
  String? nombreBanda;
  String? ubicacion;
  int? numCellBanda;
  String? correoBanda;
  String? contrasena;

  factory ModelBanda.fromJson(Map<String, dynamic> json) => ModelBanda(
        codBand: json["codBand"],
        nombreBanda: json["nombreBanda"],
        ubicacion: json["ubicacion"],
        numCellBanda: json["numCellBanda"],
        correoBanda: json["correoBanda"],
        contrasena: json["contrasena"],
      );

  Map<String, dynamic> toJson() => {
        "codBand": codBand,
        "nombreBanda": nombreBanda,
        "ubicacion": ubicacion,
        "numCellBanda": numCellBanda,
        "correoBanda": correoBanda,
        "contrasena": contrasena,
      };
}
