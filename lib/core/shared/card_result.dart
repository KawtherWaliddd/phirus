import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/features/body/body/data/result_model.dart';
import 'package:phirus/core/theme/app_text_style.dart';
import 'package:phirus/core/shared/card_result_list.dart';

class ResultItemWidget extends StatelessWidget {
  const ResultItemWidget({
    super.key,
    required this.title,
    required this.infoList,
  });
  final String title;
  final List<ResultModel> infoList;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.only(
        bottom: 14.h,
        left: 16,
        right: 16,
        top: 16,
      ),
      decoration: BoxDecoration(
        color: ColorsManager.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: AppTextStyle.styleRobotoBlue16),
          SizedBox(height: 10.h),
          CardResultList(infoList: infoList),
        ],
      ),
    );
  }
}
