import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phirus/core/utils/app_images.dart';
import 'package:phirus/features/auth/presentaions/views/login_screen.dart';
import 'package:phirus/core/theme/app_text_style.dart';
import 'package:phirus/core/shared/button_widget.dart';

class ChangePassBody extends StatelessWidget {
  const ChangePassBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.imagesIconsSuccessmark,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 50,
              ),
              child: Text(
                'Password Changed\nSuccessfully',
                style: AppTextStyle.styleRubic32,
                textAlign: TextAlign.center,
              ),
            ),
            ButtonWidget(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
                text: 'Back To Login')
          ],
        ),
      ),
    );
  }
}
