import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:phirus/core/theme/app_text_style.dart';
import 'package:phirus/core/shared/button_widget.dart';

class ItemUpload extends StatelessWidget {
  const ItemUpload(
      {super.key,
      required this.itemUploded,
      required this.image,
      required this.itemScan,
      required this.onTap});
  final String itemUploded;
  final String image;
  final String itemScan;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              itemUploded,
              style: AppTextStyle.styleRubic20,
            ),
            SizedBox(
              height: 40.h,
            ),
            SvgPicture.asset(image),
            SizedBox(
              height: 30.h,
            ),
            ButtonWidget(
              onTap: onTap,
              text: itemScan,
            ),
          ],
        ),
      ),
    );
  }
}
