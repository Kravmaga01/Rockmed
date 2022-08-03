import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rock_med/screens/screens.dart';
import '../providers/providers.dart';
import '../themes/themes.dart';

//* ESTE SCREEN SE CREA A LA ESPERA DE LA CONFIRMACIÓN DEL CORREO
class VerifyEmaiglScreen extends StatefulWidget {
  const VerifyEmaiglScreen({Key? key}) : super(key: key); //*LLAVE

  @override
  State<VerifyEmaiglScreen> createState() =>
      _VerifyEmailScreenState(); //* ESTADO
}

class _VerifyEmailScreenState extends State<VerifyEmaiglScreen> {
  //TODO: VERIFICACIÓN DE DATODS

  bool isEmailVerified = false; //SE INICIA LA VALIDACIÓN EL FALSE
  bool canResendEmail = false; // SE INICIA EL RESEN EN FALSE
  Timer? timer; // ALMACENARA EL VALOR DEL TIEMPO DE ESPERA
  final emailController = TextEditingController(); // VALOR DEL EMAIL
  @override
  void initState() {
    //SOBRE ESCRITURA
    super.initState(); // SE INICIA LA EL CONSTRUCTOR SUPERIOR
    isEmailVerified = FirebaseAuth.instance.currentUser!
        .emailVerified; //  isEmailVerified  SE ALMACENA EL VALOR VERIFICADO DEL IMAIL
    if (!isEmailVerified) {
      // SI EL VALOR ES DIFERENTE
      sendVerificationEmail(); // SE ENVIA EL VALOR AL CORREO
      timer = Timer.periodic(
        // TIEMPO DE ESPERA DE VALIDACÓN DEL CORREO
        Duration(seconds: 3),
        (timer) => checkEmailVerified(),
      );
    }
  }

  void dispose() {
    //* SE HABILITA EL TIMER
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    // VERIFICA QUE SEA CORRECTO EL CORREO.
    await FirebaseAuth.instance.currentUser!.reload(); // SE ESPERA LA EJECUCIÓN
    setState(() {
      // SE EJECUTA EL ESTADO
      isEmailVerified = FirebaseAuth
          .instance.currentUser!.emailVerified; //RESPONDE A LA SOLICITUD
    });
  }

  Future sendVerificationEmail() async {
    // SI EL ESTADO ES CORRECTO SE RETORNA TRUE DE LA CONTRARIO FALSE
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

//TODO: INICIO DEL ESTILO

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
              //* SI  canResenEmal es valido  retornara  senverificationemail de lo contrario sera null
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
