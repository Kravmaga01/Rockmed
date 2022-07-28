//Todo: Imagen del fromulario de eventos

import 'package:flutter/material.dart';
import 'package:rock_med/themes/themes.dart';

class EventFromImage extends StatelessWidget {
  final String? url;
  const EventFromImage(this.url);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: _buildBoxDecoretion(),
        height: 400,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          child: url == null
              ? const Image(
                  image: AssetImage('assets/no-image.jpg'),
                  fit: BoxFit.cover,
                )
              : FadeInImage(
                  image: NetworkImage(this.url!),
                  placeholder: const AssetImage('assets/placeholder-title.gif'),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoretion() => const BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          boxShadow: [
            BoxShadow(
                color: AppTheme.third, blurRadius: 10, offset: Offset(0, 5))
          ]);
}
