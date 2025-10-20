import 'package:flutter/material.dart';
import 'package:phirus/features/header/heder_info/presentation/widgets/header_info_body.dart';

import 'package:phirus/core/shared/scundary_app_bar.dart';

import 'package:phirus/core/theme/colors_manager.dart';

class HeaderInfoScreen extends StatelessWidget {
  const HeaderInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      appBar: ScanduryAppBar(),
      body: HeaderInfoBody(),
    );
  }
}
