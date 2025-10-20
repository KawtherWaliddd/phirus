import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phirus/core/theme/app_text_style.dart';

class BuildBody extends StatelessWidget {
  const BuildBody({
    super.key,
    required this.onboardingData,
    required this.pageIndex,
    required this.image,
  });
  final List onboardingData;
  final int pageIndex;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Flexible(
        child: Column(
          children: [
            SvgPicture.asset(image),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                textAlign: TextAlign.center,
                onboardingData[pageIndex].title,
                style: AppTextStyle.stylePoly28,
              ),
            ),
            Text(
              onboardingData[pageIndex].description,
              style: AppTextStyle.styleRoboto12,
            ),
          ],
        ),
      ),
    );
  }
}
