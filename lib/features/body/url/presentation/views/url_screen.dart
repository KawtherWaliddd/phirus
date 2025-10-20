import 'package:flutter/material.dart';
import 'package:phirus/features/body/url/presentation/widgets/url_check_body.dart';
import 'package:phirus/core/shared/scundary_app_bar.dart';
import 'package:phirus/core/theme/colors_manager.dart';

class UrlScreen extends StatelessWidget {
  const UrlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      appBar: ScanduryAppBar(),
      body: Center(
        child: UrlCheckBody(),
      ),
    );
  }
}
