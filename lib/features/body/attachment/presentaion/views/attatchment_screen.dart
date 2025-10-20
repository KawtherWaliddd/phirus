import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:phirus/core/utils/app_images.dart';
import 'package:phirus/core/theme/colors_manager.dart';
import 'package:phirus/features/body/attachment/presentaion/views/attachment_result_screen.dart';
import 'package:phirus/core/shared/attatchment_upload.dart';
import 'package:phirus/core/shared/scundary_app_bar.dart';

class AttatchmentScreen extends StatelessWidget {
  const AttatchmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      appBar: ScanduryAppBar(),
      body: ItemUpload(
          itemUploded: 'Check Attachment',
          image: Assets.imagesVector,
          itemScan: 'Upload The Attachment',
          onTap: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles();
            if (result != null) {
              File file = File(result.files.single.path!);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AttachmentResultScreen(
                  file: file,
                );
              }));
            } else {
              // User canceled the picker
            }
          }),
    );
  }
}
