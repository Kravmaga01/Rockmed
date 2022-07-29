import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rock_med/themes/themes.dart';
import 'package:rock_med/widget/wiget.dart';

import '../services/services.dart';

class EvenFormScreen extends StatelessWidget {
  EvenFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventService = Provider.of<EventService>(context);
    return ChangeNotifierProvider(
      create: (_) => EventFromProvider(eventService.selecEvent),
      child: _EventFromScreenBody(eventService: eventService),
    );
  }
}

class _EventFromScreenBody extends StatelessWidget {
  _EventFromScreenBody({
    Key? key,
    required this.eventService,
  }) : super(key: key);

  final EventService eventService;

  @override
  Widget build(BuildContext context) {
    final eventForm = Provider.of<EventFromProvider>(context);
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  EventFromImage(eventService.selecEvent!.flayer),
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
            onPressed: () async {
              if (!eventForm.isValidFrom()) return;
              await eventService.seveOrCreateEvent(eventForm.event);
            },
            child: const Icon(Icons.save_outlined)));
  }
}

class EventForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventForm = Provider.of<EventFromProvider>(context);
    final event = eventForm.event;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: _buildBoxDecoretion(),
        width: double.infinity,
        child: Form(
            key: eventForm.formkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  initialValue: event!.nombre,
                  onChanged: (value) => event.nombre = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'el nombre es obligatorio';
                    }
                  },
                  keyboardType: TextInputType.name,
                  decoration:
                      const InputDecoration(labelText: 'Nombre del evento '),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  initialValue: event.descripcion,
                  onChanged: (value) => event.descripcion = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'la descripción es obligatoria';
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Descripción del evento '),
                ),
                const SizedBox(
                  height: 20,
                ),
                SwitchListTile.adaptive(
                    title: const Text('cover'),
                    activeColor: AppTheme.primary,
                    value: event.cover,
                    onChanged: eventForm.updateAvailability),
                const SizedBox(
                  height: 20,
                ),

                TextFormField(
                  // Este input debe ser diferente ya que con el validaremos y las contraseñas coinciden o no || si es menor de 8 digitos
                  initialValue: '${event.coverValor}',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,3}'))
                  ],
                  onChanged: (value) {
                    if (double.tryParse(value) == null) {
                      event.coverValor = 0;
                    } else {
                      event.coverValor = double.parse(value);
                    }
                  },

                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'valor del cover '),
                ),

                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  initialValue: event.fecha,
                  onChanged: (value) => event.fecha = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'la fecha obligatoria';
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'Fecha del evento'),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  initialValue: event.remitente,
                  onChanged: (value) => event.remitente = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El remitente es obligatorio';
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Remitente'),
                ),
                const SizedBox(
                  height: 60,
                ),

                //Todo: falta implementar el flayer .
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
