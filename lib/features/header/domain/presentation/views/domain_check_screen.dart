import 'package:flutter/material.dart';

import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/features/header/domain/presentation/widgets/domain_check_body.dart';
import 'package:phirus/core/shared/scundary_app_bar.dart';

class DomainCheckScreen extends StatelessWidget {
  const DomainCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      appBar: ScanduryAppBar(),
      body: Center(
        child: BomainCheckBody(),
      ),
    );
  }
}
