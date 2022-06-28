import 'package:componente_application_2/router/routersApp.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: RouterApp.initiaRouter,
        routes: RouterApp.getAppRoutes(),
        onGenerateRoute: RouterApp.onGenerateRoute);
  }
}
