import 'package:flutter/material.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/features/header/whios/presentation/widgets/whios_lookup_check_body.dart';
import 'package:phirus/core/shared/scundary_app_bar.dart';

class WhiosLookupCheckScreen extends StatelessWidget {
  const WhiosLookupCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      appBar: ScanduryAppBar(),
      body: WhiosCheckBody(),
    );
  }
}
