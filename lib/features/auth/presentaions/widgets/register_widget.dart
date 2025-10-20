import 'package:flutter/material.dart';
import 'package:phirus/core/theme/app_text_style.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({
    super.key,
    required this.text,
    required this.register,
    required this.navigateTO,
  });
  final String text;
  final String register;
  final VoidCallback navigateTO;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyle.styleRubic12,
        ),
        TextButton(
          onPressed: navigateTO,
          child: Text(
            register,
            style: AppTextStyle.styleRobotoBlue12,
          ),
        )
      ],
    );
  }
}
