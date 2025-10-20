import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/features/auth/presentaions/views/login_screen.dart';

class AppBarCreatePass extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCreatePass({super.key});
  @override
  Size get preferredSize => Size.fromHeight(80.h);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.backgroundColor,
      leading: IconButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return LoginScreen();
              },
            ),
          );
        },
        icon: Icon(
          Icons.arrow_back,
          color: ColorsManager.whiteColor,
        ),
      ),
    );
  }
}
