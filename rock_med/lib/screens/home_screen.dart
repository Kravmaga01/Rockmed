import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widget/wiget.dart';

class HomeBandaScreen extends StatelessWidget {
  const HomeBandaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Homescreen(user: user, onClicked: () {}),
    );
  }
}
