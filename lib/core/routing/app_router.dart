import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phirus/core/utils/constants.dart';
import 'package:phirus/features/auth/presentaions/views/explore_screen.dart';
import 'package:phirus/features/auth/presentaions/views/login_screen.dart';
import 'package:phirus/features/body/attachment/presentaion/views/attachment_result_screen.dart';
import 'package:phirus/features/body/attachment/presentaion/views/attatchment_screen.dart';
import 'package:phirus/features/body/body/presentation/views/body_analysis_screen.dart';
import 'package:phirus/features/body/body/presentation/widgets/heder_title.dart';
import 'package:phirus/features/body/image/presentation/view/image_steganography.dart';
import 'package:phirus/features/body/image/presentation/view/status_image_screen.dart';
import 'package:phirus/features/body/ssl/presentation/views/ssl_certificate_screen.dart';
import 'package:phirus/features/body/ssl/presentation/views/ssl_check_screen.dart';
import 'package:phirus/features/body/url/presentation/views/url_result_screen.dart';
import 'package:phirus/features/body/video/presentaion/view/status_video_screen.dart';
import 'package:phirus/features/header/domain/presentation/views/result_domain_screen.dart';
import 'package:phirus/features/header/heder/presentation/views/header_analysis_screen.dart';
import 'package:phirus/features/header/spf/presentation/views/result_spf_screen.dart';
import 'package:phirus/features/header/spf/presentation/views/spf_screen.dart';
import 'package:phirus/features/header/whios/presentation/views/whios_lookup_result_screen.dart';
import 'package:phirus/features/home/presentaions/views/home_screen.dart';
import 'package:phirus/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:phirus/features/splash/presentaion/views/splash_screen.dart';

class AppRouter {
  Route<dynamic> ongenrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case onboarding:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());
      case resultDomainScreen:
        final domain = settings.arguments as String;
        return MaterialPageRoute(
            builder: (context) => ResultDomainScreen(
                  domain: domain,
                ));
      case spf:
        return MaterialPageRoute(builder: (context) => SpfScreen());
      case headerAnalysisScreen:
        return MaterialPageRoute(builder: (context) => HeaderAnalysisScreen());
      case bodyAnalysisScreen:
        return MaterialPageRoute(builder: (context) => BodyAnalysisScreen());
      case attachmentView:
        return MaterialPageRoute(builder: (context) => AttatchmentScreen());
      case sslView:
        return MaterialPageRoute(builder: (context) => SslScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case exploreScreen:
        return MaterialPageRoute(builder: (context) => ExploreScreen());
      case resultSpfScreen:
        final domain = settings.arguments as String;
        return MaterialPageRoute(
            builder: (context) => ResultSpfScreen(
                  domain: domain,
                ));
      case resultWhiosScreen:
        final domain = settings.arguments as String;
        return MaterialPageRoute(
            builder: (context) => ResultWhiosScreen(
                  domain: domain,
                ));
      case statusSteganographScreen:
        final video = settings.arguments as List<XFile>;
        return MaterialPageRoute(
            builder: (context) => StatusSteganographScreen(
                  video: video,
                ));
      case sslResultScreen:
        final url = settings.arguments as String;
        return MaterialPageRoute(
            builder: (context) => SslResultScreen(
                  url: url,
                ));
      case attachmentResultView:
        final file = settings.arguments as File;
        return MaterialPageRoute(
            builder: (context) => AttachmentResultScreen(
                  file: file,
                ));
      case imageView:
        return MaterialPageRoute(
            builder: (context) => ImageSteganographyScreen());
      case statusImageScreen:
        final images = settings.arguments as List<XFile>;
        return MaterialPageRoute(
            builder: (context) => StatusImageScreen(
                  image: images,
                ));
      case urlResultScreen:
        final url = settings.arguments as String;
        return MaterialPageRoute(
            builder: (context) => UrlResultScreen(
                  url: url,
                ));
      case bodyView:
        return MaterialPageRoute(builder: (context) => BodyerScan());
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text('No correct route'),
                  ),
                ));
    }
  }
}
