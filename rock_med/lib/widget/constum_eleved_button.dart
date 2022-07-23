import 'package:flutter/material.dart';

import '../themes/themes_standar.dart';

class ConstumenElevedButton extends StatelessWidget {
  final String value;
  final Color? colorFondo;
  final Color? colorFuente;
  final String ruta;
  const ConstumenElevedButton({
    Key? key,
    required this.value,
    this.colorFondo = AppTheme.primary,
    this.colorFuente = AppTheme.second,
    required this.ruta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {Navigator.pushNamed(context, ruta)},
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(colorFondo)),
      child: Text(value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: colorFuente,
          )),
    );
  }
}
