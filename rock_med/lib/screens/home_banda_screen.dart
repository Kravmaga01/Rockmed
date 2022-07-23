import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/wiget.dart';

class HomeBandaScreen extends StatelessWidget {
  const HomeBandaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Homescreen(user: user),
    );
  }
}

class Homes2creen extends StatelessWidget {
  const Homes2creen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Ingreso como  ',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        Center(
            child: Text(
          user.email!,
          style: const TextStyle(
            fontSize: 24,
          ),
        )),
        const SizedBox(height: 25),
        ElevatedButton.icon(
          onPressed: () => FirebaseAuth.instance.signOut(),
          icon: const Icon(Icons.arrow_back, size: 32),
          style: ElevatedButton.styleFrom(
            maximumSize: const Size.fromHeight(50),
          ),
          label: const Text(
            'Sign Out',
            style: TextStyle(fontSize: 24),
          ),
        )
      ],
    );
  }
}
