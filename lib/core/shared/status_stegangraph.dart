import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/core/theme/app_text_style.dart';


class StatusStegangraph extends StatelessWidget {
  const StatusStegangraph({
    super.key,
    required this.image,
    required this.title,
    required this.value,
  });
  final String image;
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 90),
        child: Column(
          children: [
            SvgPicture.asset(
              image,
            ),
            Text(
              title,
              style: AppTextStyle.styleRubic20.copyWith(
                color: ColorsManager.blackColor,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              value,
              style: AppTextStyle.styleRobotoGrey13.copyWith(
                color: ColorsManager.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
