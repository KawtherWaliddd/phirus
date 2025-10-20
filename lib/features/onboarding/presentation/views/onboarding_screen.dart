import 'package:flutter/material.dart';
import 'package:phirus/core/utils/app_images.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/core/utils/constants.dart';
import 'package:phirus/features/onboarding/data/models/onboarding_data.dart';
import 'package:phirus/features/onboarding/presentation/widgets/build_body.dart';
import 'package:phirus/features/onboarding/presentation/widgets/build_footer.dart';
import 'package:phirus/features/onboarding/presentation/widgets/build_heder.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int pageIndex = 0;
  List<OnboardingData> onboardingData = [
    OnboardingData(
        title: 'Welcome To Our App',
        image: Assets.imagesFrame,
        description:
            'Thanks for downloading our app! Get started \neasily, and if you have any questions or need \n help, just reach out—we’ve got you covered!'),
    OnboardingData(
        title: 'Scanning your Email',
        image: Assets.imagesMailTracking,
        description:
            'You can now scan your email right from our app \nto keep it safe from threats! Your security is our \npriority. Need help? We’re always here for you!'),
    OnboardingData(
        title: 'More Options to Scan',
        image: Assets.imagesMoreOptions,
        description:
            'After downloading our app, you can scan your email,\nStay protected with a full email scan—your security \nis just a tap away! Need help ? We’re here for you!'),
  ];
  int incrementPageIndex() {
    setState(() {
      if (pageIndex < onboardingData.length - 1) {
        pageIndex++;
      } else {
        Navigator.pushReplacementNamed(context, exploreScreen);
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const ExploreScreen(),
        //   ),
        // );
      }
    });
    return pageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 35),
          child: Column(
            children: [
              BuildHeder(
                pageIndex: pageIndex,
                onboardingData: onboardingData,
              ),
              const SizedBox(
                height: 100,
              ),
              BuildBody(
                image: onboardingData[pageIndex].image,
                pageIndex: pageIndex,
                onboardingData: onboardingData,
              ),
              const Spacer(
                flex: 1,
              ),
              BuildFooter(
                pageIndex: pageIndex,
                onboardingData: onboardingData,
                onTap: () => incrementPageIndex(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
