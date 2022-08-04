// To parse this JSON data, do
//
//     final modelUser = modelUserFromMap(jsonString);

import 'dart:convert';

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

  factory ModelUser.fromJson(String str) => ModelUser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelUser.fromMap(Map<String, dynamic> json) => ModelUser(
        coverImagePath: json["coverImagPath"],
        imagePath: json["imagePath"],
        name: json["name"],
        email: json["email"],
        about: json["about"],
        isDarkmode: json["isDark"],
        role: json['Role'],
      );

  Map<String, dynamic> toMap() => {
        "coverImagPath": coverImagePath,
        "imagePath": imagePath,
        "name": name,
        "email": email,
        "about": about,
        "isDark": isDarkmode,
        "Role": role,
      };
}
