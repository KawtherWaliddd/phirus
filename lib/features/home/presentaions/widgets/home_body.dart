import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phirus/core/utils/app_images.dart';
import 'package:phirus/features/home/presentaions/widgets/check_item_widget.dart';
import 'package:phirus/core/theme/app_text_style.dart';

class HomeBody extends StatelessWidget {
  final String? selectedItem;
  final void Function(String) onItemSelected;

  const HomeBody({
    super.key,
    required this.selectedItem,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            'How do you want to scan your E-mail?',
            textAlign: TextAlign.center,
            style: AppTextStyle.styleRubic24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Now, you can scan your e-mail and ensure it is not phishing or malicious. Choose a scan type:',
              textAlign: TextAlign.center,
              style: AppTextStyle.styleRoboto12,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CheckItemWidget(
                image: Assets.imagesHeader,
                text: 'Header',
                isSelected: selectedItem == 'Header',
                onTap: () => onItemSelected('Header'),
              ),
              SizedBox(width: 20.w),
              CheckItemWidget(
                image: Assets.imagesBody,
                text: 'Body',
                isSelected: selectedItem == 'Body',
                onTap: () => onItemSelected('Body'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
