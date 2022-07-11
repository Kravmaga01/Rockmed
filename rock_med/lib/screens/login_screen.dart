import 'package:rock_med/themes/themes.dart';
import 'package:flutter/material.dart';

// Esta clase es el login principal
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // lienzo
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Center(
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
                const Text(
                    // caja de texto
                    'Nombre usuario',
                    style: AppThemeText.style),
                const TextField(
                    // input
                    ),
                const Text(
                  // caja de texto
                  'Contraseña',
                  style: AppThemeText.style,
                ),
                const TextField(
                  // input
                  obscureText: true,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: AppTheme.primary,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: TextButton(
                      child: const Text('Sign In',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppTheme.second)),
                      onPressed: () =>
                          {Navigator.pushNamed(context, 'home_banda')},
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
