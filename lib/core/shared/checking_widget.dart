import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:phirus/core/theme/app_text_style.dart';
import 'package:phirus/core/shared/button_widget.dart';
import 'package:phirus/core/shared/input_scan_widget.dart';

class CheckingWidget extends StatelessWidget {
  const CheckingWidget({
    super.key,
    required this.itemScan,
    required this.input,
    required this.navigateToResult,
    required this.textEditingController,
  });
  final String itemScan;
  final String input;
  final VoidCallback navigateToResult;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 30,
        ),
        child: Column(
          children: [
            Text(
              itemScan,
              style: AppTextStyle.styleRubic24,
            ),
            SizedBox(
              height: 32.h,
            ),
            InputScanWidget(
              input: input,
              textEditingController: textEditingController,
            ),
            SizedBox(
              height: 16.h,
            ),
            ButtonWidget(onTap: navigateToResult, text: 'Check')
          ],
        ),
      ),
    );
  }
}
