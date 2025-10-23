import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phirus/core/routing/app_router.dart';
import 'package:phirus/core/utils/constants.dart';
import 'package:phirus/features/splash/presentaion/views/splash_screen.dart';

class PhirusApp extends StatelessWidget {
  const PhirusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          home: child,
          initialRoute: splash,
          onGenerateRoute: AppRouter().ongenrateRoute,
        );
      },
      child: SplashScreen(),
    );
  }
}
