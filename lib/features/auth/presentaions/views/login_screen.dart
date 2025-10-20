import 'package:flutter/material.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/features/auth/presentaions/widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      body: LoginBody(),
    );
  }
}
