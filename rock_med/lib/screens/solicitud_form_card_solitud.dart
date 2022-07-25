import 'package:flutter/material.dart';
import 'package:rock_med/themes/themes.dart';
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
                children: [
                  const EventFromImage(),
                  Positioned(
                      top: 60,
                      left: 20,
                      child: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(
                            Icons.arrow_back_outlined,
                            color: AppTheme.primary,
                          ))),
                  Positioned(
                      top: 60,
                      right: 20,
                      child: IconButton(
                          onPressed: () {
                            //TODo: falta
                          },
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            color: AppTheme.primary,
                          )))
                ],
              ),
              EventForm(),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              //Todo: implementarS
            },
            child: const Icon(Icons.save_outlined)));
  }
}

class EventForm extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final Map<String, dynamic> formValues = {
    'NombreEvento': 'NombreEvento',
    'Descripción': 'DescripCión',
    'Cover': false,
    'Fecha': 'FechaDelEvento',
    'IdBanda': 'Idbanda',
    'IdBar': 'IdBar'
  };
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: _buildBoxDecoretion(),
        width: double.infinity,
        child: Form(
            child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ConstuIpuntField(
                labelText: 'Nombre del evento ',
                keyboardKey: TextInputType.name,
                formProperty: 'NombreEvento',
                formValues: formValues),
            const SizedBox(
              height: 30,
            ),
            ConstuIpuntField(
                labelText: 'Descipción del evento',
                keyboardKey: TextInputType.name,
                formProperty: 'NombreEvento',
                formValues: formValues),
            const SizedBox(
              height: 30,
            ),
            SwitchListTile.adaptive(
                title: const Text('cover'),
                activeColor: AppTheme.primary,
                value: false,
                onChanged: (value) {
                  //Todo:Pendiente
                }),
            const SizedBox(
              height: 30,
            ),
            ConstuIpuntField(
              labelText: 'Fecha',
              keyboardKey: TextInputType.datetime,
              formProperty: 'Fecha',
              formValues: formValues,
            ),
          ],
        )),
      ),
    );
  }

  BoxDecoration _buildBoxDecoretion() => const BoxDecoration(
      color: Color.fromARGB(248, 0, 0, 0),
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
      boxShadow: [BoxShadow(color: AppTheme.fourth)]);
}
