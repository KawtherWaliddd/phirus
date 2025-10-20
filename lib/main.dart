import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'package:phirus/phirus_app.dart';

void main(List<String> args) async {
  runApp(
    DevicePreview(
      enabled: false,
      // !kReleaseMode,
      builder: (context) => const PhirusApp(),
    ),
  );
}
