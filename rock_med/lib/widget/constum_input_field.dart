import 'package:flutter/material.dart';

class ConstuIpuntField extends StatelessWidget {
  final String? hinTexT;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardKey;
  final bool obscureText;
  final String formProperty;
  final Map<String, String> formValues;
  final TextEditingController? controller;
  const ConstuIpuntField(
      {Key? key,
      this.hinTexT,
      this.labelText,
      this.helperText,
      this.icon,
      this.suffixIcon,
      this.keyboardKey,
      this.obscureText = false,
      required this.formProperty,
      required this.formValues,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // input
      obscureText: obscureText,
      keyboardType: keyboardKey,
      textCapitalization: TextCapitalization.words,
      autofocus: true,
      controller: controller,
      onChanged: (value) => formValues[formProperty] = value,
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
