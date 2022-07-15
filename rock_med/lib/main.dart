import 'package:provider/provider.dart';
import 'package:rock_med/providers/banda_service.dart';
import 'package:rock_med/router/routersApp.dart';
import 'package:rock_med/themes/themes_standar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => BandaService())],
        child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: RouterApp.initiaRouter,
      routes: RouterApp.getAppRoutes(),
      onGenerateRoute: RouterApp.onGenerateRoute,
      theme: AppTheme.darkTheme,
    );
  }
}
