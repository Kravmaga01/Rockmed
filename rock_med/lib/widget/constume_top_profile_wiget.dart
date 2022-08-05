import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rock_med/themes/themes.dart';

class ProfileWidget extends StatelessWidget {
  final String coverImagePath;
  final String imagePath;
  final VoidCallback? onClicked;
  final bool isEdit;

  const ProfileWidget(
      {Key? key,
      required this.imagePath,
      this.onClicked,
      required this.coverImagePath,
      required this.isEdit})
      : super(key: key);
  final double coverHeight = 280;
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Center(
      child: Column(
        children: [
          Stack(children: [
            buildImage(),
            Positioned(bottom: 0, right: 4, child: buildEditiIcon(color)),
          ])
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = imagePath.startsWith('http')
        ? NetworkImage(imagePath)
        : FileImage(File(imagePath.toString()));

    return ClipOval(
      child: Material(
          color: Colors.transparent,
          child: Ink.image(
            image: image as ImageProvider,
            fit: BoxFit.cover,
            width: 110,
            height: 110,
            child: InkWell(
              onTap: onClicked,
            ),
          )),
    );
  }

  Widget buildEditiIcon(Color color) => buildCircle(
        color: AppTheme.second,
        all: 3,
        child: buildCircle(
          color: AppTheme.primary,
          all: 8,
          child: Icon(
            isEdit ? Icons.add_a_photo : Icons.edit,
            color: AppTheme.second,
            size: 20,
          ),
        ),
      );

  Widget buildCircle(
          {required Widget child, required double all, required Color color}) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
