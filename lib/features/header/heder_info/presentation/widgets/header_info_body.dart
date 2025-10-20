import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phirus/core/utils/app_images.dart';
import 'package:phirus/features/header/heder_info/presentation/views/result_header_info.dart';
import 'package:phirus/core/theme/app_text_style.dart';
import 'package:phirus/core/shared/attatchment_upload.dart';

class HeaderInfoBody extends StatelessWidget {
  const HeaderInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 30,
        ),
        child: Column(
          children: [
            Text(
              'Extract Header Information',
              style: AppTextStyle.styleRubic24,
            ),
            SizedBox(height: 32.h),
            ItemUpload(
              itemUploded: 'Email File',
              image: Assets.imagesVector,
              itemScan: 'Upload The File',
              onTap: () async {
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();

                if (result != null) {
                  File file = File(result.files.single.path!);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ResultHeaderInfo(file: file);
                  }));
                } else {
                  // User canceled the picker
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
