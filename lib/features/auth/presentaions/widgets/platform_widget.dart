import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phirus/core/utils/app_images.dart';

class PlatFormWidget extends StatelessWidget {
  const PlatFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Image.asset(Assets.imagesIconsIOS),
        ),
        SizedBox(
          width: 16.w,
        ),
        InkWell(
          onTap: () {},
          child: Image.asset(
            Assets.imagesIconsGoogle,
          ),
        )
      ],
    );
  }
}
