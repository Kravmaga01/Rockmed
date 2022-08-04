// To parse this JSON data, do
//
//     final modelUser = modelUserFromMap(jsonString);

import 'dart:convert';

import 'package:rock_med/services/services.dart';

class ModelUser {
  ModelUser({
    required this.coverImagePath,
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.isDarkmode,
    this.role,
  });

  final String coverImagePath;
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final bool isDarkmode;
  String? role;

  static ModelUser fromJson(Map<String, dynamic> json) => ModelUser(
        coverImagePath: json["coverImagPath"],
        imagePath: json["imagePath"],
        name: json["name"],
        email: json["email"],
        about: json["about"],
        isDarkmode: json["isDark"],
        role: json['Role'],
      );

  Map<String, dynamic> toJson() => {
        "coverImagPath": coverImagePath,
        "imagePath": imagePath,
        "name": name,
        "email": email,
        "about": about,
        "isDark": isDarkmode,
        "role": role,
      };

  ModelUser copy(
          {String? coverImagePath,
          String? imagePath,
          String? name,
          String? email,
          String? about,
          bool? isDarkmode}) =>
      ModelUser(
          coverImagePath: coverImagePath ?? this.coverImagePath,
          imagePath: imagePath ?? this.imagePath,
          name: name ?? this.name,
          email: email ?? this.email,
          about: about ?? this.about,
          isDarkmode: isDarkmode ?? this.isDarkmode);
}
