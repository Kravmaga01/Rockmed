import 'dart:convert';

class ModelEvent {
  ModelEvent({
    required this.disponible,
    required this.fecha,
    this.flayer,
    required this.remitente,
    required this.descripcion,
    this.id,
  });
  bool disponible;
  String fecha;
  String? flayer;
  String remitente;
  String descripcion;
  String? id;

  factory ModelEvent.fromJson(String str) =>
      ModelEvent.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelEvent.fromMap(Map<String, dynamic> json) => ModelEvent(
        fecha: json["fecha"],
        flayer: json["flayer"],
        remitente: json["remitente"],
        descripcion: json["descripcion"],
        disponible: json["disponible"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "fecha": fecha,
        "flayer": flayer,
        "remitente": remitente,
        "descripcion": descripcion,
        "disponible": disponible,
        "id": id,
      };

  ModelEvent copy() => ModelEvent(
      disponible: disponible,
      fecha: fecha,
      remitente: remitente,
      descripcion: descripcion);
}
