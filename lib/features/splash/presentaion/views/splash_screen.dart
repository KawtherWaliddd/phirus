import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phirus/core/utils/app_images.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/core/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, onboarding);
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bodySplash(screenWidth),
            const SizedBox(height: 20),
            headerSplash(screenWidth),
          ],
        ),
      ),
    );
  }
}

Widget headerSplash(double screenWidth) {
  return TweenAnimationBuilder<double>(
    tween: Tween<double>(begin: screenWidth / 2, end: 0),
    duration: const Duration(seconds: 2),
    curve: Curves.easeInOut,
    builder: (context, value, child) {
      return Transform.translate(
        offset: Offset(value, 0),
        child: child!,
      );
    },
    child: Text(
      "Phirus",
      style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: ColorsManager.whiteColor,
      ),
    ),
  );
}

Widget bodySplash(double screenWidth) {
  return TweenAnimationBuilder<double>(
    tween: Tween<double>(begin: -screenWidth / 2, end: 0),
    duration: const Duration(seconds: 2),
    curve: Curves.easeInOut,
    builder: (context, value, child) {
      return Transform.translate(
        offset: Offset(value, 0),
        child: child!,
      );
    },
    child: _loadSvg(Assets.imagesLogo),
  );
}

Widget _loadSvg(String assetPath) {
  try {
    return SvgPicture.asset(
      assetPath,
      width: 300,
      height: 300,
    );
  } catch (e) {
    return const Text(
      "Failed to load image",
      style: TextStyle(color: Colors.red),
    );
  }
}
