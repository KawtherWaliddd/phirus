import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phirus/core/utils/app_images.dart';
import 'package:phirus/features/auth/presentaions/views/new_pass_screen.dart';
import 'package:phirus/core/theme/app_text_style.dart';
import 'package:phirus/core/shared/button_widget.dart';
import 'package:phirus/core/shared/text_field_widget.dart';

class ForgetPassBody extends StatelessWidget {
  ForgetPassBody({
    super.key,
  });
  final TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          SvgPicture.asset(
            width: 160.w,
            height: 160.h,
            Assets.imagesLogo,
          ),
          Text(
            'Forget Password',
            style: AppTextStyle.styleRubic32,
          ),
          Text(
            'Enter your email to send code verification',
            style: AppTextStyle.styleRubic12,
          ),
          SizedBox(
            height: 20.h,
          ),
          TextFieldWidget(
            text: 'Enter Email',
            controller: email,
          ),
          SizedBox(
            height: 16.h,
          ),
          ButtonWidget(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return const NewPassScreen();
                }),
              );
            },
            text: 'Send',
          )
        ],
      ),
    );
  }
}
