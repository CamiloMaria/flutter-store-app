import 'package:flutter/material.dart';

class CustomFormFieldWidget extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final bool obscureText;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final void Function(String?)? onSaved; // Add this line

  const CustomFormFieldWidget({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onSaved: onSaved,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
