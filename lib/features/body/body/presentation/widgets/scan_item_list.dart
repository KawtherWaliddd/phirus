import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phirus/features/home/presentaions/widgets/item_for_analysis_widget.dart';

class ScanItemList extends StatelessWidget {
  final List<String> scanItem;
  final String? selectedItem;
  final void Function(String) onItemSelect;

  const ScanItemList({
    super.key,
    required this.scanItem,
    required this.selectedItem,
    required this.onItemSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ItemForAnalysisWidget(
            itemScan: scanItem[index],
            isSelected: selectedItem == scanItem[index],
            onTap: () => onItemSelect(scanItem[index]),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 20.h),
        itemCount: scanItem.length,
      ),
    );
  }
}
