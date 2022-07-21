import 'package:flutter/material.dart';
import 'package:rock_med/themes/themes.dart';
import 'package:rock_med/widget/wiget.dart';

import '../themes/themes_standar.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // lienzo
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                // espacio en blanco
                height: 50,
              ),
              Image.asset(
                //logo principal
                'assets/logo.png',
                height: 200,
              ),
              const SizedBox(
                // espacio en blanco
                height: 40,
              ),
              const Text(
                // caja de texto
                'RockMed',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: AppTheme.primary),
              ),
              const SizedBox(
                // espacio en blanco
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 9.0),
                child: Text(
                  // caja de texto
                  '¿Ya estás registrado en nuestra comunidad? o ¿Estás empezando tu viaje y quieres crear tu cuenta?',
                  style: TextStyle(fontSize: 25), textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                // espacio en blanco
                height: 50,
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: ConstumenElevedButton(
                        value: 'inciar sesión', ruta: 'Mianpage'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: ConstumenElevedButton(
                      value: 'Crear cuenta',
                      ruta: 'selectProfile',
                      colorFondo: AppTheme.second,
                      colorFuente: AppTheme.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
