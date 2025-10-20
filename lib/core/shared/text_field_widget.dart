import 'package:flutter/material.dart';
import 'package:phirus/core/theme/colors_manager.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.text,
    this.isPassword = false,
    required this.controller,
  });
  final TextEditingController controller;
  final String text;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        obscureText: isPassword,
        keyboardType: TextInputType.emailAddress,
        validator: (emailController) {
          if (emailController == null || emailController.isEmpty) {
            return "Can't be null";
          }

          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorsManager.whiteColor,
          hintText: text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
        ),
      ),
    );
  }
}
