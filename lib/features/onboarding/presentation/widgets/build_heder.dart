import 'package:flutter/material.dart';
import 'package:phirus/features/auth/presentaions/views/explore_screen.dart';
import 'package:phirus/core/theme/app_text_style.dart';

class BuildHeder extends StatelessWidget {
  const BuildHeder({
    super.key,
    required this.pageIndex,
    required this.onboardingData,
  });
  final int pageIndex;
  final List onboardingData;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Spacer(
        flex: 1,
      ),
      TextButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const ExploreScreen();
          }));
        },
        child: Text(
          pageIndex == onboardingData.length ? '' : 'Skip',
          style: AppTextStyle.styleRubic18,
        ),
      ),
    ]);
  }
}
