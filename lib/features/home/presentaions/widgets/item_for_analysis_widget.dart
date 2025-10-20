import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/core/theme/app_text_style.dart';


class ItemForAnalysisWidget extends StatelessWidget {
  const ItemForAnalysisWidget({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.itemScan,
  });
  final bool isSelected;
  final VoidCallback onTap;
  final String itemScan;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 65.h,
        decoration: BoxDecoration(
          color: ColorsManager.lightBackground,
          border: Border.all(
              color: isSelected
                  ? ColorsManager.brimaryColor
                  : ColorsManager.lightBackground,
              width: 2),
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: Center(
          child: Text(
            itemScan,
            style: AppTextStyle.styleRubic18,
          ),
        ),
      ),
    );
  }
}
