import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:rock_med/providers/banda_service.dart';

import '../widget/wiget.dart';

// Esta clase es el login principal
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // lienzo
      body: SingleChildScrollView(
        // permite que se pueda hacer scroll cuando sale el teclado
        child: Padding(
          padding: const EdgeInsets.only(top: 100), // Style: padding del top
          child: Center(
            // centramos el formulario
            child: Form(
              // clase formulario que nos permite crear formulario
              child: Column(
                // para cer más organizados todo lo ponmos dentro de un una Column
                mainAxisAlignment: MainAxisAlignment
                    .center, // aliniación  vertical de la pantalla
                crossAxisAlignment: CrossAxisAlignment
                    .center, // alineación horizontal de la pantalla
                children: [
                  // el children nos permitira poder ingresar diversos wigets
                  Image.asset(
                    // imagen que viene en el paquekete de la aplicación
                    //logo principal
                    'assets/logo.png', // icono de la aplicación
                    height: 150,
                    width: 200,
                  ),
                  const SizedBox(
                    // espacio en blanco
                    height: 50,
                  ),
                  //const ConstuIpuntField(),
                  ChangeNotifierProvider(
                    // este chech notifica su si los validator esta bien y verifica si puede accerder a los permisos o no
                    create: (_) =>
                        LoginFormProvider(), // se intancia la claase login fromProvider
                    child: const LoginForm(), // le pasamos como hijo el login
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
