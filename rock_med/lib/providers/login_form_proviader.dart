import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  // este sera el controlador de nuesto formulario de login
  GlobalKey<FormState> formKey = GlobalKey<
      FormState>(); // necesitmaos almacenar la key del formulario y el estado.

  String nick =
      ""; // al macenaremos el string  nick del usuario que nos ingresan el input
  String password =
      ""; // al macenaremos el string  password del usuario que nos ingresan el input

  late bool isLoading = false;

  bool isValidForm() {
    // esta función returna un buleano, si es true la validación es correcta de lo contrario activa las validaciones
    print(formKey.currentState?.validate());
    print('$password-$nick');

    return formKey.currentState?.validate() ?? false;
  }
}
