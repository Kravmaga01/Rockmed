import 'package:firebase_auth/firebase_auth.dart';
import 'package:rock_med/router/routersApp.dart';
import 'package:rock_med/screens/screens.dart';
import 'package:rock_med/themes/themes_standar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: RouterApp.initiaRouter,
      routes: RouterApp.getAppRoutes(),
      onGenerateRoute: RouterApp.onGenerateRoute,
      theme: AppTheme.darkTheme,
    );
  }
}
