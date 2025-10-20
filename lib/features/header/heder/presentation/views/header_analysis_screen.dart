import 'package:flutter/material.dart';
import 'package:phirus/features/header/domain/presentation/views/domain_check_screen.dart';
import 'package:phirus/features/header/heder_info/presentation/views/header_info_scan.dart';
import 'package:phirus/features/header/spf/presentation/views/spf_screen.dart';
import 'package:phirus/features/header/whios/presentation/views/whios_lookup_check_screen.dart';
import 'package:phirus/features/header/heder/presentation/widgets/header_analysis_body.dart';

import 'package:phirus/core/shared/main_appbar.dart';
import 'package:phirus/core/theme/colors_manager.dart';

class HeaderAnalysisScreen extends StatefulWidget {
  const HeaderAnalysisScreen({super.key});

  @override
  State<HeaderAnalysisScreen> createState() => _HeaderAnalysisScreenState();
}

class _HeaderAnalysisScreenState extends State<HeaderAnalysisScreen> {
  final List<String> scanItems = [
    'Whois Lookup',
    'SPF & DMARC & DKIM Check',
    'Check Domain in Block List',
    'Extract Header Information',
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
      'Whois Lookup': const WhiosLookupCheckScreen(),
      'SPF & DMARC & DKIM Check': const SpfScreen(),
      'Check Domain in Block List': const DomainCheckScreen(),
      'Extract Header Information': const HeaderInfoScreen(),
    };

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => navigationRoutes[selectedItem]!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        selectedItem: selectedItem,
        onNextPressed: navigateToSelectedScreen,
        isHomePage: false,
      ),
      backgroundColor: ColorsManager.backgroundColor,
      body: HeaderAnalysisBody(
        scanItems: scanItems,
        selectedItem: selectedItem,
        onItemSelect: onItemSelect,
      ),
    );
  }
}
