import 'package:rock_med/themes/themes.dart';
import 'package:rock_med/themes/themes_standar.dart';
import 'package:flutter/material.dart';
import 'package:rock_med/widget/wiget.dart';

class SelectProfileScreen extends StatelessWidget {
  const SelectProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const Text(
                // caja de texto
                'Antes de crear una tu perfil en nuestra plataforma, dinos que tipo de cuenta deseas crear:',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                // espacio en blanco
                height: 50,
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 70),
                    child: ConstumenElevedButton(
                      value: 'Banda',
                      ruta: 'acept_terminos_create_banda',
                      colorFondo: AppTheme.second,
                      colorFuente: AppTheme.primary,
                    ),
                  ),
                  ConstumenElevedButton(
                    value: 'Bar',
                    ruta: 'acept_terminos_create_bar',
                    colorFondo: AppTheme.second,
                    colorFuente: AppTheme.primary,
                  )
                ],
              ),
              const SizedBox(
                // espacio en blanco
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 90),
                child: ConstumenElevedButton(
                  value: 'Usuario',
                  ruta: 'acept_terminos_create_usuario',
                  colorFondo: AppTheme.second,
                  colorFuente: AppTheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
