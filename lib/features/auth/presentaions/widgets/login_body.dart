import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:phirus/core/utils/app_images.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/features/auth/presentaions/views/forget_password_screen.dart';
import 'package:phirus/features/auth/presentaions/views/sign_up_screen.dart';
import 'package:phirus/features/auth/presentaions/widgets/divider_widget.dart';
import 'package:phirus/features/auth/presentaions/widgets/platform_widget.dart';
import 'package:phirus/features/auth/presentaions/widgets/register_widget.dart';
import 'package:phirus/features/home/presentaions/views/home_screen.dart';

import 'package:phirus/core/theme/app_text_style.dart';
import 'package:phirus/core/shared/button_widget.dart';
import 'package:phirus/core/shared/text_field_widget.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  final bool isLoading = false;

  bool isChech = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Center(
          child: ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SvgPicture.asset(
                    width: 150.w,
                    height: 150.h,
                    Assets.imagesLogo,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 16,
                    ),
                    child: Text(
                      'Phirus',
                      style: AppTextStyle.styleRubic45,
                    ),
                  ),
                  TextFieldWidget(
                    text: 'Enter Email',
                    controller: email,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextFieldWidget(
                    text: 'Enter Password',
                    controller: password,
                    isPassword: true,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          activeColor: ColorsManager.brimaryColor,
                          checkColor: ColorsManager.whiteColor,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(
                            "Remember Me",
                            style: AppTextStyle.styleRubic12.copyWith(
                              color: ColorsManager.brimaryColor,
                            ),
                          ),
                          value: isChech,
                          onChanged: (bool? value) {
                            setState(() {
                              isChech = value!;
                            });
                          },
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ForgetPasswordScreen();
                            }));
                          },
                          child: Text(
                            "Forget Password",
                            style: AppTextStyle.styleRubic12,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  ButtonWidget(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HomeScreen();
                        }));
                      }
                    },
                    text: 'Login',
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  DividerWidget(),
                  SizedBox(
                    height: 50.h,
                  ),
                  PlatFormWidget(),
                  RegisterWidget(
                    text: "Don't have an account?",
                    register: 'Sign UP',
                    navigateTO: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignUpScreen();
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
