import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeBandaScreen extends StatelessWidget {
  const HomeBandaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Banda Home'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Ingreso como  ',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Center(
                  child: Text(
                User.email!,
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
          ),
        ),
      ),
    );
  }
}
