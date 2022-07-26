// To parse this JSON data, do
//
//     final evento = eventoFromMap(jsonString);

import 'dart:convert';

class ModelEvent {
  ModelEvent({
    required this.cover,
    required this.fecha,
    this.flayer,
    required this.remitente,
    required this.descripcion,
    required this.evento,
    required this.id,
  });

  bool cover;
  String fecha;
  String? flayer;
  String remitente;
  String descripcion;
  String evento;
  String id;

  factory ModelEvent.fromJson(String str) =>
      ModelEvent.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelEvent.fromMap(Map<String, dynamic> json) => ModelEvent(
        cover: json["Cover"],
        fecha: json["Fecha"],
        flayer: json["Flayer"],
        remitente: json["Remitente"],
        descripcion: json["descripción"],
        evento: json["evento"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "Cover": cover,
        "Fecha": fecha,
        "Flayer": flayer,
        "Remitente": remitente,
        "descripción": descripcion,
        "evento": evento,
        "id": id,
      };
}
