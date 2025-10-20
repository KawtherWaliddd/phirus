import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/core/theme/app_text_style.dart';


class CheckItemWidget extends StatelessWidget {
  final String image;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CheckItemWidget({
    super.key,
    required this.image,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 150.w,
          height: 130.h,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: isSelected
                  ? ColorsManager.brimaryColor
                  : ColorsManager.lightBackground,
            ),
            color: ColorsManager.lightBackground,
            borderRadius: BorderRadius.circular(
              16.r,
            ),
          ),
          child: Column(
            children: [
              Image.asset(
                image,
                width: 100.w,
                height: 100.h,
              ),
              Text(
                text,
                style: AppTextStyle.styleRubic20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
