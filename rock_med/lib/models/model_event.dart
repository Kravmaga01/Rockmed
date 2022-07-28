import 'dart:convert';

class ModelEvent {
  ModelEvent({
    required this.nombre,
    required this.cover,
    required this.fecha,
    this.flayer,
    required this.remitente,
    required this.descripcion,
    this.coverValor,
    this.id,
  });
  String nombre;
  bool cover;
  String fecha;
  String? flayer;
  String remitente;
  String descripcion;
  String? id;
  double? coverValor;

  factory ModelEvent.fromJson(String str) =>
      ModelEvent.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelEvent.fromMap(Map<String, dynamic> json) => ModelEvent(
        fecha: json["fecha"],
        flayer: json["flayer"],
        remitente: json["remitente"],
        descripcion: json["descripcion"],
        cover: json["disponible"],
        id: json["id"],
        nombre: json["nombre"],
        coverValor: json["coverValor"],
      );

  Map<String, dynamic> toMap() => {
        "fecha": fecha,
        "flayer": flayer,
        "remitente": remitente,
        "descripcion": descripcion,
        "disponible": cover,
        "id": id,
        "coverValor": coverValor,
        "nombre": nombre,
      };

  ModelEvent copy() => ModelEvent(
      cover: cover,
      coverValor: coverValor,
      fecha: fecha,
      remitente: remitente,
      descripcion: descripcion,
      nombre: nombre);
}
