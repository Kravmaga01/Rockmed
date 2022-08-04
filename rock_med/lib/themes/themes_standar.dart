import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromARGB(231, 246, 51, 116);
  static const Color second = Colors.white;
  static const Color third = Color.fromARGB(103, 0, 0, 0);
  static const Color fourth = Color.fromARGB(246, 236, 24, 63);
  static const Color primaryligth = Color.fromARGB(255, 255, 2, 87);
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      // color primario
      primaryColor: primary,
      // style de SnackBar
      snackBarTheme: const SnackBarThemeData(
          backgroundColor: primary, contentTextStyle: TextStyle(color: second)),
      // appBartheme
      // FloatingActionbottonTeme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary,
      ),
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      inputDecorationTheme: InputDecorationTheme(

          // Este es el estilo por defecto sin interacción del usuario

          floatingLabelStyle: const TextStyle(color: primary),
          labelStyle: const TextStyle(color: primary),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: primary),
              borderRadius: BorderRadius.circular(12)),
          // Este esta es la configuración del input cuando el usuario da tap
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: primary),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  topRight: Radius.circular(10))),

          // para los input que no tengan el focus
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10)))));

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      // color primario
      primaryColor: primaryligth,

      // style de SnackBar
      snackBarTheme: const SnackBarThemeData(
          backgroundColor: primaryligth,
          contentTextStyle: TextStyle(color: primary)),
      // appBartheme
      // FloatingActionbottonTeme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary,
      ),
      appBarTheme: const AppBarTheme(color: primaryligth, elevation: 0),
      inputDecorationTheme: InputDecorationTheme(

          // Este es el estilo por defecto sin interacción del usuario

          floatingLabelStyle: const TextStyle(color: primary),
          labelStyle: const TextStyle(color: primaryligth),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: primaryligth),
              borderRadius: BorderRadius.circular(12)),
          // Este esta es la configuración del input cuando el usuario da tap
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: primaryligth),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  topRight: Radius.circular(10))),

          // para los input que no tengan el focus
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10)))));
}
