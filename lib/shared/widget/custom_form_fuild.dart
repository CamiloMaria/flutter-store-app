import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final bool obscureText;
  final IconData? suffixIcon;

  const CustomFormField({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
      keyboardType: obscureText ? TextInputType.text : TextInputType.emailAddress,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
