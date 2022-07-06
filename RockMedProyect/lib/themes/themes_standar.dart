import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.pink;
  static final ThemeData lightTheme = ThemeData.dark().copyWith(
    // color primario
    primaryColor: Colors.indigo,

    // appBartheme
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),
  );
}

