import 'package:flutter/material.dart';
import 'package:phirus/core/theme/colors_manager.dart';

import 'package:phirus/core/theme/app_text_style.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: ColorsManager.greyColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Text(
            'Or',
            style: AppTextStyle.styleRoboto12,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: ColorsManager.greyColor,
          ),
        ),
      ],
    );
  }
}
