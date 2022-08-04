import 'package:flutter/material.dart';
import 'package:rock_med/shere_preferences/preferences.dart';

class ConstuIpuntField extends StatelessWidget {
  final String? hinTexT;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardKey;
  final bool obscureText;
  final String formProperty;
  final Map<String, dynamic> formValues;
  final TextEditingController? controller;
  final String? initialValue;
  Function(String)? onChanged;
  final int? maxLines;

  ConstuIpuntField(
      {Key? key,
      this.hinTexT,
      this.labelText,
      this.helperText,
      this.icon,
      this.onChanged,
      this.suffixIcon,
      this.keyboardKey,
      this.obscureText = false,
      required this.formProperty,
      required this.formValues,
      this.controller,
      this.initialValue,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // input
      initialValue: initialValue,
      maxLines: maxLines,
      obscureText: obscureText,
      keyboardType: keyboardKey,
      textCapitalization: TextCapitalization.words,
      autofocus: true,
      controller: controller,
      onChanged: (value) {
        Preferences.coverImagePath =
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSowTP0SBYzj5tuN3mFfspHeeLPuaDGSy4E-W4IzEqfZw&s';
        Preferences.imagePath =
            'https://brandstrat.co/wp-content/uploads/2022/01/blank-profile-picture-gd2f1d32bd_1280.png';
        Preferences.name = formValues['Nombre'];
        Preferences.direccion = formValues['Correo'];
        Preferences.about = formValues['About'];
        Preferences.isDarkmode = true;
        formValues[formProperty] = value;
      },
      validator: (value) {
        if (value == null) return 'Este campor es requerido';
        return value.isEmpty ? 'los campos son requeridos' : null;
      },

      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          hintText: hinTexT,
          labelText: labelText,
          helperText: helperText,
          icon: icon == null ? null : Icon(icon),
          suffixIcon: suffixIcon == null ? null : Icon(icon)),
    );
  }
}
