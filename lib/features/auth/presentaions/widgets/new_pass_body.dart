import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phirus/core/utils/app_images.dart';
import 'package:phirus/features/auth/presentaions/views/password_changed_screen.dart';
import 'package:phirus/core/theme/app_text_style.dart';
import 'package:phirus/core/shared/button_widget.dart';
import 'package:phirus/core/shared/text_field_widget.dart';

class NewPassBody extends StatelessWidget {
  NewPassBody({
    super.key,
  });
  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confuirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SvgPicture.asset(
            Assets.imagesLogo,
            width: 160.w,
            height: 160.h,
          ),
          Text(
            'Create New Password',
            style: AppTextStyle.styleRubic24,
          ),
          Text(
            'new password must be unique from those previously used',
            style: AppTextStyle.styleRoboto12,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 24.h,
          ),
          TextFieldWidget(
            text: 'Old Password',
            isPassword: true,
            controller: oldPassword,
          ),
          SizedBox(
            height: 16.h,
          ),
          TextFieldWidget(
            text: 'New Password',
            isPassword: true,
            controller: newPassword,
          ),
          SizedBox(
            height: 16.h,
          ),
          TextFieldWidget(
            text: 'Confirm New Password',
            controller: confuirmPassword,
            isPassword: true,
          ),
          SizedBox(
            height: 32.h,
          ),
          ButtonWidget(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const PasswordChangedScreen();
                  },
                ),
              );
            },
            text: 'Confirm',
          ),
        ],
      ),
    );
  }
}
