import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phirus/core/utils/app_images.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/core/theme/app_text_style.dart';

class ScanduryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ScanduryAppBar({super.key});
  @override
  Size get preferredSize => Size.fromHeight(130);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        color: ColorsManager.backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            25,
          ),
          bottomRight: Radius.circular(
            25,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorsManager.whiteColor,
            ),
          ),
          SizedBox(
            width: 70.w,
          ),
          SvgPicture.asset(
            Assets.imagesLogo,
            height: 50.h,
          ),
          Text(
            'Phirus',
            style: AppTextStyle.styleRubicBlue18,
          )
        ],
      ),
    );
  }
}
