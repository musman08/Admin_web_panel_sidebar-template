import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {super.key,
      this.suffixIcon,
      this.prefixIcon,
      this.hintText,
      this.keyboardType,
      this.controller,
        this.maxLines,
      this.validator});

  final TextInputType? keyboardType;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      cursorColor: Colors.black,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: Icon(suffixIcon),
        hintText: hintText,
      ),
      validator: validator,
    );
  }
}
