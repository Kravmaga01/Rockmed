import 'package:flutter/material.dart';
import '../themes/themes.dart';
import '../widget/wiget.dart';

class SettingsEvent extends StatelessWidget {
  const SettingsEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const SideMenu(),
      body: Padding(
          padding: EdgeInsets.zero,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  ' Panel Eventos',
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primary),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Divider(),
                Container(
                  color: AppTheme.third,
                  child: ListTile(
                    leading: const Icon(Icons.event_available),
                    title: const Text(
                      'Eventos aceptados',
                      style: TextStyle(
                        color: AppTheme.primary,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  color: AppTheme.third,
                  child: ListTile(
                    leading: const Icon(Icons.event_busy),
                    title: const Text(
                      'Eventos Rechazados',
                      style: TextStyle(
                        color: AppTheme.primary,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  color: AppTheme.third,
                  child: ListTile(
                    leading: const Icon(Icons.event_repeat),
                    title: const Text(
                      'Actualizar Evento',
                      style: TextStyle(
                        color: AppTheme.primary,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  color: AppTheme.third,
                  child: ListTile(
                    leading: const Icon(Icons.social_distance_outlined),
                    title: const Text(
                      'Bandeja de solicitud evento',
                      style: TextStyle(
                        color: AppTheme.primary,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  color: AppTheme.third,
                  child: ListTile(
                    leading: const Icon(Icons.send),
                    title: const Text(
                      'Crear solicitud evento',
                      style: TextStyle(
                        color: AppTheme.primary,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                Image.asset(
                  'assets/logo.png',
                  height: 200,
                  width: 200,
                ),
              ],
            ),
          )),
    );
  }
}
