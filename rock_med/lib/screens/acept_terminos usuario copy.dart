import 'package:flutter/material.dart';
import 'package:rock_med/themes/themes.dart';

import '../themes/themes_standar.dart';
import '../widget/wiget.dart';

class AceptTerminosCreateUsuario extends StatelessWidget {
  const AceptTerminosCreateUsuario({Key? key}) : super(key: key);

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
                  'Te contamos que sólo podras registrar un perfil por Usuario',
                  style: TextStyle(fontSize: 25), textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                // espacio en blanco
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 9.0),
                child: Text(
                  // caja de texto
                  '¿Deseas continuar?',
                  style: TextStyle(fontSize: 25), textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                // espacio en blanco
                height: 10,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.info_outline),
                  color: Colors.blue,
                  iconSize: 50.5),
              const SizedBox(
                // espacio en blanco
                height: 20,
              ),
              Row(children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  child: ConstumenElevedButton(
                    value: "si",
                    ruta: 'creteProfileUsuario',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: ConstumenElevedButton(
                    value: 'No',
                    colorFuente: AppTheme.primary,
                    colorFondo: AppTheme.second,
                    ruta: 'welcome',
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
