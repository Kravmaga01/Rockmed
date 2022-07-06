import 'package:flutter/material.dart';

class CreatePerfileBandaScreen extends StatelessWidget {
  const CreatePerfileBandaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Crear perfil banda'),
        ),
      ),
      body: const Center(
        child: Text('CreatePerfileScreen'),
      ),
    );
  }
}
