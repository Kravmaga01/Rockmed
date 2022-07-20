import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rock_med/providers/providers.dart';
import 'package:rock_med/widget/wiget.dart';
import '../main.dart';
import '../themes/themes.dart';

class LoginForm extends StatefulWidget {
  // se necesita que mantenga el estado.
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState(); // se crea el estado
}

class _LoginFormState extends State<LoginForm> {
  // se crea la clase estado
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

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      // mantener la referencia con la key

      child: Form(
          key: loginForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(children: [
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
                onChanged: (value) {}),
            const SizedBox(
              // espacio en blanco
              height: 30,
            ),
            TextFormField(
              controller: passwordController,
              autocorrect: false,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              validator: (value) {
                // esto es un exprexion regular que me permitira saber si el correo es valdio
                return (value != null && value.length >= 8)
                    ? null
                    : 'la contraseña es incorrecta porfavor verifique ';
              },
              onChanged: (value) => loginForm.password = value,
            ),
            TextButton(
              style: ButtonStyle(
                  // esete shepe hara el una animación al dar tap sobre el texto
                  shape: MaterialStateProperty.all(StadiumBorder())),
              onPressed: () =>
                  {Navigator.pushNamed(context, 'recoveriPassword')},
              child: const Text(
                  // caja de texto
                  'Olvide mis datos',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: AppTheme.second,
                  )),
            ),
            MaterialButton(
              // ignore: sort_child_properties_last
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    // se pregunta si esta cargando entonces el texto del botón cambie a espere, mientras se ejecuta las función.z
                    loginForm.isloading ? 'Espere...' : 'login',
                    style: const TextStyle(color: AppTheme.second),
                  )),
              onPressed: loginForm.isloading
                  ? null
                  : () async {
                      // se creo la condicón de que si estaba cargando bloquee el botón de lo contrario ejecute la acción
                      FocusScope.of(context)
                          .unfocus(); // esta funciona permitif (!loginForm.isValidForm()) return;
                      singIN();
                      // esta funciona permitira esconder el teclado en caso de que opriman el bottón
                      if (!loginForm.isValidForm()) return;
                    },
              color: AppTheme.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            )
          ])),
    );
  }

  Future singIN() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      //todo: se debe lanzar una alerta con el error capturado,
      print(e);
    }

    // Navegador con contexto trabajando
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
