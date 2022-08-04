import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:rock_med/themes/themes.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  ThemeProvider({required bool isDarKmode})
      : currentTheme = isDarKmode ? AppTheme.darkTheme : AppTheme.lightTheme;

  setDarkMode() {
    currentTheme = AppTheme.darkTheme;
    notifyListeners();
  }

  setLightMode() {
    currentTheme = AppTheme.lightTheme;
    notifyListeners();
  }
}
