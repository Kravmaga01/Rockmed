import 'dart:async';
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rock_med/screens/screens.dart';

import '../providers/providers.dart';
import '../themes/themes.dart';

class VerifyEmaiglScreen extends StatefulWidget {
  const VerifyEmaiglScreen({Key? key}) : super(key: key);

  @override
  State<VerifyEmaiglScreen> createState() => _VerifyEmaiglScreenState();
}

class _VerifyEmaiglScreenState extends State<VerifyEmaiglScreen> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(
        Duration(seconds: 3),
        (timer) => checkEmailVerified(),
      );
    }
  }

  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const HomeBandaScreen()
      : Scaffold(
          body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              // imagen que viene en el paquekete de la aplicación
              //logo principal
              'assets/logo.png', // icono de la aplicación
              height: 300,
              width: 200,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Verifica el Correo para continuar con tu registro',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                )),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppTheme.primary),
              ),
              icon: const Icon(Icons.email, size: 32),
              label: const Text('Reenviar verificación'),
              onPressed: canResendEmail ? sendVerificationEmail : null,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () => FirebaseAuth.instance.signOut(),
                child: const Text(
                  'Cancel',
                  style: TextStyle(fontSize: 24, color: AppTheme.primary),
                ))
          ],
        ));
}
