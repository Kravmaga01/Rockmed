import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.pink;
  static const Color second = Colors.white;
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      // color primario
      primaryColor: Colors.pink,

      // appBartheme
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      inputDecorationTheme: const InputDecorationTheme(

          // Este es el estilo por defecto sin interacción del usuario
          floatingLabelStyle: TextStyle(color: primary),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primary),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10))),
          // Este esta es la configuración del input cuando el usuario da tap
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primary),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10))),

          // para los input que no tengan el focus
          border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10)))));
}
