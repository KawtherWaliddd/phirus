import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phirus/core/utils/app_images.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/features/profile/presentation/views/profile_screen.dart';
import 'package:phirus/core/theme/app_text_style.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? selectedItem;
  final VoidCallback? onNextPressed;
  final bool isHomePage;
  const MainAppBar({
    super.key,
    required this.selectedItem,
    required this.onNextPressed,
    required this.isHomePage,
  });

  @override
  Size get preferredSize => const Size.fromHeight(130);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        color: ColorsManager.backgroundColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isHomePage
              ? IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ProfileScreen();
                    }));
                  },
                  icon: Icon(
                    Icons.person,
                    color: ColorsManager.whiteColor,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: ColorsManager.whiteColor,
                  ),
                ),
          Row(
            children: [
              SvgPicture.asset(Assets.imagesLogo, height: 40),
              const SizedBox(width: 8),
              Text(
                'Phirus',
                style: AppTextStyle.styleRubicBlue18,
              ),
            ],
          ),
          if (selectedItem != null)
            TextButton(
              onPressed: onNextPressed,
              child: Text(
                "Next",
                style: AppTextStyle.styleRubic18,
              ),
            ),
        ],
      ),
    );
  }
}
