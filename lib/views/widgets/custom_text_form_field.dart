import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.labelText,
    required this.keyboardType,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
  });

  final String labelText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  bool obscureText;
  Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        suffixIcon: suffixIcon ?? SizedBox(),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
