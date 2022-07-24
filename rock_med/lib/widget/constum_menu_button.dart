import 'package:flutter/material.dart';
import 'package:rock_med/widget/wiget.dart';

import '../themes/themes.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.contumenButom,
  }) : super(key: key);

  final double contumenButom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Container(
        decoration: const BoxDecoration(
            color: AppTheme.second,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            )),
        height: 50,
        child: Row(
            // para cer más organizados todo lo ponmos dentro de un una Column
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // aliniación  vertical de la pantalla
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => const AboutScreen(),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppTheme.primary),
                ),
                child: SizedBox(
                    width: contumenButom,
                    child: const Center(child: Text('Crear'))),
              ),
              ElevatedButton(
                onPressed: () => const GaleryScreen(),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppTheme.primary),
                ),
                child: SizedBox(
                    width: contumenButom,
                    child: const Center(child: Text('Crear'))),
              ),
              ElevatedButton(
                onPressed: () => EventScreen,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppTheme.primary),
                ),
                child: SizedBox(
                    width: contumenButom,
                    child: const Center(child: Text('Crear'))),
              ),
            ]),
      ),
    );
  }
}
