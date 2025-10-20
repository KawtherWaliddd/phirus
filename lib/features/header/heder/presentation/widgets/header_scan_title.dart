import 'package:flutter/material.dart';
import 'package:phirus/core/theme/app_text_style.dart';

class HeaderScanTitle extends StatelessWidget {
  const HeaderScanTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'How do you want to scan your E-mail Header?',
      style: AppTextStyle.styleRubic24,
      textAlign: TextAlign.center,
    );
  }
}
