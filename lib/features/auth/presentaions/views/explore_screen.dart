import 'package:flutter/material.dart';
import 'package:phirus/features/auth/presentaions/widgets/explore_body.dart';

import 'package:phirus/core/theme/colors_manager.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      body: ExploreBody(),
    );
  }
}
