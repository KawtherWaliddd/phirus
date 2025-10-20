import 'package:flutter/material.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/core/theme/app_text_style.dart';

class BuildFooter extends StatelessWidget {
  const BuildFooter({
    super.key,
    required this.onboardingData,
    required this.pageIndex,
    required this.onTap,
  });
  final int pageIndex;
  final List onboardingData;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 10,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: pageIndex == index ? 30 : 10,
                height: 10,
                decoration: BoxDecoration(
                  color: pageIndex == index
                      ? ColorsManager.brimaryColor
                      : ColorsManager.greyColor,
                  borderRadius: BorderRadius.circular(50),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 3,
              );
            },
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: ColorsManager.brimaryColor,
            onPressed: () => onTap(),
            child: Text(
              pageIndex == onboardingData.length - 1 ? 'Get Started' : 'Next',
              style: AppTextStyle.styleRubic20,
            ),
          ),
        )
      ],
    );
  }
}
