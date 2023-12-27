import 'package:flutter/material.dart';

class TextFiledApp extends StatelessWidget {
  const TextFiledApp({super.key,
  required this.controller,
  required this.type,
     this.prefix,
  required this.label,
   required this.obscurePassword,
     this.suffix,
    required this.validate,
    this.onTap,
  });
  final TextEditingController  controller;
  final TextInputType type;
  final String  label;
  final IconData ? prefix;
  final bool   obscurePassword;
  final  IconData ? suffix;
  final Function  validate;
   final void   Function() ? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap ,
      cursorColor: Colors.orangeAccent,
    controller: controller,
      keyboardType: type,
      obscureText: obscurePassword,
      validator: (value) => validate(value),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefix != null ? Icon(prefix) : null,
        suffixIcon: suffix != null ? Icon(suffix) : null,
        border: const OutlineInputBorder(),

      ),
    );
  }
}
