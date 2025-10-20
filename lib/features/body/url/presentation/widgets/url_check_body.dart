import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phirus/core/utils/constants.dart';
import 'package:phirus/core/theme/app_text_style.dart';
import 'package:phirus/core/shared/button_widget.dart';
import 'package:phirus/core/shared/input_scan_widget.dart';

class UrlCheckBody extends StatelessWidget {
  UrlCheckBody({super.key});
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: Column(
        children: [
          Text(
            'URL Scan',
            style: AppTextStyle.styleRubic24,
          ),
          SizedBox(height: 32.h),
          InputScanWidget(
            input: 'Input URL...',
            textEditingController: textEditingController,
          ),
          SizedBox(height: 16.h),
          ButtonWidget(
            onTap: () {
              Navigator.pushNamed(context, urlResultScreen,
                  arguments: textEditingController.text);
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return UrlResultScreen(
              //     url: textEditingController.text,
              //   );
              // }));
            },
            text: 'Check',
          ),
        ],
      ),
    );
  }
}
