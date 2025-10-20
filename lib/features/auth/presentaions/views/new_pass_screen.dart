import 'package:flutter/material.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/features/auth/presentaions/widgets/appbar_create_pass.dart';
import 'package:phirus/features/auth/presentaions/widgets/new_pass_body.dart';

class NewPassScreen extends StatelessWidget {
  const NewPassScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      appBar: AppBarCreatePass(),
      body: SingleChildScrollView(
        child: NewPassBody(),
      ),
    );
  }
}
