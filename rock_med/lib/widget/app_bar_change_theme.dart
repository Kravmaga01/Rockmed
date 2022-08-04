import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rock_med/themes/themes.dart';

import '../shere_preferences/preferences.dart';

AppBar buildAppBar(BuildContext context) {
  const icon = CupertinoIcons.moon_stars;

  return AppBar(
    actions: [
      ThemeSwitcher(
        builder: (context) => IconButton(
            onPressed: () => ThemeSwitcher.of(context)
                .changeTheme(theme: AppTheme.lightTheme, isReversed: false),
            icon: const Icon(icon)),
      )
    ],
  );
}
