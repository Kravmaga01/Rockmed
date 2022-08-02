import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../themes/themes.dart';

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
                  keyboardType: TextInputType.text,
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
                  keyboardType: TextInputType.datetime,
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
                  keyboardType: TextInputType.text,
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
