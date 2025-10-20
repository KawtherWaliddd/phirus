import 'package:flutter/material.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/core/theme/app_text_style.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
  });
  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 50,
        color: ColorsManager.brimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: AppTextStyle.styleRubic18,
        ),
      ),
    );
  }
}
