import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rock_med/widget/wiget.dart';
import '../themes/themes.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  Future singIN() async {}
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
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
                            .unfocus(); // esta funciona permitira esconder el teclado en caso de que opriman el bottón
                        if (!loginForm.isValidForm()) return;
                        loginForm.isloading =
                            true; // se le envia el valor true a isloading para ejecutar el cambio de texto
                        Navigator.pushReplacementNamed(context, 'home_banda');
                      },
                color: AppTheme.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              )
            ])));
  }
}
