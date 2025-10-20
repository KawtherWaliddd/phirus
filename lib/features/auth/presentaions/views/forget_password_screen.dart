import 'package:flutter/material.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/features/auth/presentaions/widgets/app_bar_forget_pass.dart';
import 'package:phirus/features/auth/presentaions/widgets/forget_pass_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      appBar: AppBarForgetPass(),
      body: ForgetPassBody(),
    );
  }
}
