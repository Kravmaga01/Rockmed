import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rock_med/widget/wiget.dart';

import '../themes/themes.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

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
                autocorrect: false,
                showCursor: true,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  return (value != null)
                      ? null
                      : 'Porfavor ingrese su nombre de usuario ';
                },
                onChanged: (value) => loginForm.nick = value,
              ),
              const SizedBox(
                // espacio en blanco
                height: 30,
              ),
              TextFormField(
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
                child: const Text(
                    // caja de texto
                    'Olvide mis datos',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: AppTheme.second)),
                onPressed: () =>
                    {Navigator.pushNamed(context, 'recoveriPassword')},
              ),
              MaterialButton(
                // ignore: sort_child_properties_last
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    child: const Text(
                      'login',
                      style: TextStyle(color: AppTheme.second),
                    )),
                onPressed: () {
                  if (!loginForm.isValidForm()) return;
                  loginForm.isValidForm();
                  Navigator.pushReplacementNamed(context, 'home_banda');
                },
                color: AppTheme.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              )
            ])));
  }
}
