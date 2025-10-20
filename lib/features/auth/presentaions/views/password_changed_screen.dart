import 'package:flutter/material.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/features/auth/presentaions/widgets/change_pass_body.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      body: ChangePassBody(),
    );
  }
}
