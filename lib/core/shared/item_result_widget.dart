import 'package:flutter/material.dart';
import 'package:phirus/core/theme/app_text_style.dart';

class ItemResultWidget extends StatelessWidget {
  const ItemResultWidget({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyle.styleRubic18,
        ),
        Spacer(),
        Text(
          value,
          style: AppTextStyle.styleRobotoGrey16,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
