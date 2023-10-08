import 'package:flutter/material.dart';

class CommonTextFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final String labelText;

  const CommonTextFormFiled(
      {super.key,
      required this.controller,
      required this.labelText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.black))),
    );
  }
}
