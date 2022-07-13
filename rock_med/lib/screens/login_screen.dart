import 'package:rock_med/themes/themes.dart';
import 'package:flutter/material.dart';

import '../widget/wiget.dart';

// Esta clase es el login principal
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'nombre': 'Nombre del logeo',
      'contraseña': 'contraseña a confirmar',
    };
    return Scaffold(
      // lienzo
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Center(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    //logo principal
                    'assets/logo.png',
                    height: 150,
                    width: 200,
                  ),
                  const SizedBox(
                    // espacio en blanco
                    height: 50,
                  ),
                  //const ConstuIpuntField(),
                  const _loginForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _loginForm extends StatelessWidget {
  const _loginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // mantener la referencia con la key
        child: Form(
            child: Column(children: [
      TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(labelText: 'Nombre')),
      const SizedBox(
        // espacio en blanco
        height: 30,
      ),
      TextFormField(
          autocorrect: false,
          showCursor: true,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(labelText: 'Contraseña')),
      TextButton(
        child: const Text(
            // caja de texto
            'Olvide mis datos',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: AppTheme.second)),
        onPressed: () => {Navigator.pushNamed(context, 'recoveriPassword')},
      ),
      MaterialButton(
        // ignore: sort_child_properties_last
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            child: const Text(
              'login',
              style: TextStyle(color: AppTheme.second),
            )),
        onPressed: () {},
        color: AppTheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      )
    ])));
  }
}
