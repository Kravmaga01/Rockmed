import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rock_med/themes/themes.dart';

import '../widget/wiget.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  static const String routerName = 'SenttingScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // ignore: prefer_const_constructors
      drawer: SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Ajustes',
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary),
            ),
            const Divider(),
            SwitchListTile.adaptive(
                value: true,
                title: const Text('Darkmode'),
                onChanged: (value) {}),
            const Divider(),
            ElevatedButton(
                onPressed: () {}, child: const Text('Eliminar cuenta'))
          ],
        )),
      ),
    );
  }
}
