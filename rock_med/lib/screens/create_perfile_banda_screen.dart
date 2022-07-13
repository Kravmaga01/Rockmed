import 'package:flutter/material.dart';
import 'package:rock_med/models/model_banda.dart';
import '../themes/themes.dart';
import '../widget/wiget.dart';

class CreatePerfileBandaScreen extends StatelessWidget {
  CreatePerfileBandaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'Nombre': 'NombreBanda',
      'Correo': 'CorreoBanda',
      'Contraseña': 'contraseña',
      'genero': 'Genero musical'
    };
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                // espacio en blanco
                height: 50,
              ),
              const Text('Crea tu perfil banda',
                  style: AppThemeText.styleTitle, textAlign: TextAlign.center),
              const SizedBox(height: 30),
              ConstuIpuntField(
                labelText: 'Nombre',
                keyboardKey: TextInputType.name,
                formProperty: 'Nombre',
                formValues: formValues,
              ),
              const SizedBox(height: 30),
              ConstuIpuntField(
                labelText: 'Correo',
                keyboardKey: TextInputType.emailAddress,
                formProperty: 'Correo',
                formValues: formValues,
              ),
              const SizedBox(height: 30),
              ConstuIpuntField(
                labelText: 'Contrseña',
                obscureText: true,
                formProperty: 'Contraseña',
                formValues: formValues,
              ),
              const SizedBox(height: 30),
              ConstuIpuntField(
                labelText: 'Genero Musical',
                keyboardKey: TextInputType.text,
                formProperty: 'Genero',
                formValues: formValues,
              ),
              ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (!formKey.currentState!.validate()) {
                    return;
                  }
                  print(formValues);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppTheme.primary),
                ),
                child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Crear'))),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
