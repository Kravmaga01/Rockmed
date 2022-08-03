// To parse this JSON data, do
//
//     final modelUser = modelUserFromMap(jsonString);

import 'dart:convert';

class ModelUser {
  ModelUser({
    required this.coverImagPath,
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.isDark,
  });

  final String coverImagPath;
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final bool isDark;

  factory ModelUser.fromJson(String str) => ModelUser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelUser.fromMap(Map<String, dynamic> json) => ModelUser(
        coverImagPath: json["coverImagPath"],
        imagePath: json["imagePath"],
        name: json["name"],
        email: json["email"],
        about: json["about"],
        isDark: json["isDark"],
      );

  Map<String, dynamic> toMap() => {
        "coverImagPath": coverImagPath,
        "imagePath": imagePath,
        "name": name,
        "email": email,
        "about": about,
        "isDark": isDark,
      };
}
