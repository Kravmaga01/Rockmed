import 'package:rock_med/models/routers.dart';
import 'package:rock_med/screens/screens.dart';
import 'package:flutter/material.dart';

class RouterApp {
  //Todo: Cambiar la ruta inical por  'Mianpage'
  static const initiaRouter = 'home';

  static final menuOption = <RoutersOption>[
    RoutersOption(
        route: 'welcome',
        name: 'welcomeScreen',
        screen: const WelcomeScreen(),
        icon: Icons.security),
    RoutersOption(
        route: 'selectProfile',
        name: 'profile',
        screen: const SelectProfileScreen(),
        icon: Icons.circle),
    RoutersOption(
        route: 'login',
        name: 'login',
        screen: const LoginScreen(),
        icon: Icons.warning),
    RoutersOption(
        route: 'recoveriPassword',
        name: 'recoveriPassword',
        screen: const RecoverPasswordScreen(),
        icon: Icons.warning),
    RoutersOption(
        route: 'alertPassword',
        name: 'alertPassword',
        screen: const AlertRecoveriScreen(),
        icon: Icons.warning),
    RoutersOption(
        route: 'creteProfileBanda',
        name: 'createProfilebanda',
        screen: CreatePerfileBandaScreen(),
        icon: Icons.create),
    RoutersOption(
        route: 'creteProfileBar',
        name: 'createProfilebar',
        screen: CreateProfileBarScreen(),
        icon: Icons.create),
    RoutersOption(
        route: 'creteProfileUsuario',
        name: 'createProfileUsuario',
        screen: CreateProfileUsuarioScreen(),
        icon: Icons.create),
    RoutersOption(
      route: 'home',
      name: 'homeScreen',
      screen: const HomeScreen(),
      icon: Icons.home,
    ),
    RoutersOption(
        route: 'home_usuario',
        name: 'home_usuario',
        screen: const HomeUsuarioScreen(),
        icon: Icons.home),
    RoutersOption(
        route: 'home_banda',
        name: 'home_banda',
        screen: const HomeBandaScreen(),
        icon: Icons.home_outlined),
    RoutersOption(
        route: 'home_bar',
        name: 'home_bar',
        screen: const HomeBarScreen(),
        icon: Icons.home_outlined),
    RoutersOption(
        route: 'Mianpage',
        name: 'Mainpage',
        screen: const MianPage(),
        icon: Icons.home_outlined),
    RoutersOption(
        route: 'acept_terminos_create_banda',
        name: 'acept_terminos_create_banda',
        screen: const AceptTerminosCreatebanda(),
        icon: Icons.home_outlined),
    RoutersOption(
        route: 'acept_terminos_create_bar',
        name: 'acept_terminos_create_bar',
        screen: const AceptTerminosCreatebar(),
        icon: Icons.home_outlined),
    RoutersOption(
        route: 'acept_terminos_create_usuario',
        name: 'acept_terminos_create_usuario',
        screen: const AceptTerminosCreateUsuario(),
        icon: Icons.home_outlined),
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
