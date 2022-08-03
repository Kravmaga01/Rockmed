import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'screens.dart';

class MianPage extends StatelessWidget {
  const MianPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
          body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
                child: Text('El usuario o contraseña son incorretos'));
          } else if (snapshot.hasData) {
            return const VerifyEmaiglScreen();
          } else {
            return const LoginScreen();
          }
        },
      ));
}
