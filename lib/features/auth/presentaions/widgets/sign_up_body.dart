import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:phirus/core/utils/app_images.dart';
import 'package:phirus/features/auth/presentaions/views/login_screen.dart';
import 'package:phirus/features/auth/presentaions/widgets/divider_widget.dart';
import 'package:phirus/features/auth/presentaions/widgets/platform_widget.dart';
import 'package:phirus/features/auth/presentaions/widgets/register_widget.dart';

import 'package:phirus/core/theme/app_text_style.dart';
import 'package:phirus/core/shared/button_widget.dart';
import 'package:phirus/core/shared/text_field_widget.dart';

class SignUpBody extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  final bool isLoading = false;

  SignUpBody({super.key});

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
                    width: 200,
                    height: 200,
                    Assets.imagesLogo,
                  ),
                  Text(
                    'Create Account',
                    style: AppTextStyle.styleRubic32,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFieldWidget(
                    text: 'Full Name',
                    controller: fullName,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFieldWidget(
                    text: 'Email Address',
                    controller: email,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFieldWidget(
                    text: 'Enter password',
                    isPassword: true,
                    controller: password,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFieldWidget(
                    text: 'Confirm Password',
                    controller: password,
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }));
                      }
                    },
                    text: 'Create Account',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: DividerWidget(),
                  ),
                  PlatFormWidget(),
                  RegisterWidget(
                    text: "Already have an account",
                    register: 'Login',
                    navigateTO: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
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
