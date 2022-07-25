import 'package:flutter/material.dart';
import 'package:rock_med/widget/wiget.dart';

class EvenFormScreen extends StatelessWidget {
  const EvenFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: const [
              EventFromImage(),
            ],
          )
        ],
      ),
    ));
  }
}
