import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rock_med/providers/providers.dart';
import 'package:rock_med/themes/themes.dart';
import 'package:rock_med/widget/wiget.dart';

import '../main.dart';
import '../models/models.dart';

class CreateProfileBarScreen extends StatefulWidget {
  const CreateProfileBarScreen({Key? key}) : super(key: key);

  @override
  State<CreateProfileBarScreen> createState() => _CreateProfileBarScreenState();
}

class _CreateProfileBarScreenState extends State<CreateProfileBarScreen> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    Map<String, String> formValues = ModelFormValuesBar();
    final emailController =
        TextEditingController(); // se genera un controlador de texto
    final passwordController =
        TextEditingController(); // tanto para el mail como el password
    @override
    void dispose() {
      // de esta manera podemos manetener el estado del controller.

      emailController.dispose();
      passwordController.dispose();
      super.dispose();
    }

    Future singUP() async {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ));
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
      } on FirebaseAuthException catch (e) {
        //todo: se debe lanzar una alerta con el error capturado,
        print(e);
        Utils.showSnackBar(e.message);
      }

      // Navegador con contexto trabajando
      navigatorKey.currentState!.popAndPushNamed('Mianpage');
    }

    String? validatorPasword;
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: formBar(formKey, formValues, emailController, validatorPasword,
            passwordController, context, singUP),
      ),
    ));
  }

  //Todo: inicio del formulario.

  Form formBar(
      GlobalKey<FormState> formKey,
      Map<String, String> formValues,
      TextEditingController emailController,
      String? validatorPasword,
      TextEditingController passwordController,
      BuildContext context,
      Future<dynamic> singUP()) {
    return Form(
      // la auto  validación se dispara con la interacción del usuario
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            // espacio en blanco
            height: 50,
          ),
          const Text('Crea tu perfil bar',
              style: AppThemeText.styleTitle, textAlign: TextAlign.center),
          const SizedBox(height: 30),
          ConstuIpuntField(
            labelText: 'Nombre',
            keyboardKey: TextInputType.name,
            formProperty: 'Nombre',
            formValues: formValues,
          ),
          const SizedBox(height: 30),

          // Este text fromFiled debe ser diferente al resto por el echo de que devemos validar si es un correo valido
          TextFormField(
            controller: emailController,
            autocorrect: false,
            showCursor: true,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: 'Correo'),
            validator: (value) {
              // esto es un exprexion regular que me permitira saber si el correo es valdio
              String
                  pattern = // esto se denomina expreción regular, nos permitira validar si es un correo valido
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ??
                      '') //se utiliza el operador ternario para preguntar si se cumple la condicion retorne null de lo contrario retorne el estring
                  ? null
                  : "El formato ingresado no es permitido, porfavot verifique ";
            },
            onChanged: (value) => formValues['Correo'] = value,
          ),
          const SizedBox(height: 30),
          TextFormField(
              // Este input debe ser diferente ya que con el validaremos y las contraseñas coinciden o no || si es menor de 8 digitos
              obscureText: true,
              autocorrect: false,
              showCursor: true,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              validator: (value) {
                validatorPasword = value;
                // esto es un exprexion regular que me permitira saber si el correo es valdi
                return (value != null && value.length >= 8)
                    ? null
                    : 'la contraseña debe ser mayo de 8 caracteres';
              }),
          const SizedBox(height: 30),
          TextFormField(
            controller: passwordController,
            // Este input debe ser diferente ya que con el validaremos y las contraseñas coinciden o no || si es menor de 8 digitos
            obscureText: true,
            autocorrect: false,
            showCursor: true,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(labelText: 'Validar Contraseña '),
            validator: (value) {
              // Este expreción nos permite validar si la contraseña coniciden
              return (value != null && value == validatorPasword)
                  ? null
                  : ' La contraseña no coniciden ';
            },
            onChanged: (value) => formValues['Password'] = value,
          ),
          const SizedBox(height: 30),
          ConstuIpuntField(
            labelText: 'Ubicacion',
            keyboardKey: TextInputType.text,
            formProperty: 'Ubicacion',
            formValues: formValues,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              FocusScope.of(context).requestFocus(FocusNode());
              if (!formKey.currentState!.validate()) {
                return;
              }
              BarService.instance.add(formValues);
              singUP();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppTheme.primary),
            ),
            child: const SizedBox(
                width: double.infinity, child: Center(child: Text('Crear'))),
          ),
        ],
      ),
    );
  }
}
