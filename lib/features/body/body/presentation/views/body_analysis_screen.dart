import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/features/body/attachment/presentaion/views/attatchment_screen.dart';
import 'package:phirus/features/body/image/presentation/view/image_steganography.dart';
import 'package:phirus/features/body/ssl/presentation/views/ssl_check_screen.dart';
import 'package:phirus/features/body/url/presentation/views/url_screen.dart';
import 'package:phirus/features/body/video/presentaion/view/video_steganography_screen.dart';
import 'package:phirus/features/body/body/presentation/widgets/heder_title.dart';
import 'package:phirus/features/body/body/presentation/widgets/scan_item_list.dart';
import 'package:phirus/core/shared/main_appbar.dart';

class BodyAnalysisScreen extends StatefulWidget {
  const BodyAnalysisScreen({super.key});

  @override
  State<BodyAnalysisScreen> createState() => _BodyAnalysisScreenState();
}

class _BodyAnalysisScreenState extends State<BodyAnalysisScreen> {
  final List<String> scanItem = [
    'Check Attachment',
    'Scan URL',
    'Check SSL Certificate',
    'Image Steganography',
    'Video Steganography',
  ];

  String? selectedItem;

  void onItemSelect(String scanItem) {
    setState(() {
      selectedItem = scanItem;
    });
  }

  void navigateToSelectedScreen() {
    if (selectedItem == null) return;

    final Map<String, Widget> navigationRoutes = {
      'Check Attachment': AttatchmentScreen(),
      'Scan URL': const UrlScreen(),
      'Check SSL Certificate': SslScreen(),
      'Image Steganography': const ImageSteganographyScreen(),
      'Video Steganography': const VideoSteganographyScreen(),
    };

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => navigationRoutes[selectedItem]!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      appBar: MainAppBar(
        selectedItem: selectedItem,
        onNextPressed: navigateToSelectedScreen,
        isHomePage: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const BodyerScan(),
            SizedBox(height: 32.h),
            ScanItemList(
              scanItem: scanItem,
              selectedItem: selectedItem,
              onItemSelect: onItemSelect,
            ),
          ],
        ),
      ),
    );
  }
}
