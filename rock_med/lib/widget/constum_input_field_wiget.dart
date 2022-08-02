import 'package:flutter/material.dart';
import 'package:rock_med/models/model_user.dart';
import 'package:rock_med/services/services.dart';

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
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // input
      initialValue: initialValue,
      obscureText: obscureText,
      keyboardType: keyboardKey,
      textCapitalization: TextCapitalization.words,
      autofocus: true,
      controller: controller,
      onChanged: (value) {
        UserPreferences.myUser = UserPrefrence(
            'https://images.pexels.com/photos/925743/pexels-photo-925743.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
            'https://brandstrat.co/wp-content/uploads/2022/01/blank-profile-picture-gd2f1d32bd_1280.png',
            formValues['Nombre'],
            formValues['Correo'],
            '');
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
