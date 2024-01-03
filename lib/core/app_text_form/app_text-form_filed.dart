import 'package:flutter/material.dart';

class TextFiledApp extends StatelessWidget {
  const TextFiledApp({super.key,
  required this.controller,
  required this.type,
     this.prefix,
  required this.label,
   required this.obscurePassword,
     this.suffix,
     this.validate,
    this.onTap,
    this.onchange,
  });
  final TextEditingController  controller;
  final TextInputType type;
  final String  label;
  final IconData ? prefix;
  final bool   obscurePassword;
  final  IconData ? suffix;
  final Function ? validate;
   final void   Function() ? onTap;
   final void Function(String value) ? onchange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap ,
      onChanged: onchange ,
      cursorColor: Colors.green,
    controller: controller,
      keyboardType: type,
      obscureText: obscurePassword,
      validator: (value) => validate!(value),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefix != null ? Icon(prefix) : null,
        suffixIcon: suffix != null ? Icon(suffix) : null,
        border: const OutlineInputBorder(),

      ),
    );
  }
}
