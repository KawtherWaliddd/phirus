import 'package:flutter/material.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/features/auth/presentaions/views/forget_password_screen.dart';
import 'package:phirus/core/theme/app_text_style.dart';

class RemindWidget extends StatefulWidget {
  const RemindWidget({super.key});

  @override
  State<RemindWidget> createState() => _RemindWidgetState();
}

class _RemindWidgetState extends State<RemindWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            activeColor: ColorsManager.brimaryColor,
            value: isChecked,
            onChanged: (bool? checked) {
              setState(() {
                isChecked = checked!;
              });
            }),
        Text(
          'Remember Me',
          style: AppTextStyle.styleRobotoBlue13,
        ),
        const Spacer(
          flex: 1,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const ForgetPasswordScreen();
            }));
          },
          child: Text(
            'Forget Password',
            style: AppTextStyle.styleRobotoGrey13,
          ),
        ),
      ],
    );
  }
}
