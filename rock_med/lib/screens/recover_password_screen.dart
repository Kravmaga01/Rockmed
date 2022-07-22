import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../themes/themes.dart';

class RecoverPasswordScreen extends StatefulWidget {
  const RecoverPasswordScreen({Key? key}) : super(key: key);

  @override
  State<RecoverPasswordScreen> createState() => _RecoverPasswordScreenState();
}

class _RecoverPasswordScreenState extends State<RecoverPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // aliniación  vertical de la pantalla
                  crossAxisAlignment: CrossAxisAlignment
                      .center, // alineación horizontal de la pantalla
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      // imagen que viene en el paquekete de la aplicación
                      //logo principal
                      'assets/logo.png', // icono de la aplicación
                      height: 150,
                      width: 200,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Digita el correo que ingresaste al crear tu cuenta \n te enviaremos  toda tu información de acceso a la plataforma',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: emailController,
                      autocorrect: false,
                      showCursor: true,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        // esto es un exprexion regular que me permitira saber si el correo es valido
                        String
                            pattern = // esto se denomina expreción regular, nos permitira validar si es un correo valido
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regExp = RegExp(pattern);
                        return regExp.hasMatch(value ??
                                '') //se utiliza el operador ternario para preguntar si se cumple la condicion retorne null de lo contrario retorne el estring
                            ? null
                            : "El formato ingresado no es permitido, porfavot verifique ";
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        resertPassword();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppTheme.primary),
                      ),
                      child: const SizedBox(
                          width: double.infinity,
                          child: Center(child: Text('Crear'))),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Future resertPassword() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      Utils.showSnackBar('Password reset Email sent');
      Navigator.of(context).popAndPushNamed('welcome');
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }
}
