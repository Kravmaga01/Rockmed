//todo : El mian es el archivo principal de nuestra aplicación.

import 'package:provider/provider.dart';
import 'package:rock_med/providers/providers.dart';
import 'package:rock_med/router/routersApp.dart';
import 'package:rock_med/themes/themes_standar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'services/event_service.dart';
import 'shere_preferences/preferences.dart';

//* ejecucion del main

//!importante
void main() async {
  // espera a que inicialice la base de datos y la aplicacción
  WidgetsFlutterBinding(); // este wiget nos sirve para indicar que debe de esperar para constuir los wiget asincornos
  await Firebase
      .initializeApp(); // inicializamos la aplicación creada en firebase
  await Preferences
      .init(); // se inician las preferencias de usuario al macenadas de manera local
  runApp(const AppStete()); // se corre  el appstate
}

//Todo: El appstate inicializa la realdtabase que nos permitira modelar los datos en tiempo real

class AppStete extends StatelessWidget {
  const AppStete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // multiProvider para permitir diferentes provider de ser necesario
      providers: [
        ChangeNotifierProvider(create: (_) => EventService())
      ], //! verifica que la conexión a la base de datos sea correcta enviando el contexto
      child: const MyApp(), // si la noticiación es correcta se corre la app
    );
  }
}

final navigatorKey =
    GlobalKey<NavigatorState>(); //! la navigatorKey sera la llave global

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils
          .messengerKey, // Permitira capturar un error y arrojarlo como un snackbar
      navigatorKey: navigatorKey, // la llave global para mantner estados
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: RouterApp.initiaRouter, // ruta inical
      routes: RouterApp.getAppRoutes(), // almacenas las rutas exitentes
      onGenerateRoute:
          RouterApp.onGenerateRoute, // genera las rutas exitentes para el uso
      theme: AppTheme.darkTheme, // temas principal.
    );
  }
}
