import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phirus/features/home/presentaions/widgets/item_for_analysis_widget.dart';

class ScanHeaderList extends StatelessWidget {
  final List<String> scanItems;
  final String? selectedItem;
  final void Function(String) onItemSelect;

  const ScanHeaderList({
    super.key,
    required this.scanItems,
    required this.selectedItem,
    required this.onItemSelect,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ItemForAnalysisWidget(
          itemScan: scanItems[index],
          isSelected: selectedItem == scanItems[index],
          onTap: () => onItemSelect(scanItems[index]),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
      itemCount: scanItems.length,
    );
  }
}
