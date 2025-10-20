import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:phirus/core/utils/app_images.dart';
import 'package:phirus/features/auth/presentaions/views/login_screen.dart';
import 'package:phirus/features/auth/presentaions/views/sign_up_screen.dart';
import 'package:phirus/core/theme/app_text_style.dart';
import 'package:phirus/core/shared/button_widget.dart';

class ExploreBody extends StatelessWidget {
  const ExploreBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),
            SvgPicture.asset(
              Assets.imagesLogo,
              width: 200.w,
              height: 200.h,
            ),
            Text(
              'Welcome To Phirus',
              style: AppTextStyle.styleRubic32,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            Text(
              'Sign up or create an account to enjoy seamless access to all features. It’s quick and easy!',
              style: AppTextStyle.styleRubic12,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 35.h),
            ButtonWidget(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              text: 'Login',
            ),
            SizedBox(height: 15.h),
            ButtonWidget(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
              },
              text: 'Sign Up',
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
