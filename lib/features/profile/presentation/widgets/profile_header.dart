import 'package:flutter/material.dart';
import 'package:phirus/core/utils/app_images.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/core/theme/app_text_style.dart';


class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(color: ColorsManager.lightBackground),
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: ColorsManager.whiteColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(Assets.imagesProfile),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kawther Walid',
                      style: AppTextStyle.styleRubic18,
                    ),
                    Text(
                      'kawtherwalid130@gmail.com',
                      style: AppTextStyle.styleRubic12,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
