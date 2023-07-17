import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormFeild extends StatelessWidget {
  String? labelText;
  Widget? prefixIcon;
  void Function(String)? onChanged;
  String? hintText;
  Widget? suffixIcon;
  String? Function(String?)? validator;
  bool obscureText;

  CustomTextFormFeild({
    this.onChanged,
    super.key,
    this.validator,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade100),
        ),
        fillColor: Colors.white,
        filled: true,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            labelText: labelText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}