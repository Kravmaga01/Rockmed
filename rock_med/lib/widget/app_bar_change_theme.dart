import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rock_med/themes/themes.dart';

AppBar buildAppBar(BuildContext context) {
  const icon = CupertinoIcons.moon_stars;

  return AppBar(
    actions: [
      ThemeSwitcher(
        builder: (context) =>
            IconButton(onPressed: () {}, icon: const Icon(icon)),
      )
    ],
  );
}
