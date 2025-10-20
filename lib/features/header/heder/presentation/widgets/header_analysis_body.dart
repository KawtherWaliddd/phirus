import 'package:flutter/material.dart';
import 'package:phirus/features/header/heder/presentation/widgets/header_scan_title.dart';
import 'package:phirus/features/header/heder/presentation/widgets/scan_header_list.dart';

class HeaderAnalysisBody extends StatelessWidget {
  final List<String> scanItems;
  final String? selectedItem;
  final void Function(String) onItemSelect;

  const HeaderAnalysisBody({
    super.key,
    required this.scanItems,
    required this.selectedItem,
    required this.onItemSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const HeaderScanTitle(),
          const SizedBox(height: 32),
          Expanded(
            child: ScanHeaderList(
              scanItems: scanItems,
              selectedItem: selectedItem,
              onItemSelect: onItemSelect,
            ),
          ),
        ],
      ),
    );
  }
}
