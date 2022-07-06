import 'package:flutter/material.dart';

class RoutersOption {
  final String route;
  final String name;
  final Widget screen;
  final IconData icon;

  RoutersOption(
      {required this.route,
      required this.name,
      required this.screen,
      required this.icon});
}
