import 'package:flutter/material.dart';
import 'package:rock_med/themes/themes.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        _DrawerHeader(),
        ListTile(
          leading: const Icon(Icons.photo_outlined),
          title: const Text(
            'galeria',
            style: TextStyle(
              color: AppTheme.primary,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.description),
          title: const Text(
            'Descripción',
            style: TextStyle(
              color: AppTheme.primary,
            ),
          ),
          onTap: () {
            Navigator.popAndPushNamed(context, 'descripcion');
          },
        ),
        ListTile(
          leading: const Icon(Icons.event_note_outlined),
          title: const Text(
            'Opciones Evento',
            style: TextStyle(
              color: AppTheme.primary,
            ),
          ),
          onTap: () {
            Navigator.popAndPushNamed(context, 'settingsEvent');
          },
        ),
        ListTile(
          leading: const Icon(Icons.info_rounded),
          title: const Text(
            'Opciones Avanzadas ',
            style: TextStyle(
              color: AppTheme.primary,
            ),
          ),
          onTap: () {
            Navigator.popAndPushNamed(context, 'settings');
          },
        ),
      ],
    ));
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/drawer.jpeg'), fit: BoxFit.cover)),
      child: Container(),
    );
  }
}
