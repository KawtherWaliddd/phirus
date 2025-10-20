import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phirus/core/utils/constants.dart';
import 'package:phirus/features/header/whios/presentation/views/whios_lookup_result_screen.dart';
import 'package:phirus/core/theme/app_text_style.dart';
import 'package:phirus/core/shared/button_widget.dart';
import 'package:phirus/core/shared/input_scan_widget.dart';

class WhiosCheckBody extends StatelessWidget {
  WhiosCheckBody({super.key});
  final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: Column(
        children: [
          Text(
            'Check Whois Information',
            style: AppTextStyle.styleRubic24,
          ),
          SizedBox(height: 32.h),
          InputScanWidget(
            input: 'Input Domain Name...',
            textEditingController: inputController,
          ),
          SizedBox(height: 16.h),
          ButtonWidget(
            onTap: () {
              if (inputController.text.isNotEmpty) {
                Navigator.pushNamed(context, resultWhiosScreen,
                    arguments: inputController.text);
                // Navigator.push(context, MaterialPageRoute(builder: (_) {
                //   return ResultWhiosScreen(domain: inputController.text);
                // }));
              }
            },
            text: 'Check',
          ),
        ],
      ),
    );
  }
}
