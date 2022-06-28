import 'package:componente_application_2/models/models.dart';
import 'package:componente_application_2/screens/home_bar_screen%20copy.dart';
import 'package:componente_application_2/screens/screens.dart';
import 'package:flutter/material.dart';

class RouterApp {
  static const initiaRouter = 'home';

  static final menuOption = <MenuOption>[
    MenuOption(
      route: 'home',
      name: 'homeScreen',
      screen: const HomeScreen(),
      icon: Icons.home,
    ),
    MenuOption(
        route: 'login',
        name: 'login',
        screen: const LoginScreen(),
        icon: Icons.warning),
    MenuOption(
        route: 'home_usuario',
        name: 'home_usuario',
        screen: const AlertScreen(),
        icon: Icons.home),
    MenuOption(
        route: 'home_banda',
        name: 'home_banda',
        screen: const HomeBandaScreen(),
        icon: Icons.home_outlined),
    MenuOption(
        route: 'home_bar',
        name: 'home_bar',
        screen: const HomeBarScreen(),
        icon: Icons.home_outlined)
  ];
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final option in menuOption) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
