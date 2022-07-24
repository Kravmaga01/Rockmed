import 'package:flutter/material.dart';

import '../widget/wiget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);
  static const String routerName = 'SenttingScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // ignore: prefer_const_constructors
      drawer: SideMenu(),
      body: const Center(
        child: Text('SettingScreen'),
      ),
    );
  }
}
