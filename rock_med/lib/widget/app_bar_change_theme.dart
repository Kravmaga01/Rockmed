import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rock_med/shere_preferences/preferences.dart';
import 'package:rock_med/themes/themes.dart';

import '../shere_preferences/preferences.dart';

AppBar buildAppBar(BuildContext context) {
  const icon = CupertinoIcons.moon_stars;

  return AppBar(
    actions: [
      ThemeSwitcher(
        builder: (context) => IconButton(
            onPressed: () {
              bool value;
              if (Preferences.isDarkmode) {
                value = false;
              } else {
                value = false;
              }
              Preferences.isDarkmode = value;
              final themeProvider =
                  Provider.of<ThemeProvider>(context, listen: false);
            },
            icon: const Icon(icon)),
      )
    ],
  );
}
