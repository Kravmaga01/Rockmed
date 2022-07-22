import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rock_med/screens/screens.dart';

import '../providers/providers.dart';

class VerifyEmaiglScreen extends StatefulWidget {
  const VerifyEmaiglScreen({Key? key}) : super(key: key);

  @override
  State<VerifyEmaiglScreen> createState() => _VerifyEmaiglScreenState();
}

class _VerifyEmaiglScreenState extends State<VerifyEmaiglScreen> {
  bool isEmailVerified = false;
  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();
    }
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const HomeBandaScreen()
      : Scaffold(
          appBar: AppBar(
            title: const Text('Verify Email'),
          ),
        );
}
