import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phirus/core/utils/app_images.dart';
import 'package:phirus/core/utils/constants.dart';
import 'package:phirus/core/shared/item_uploaded_body.dart';
import 'package:phirus/core/shared/scundary_app_bar.dart';
import 'package:phirus/core/theme/colors_manager.dart';

class ImageSteganographyScreen extends StatelessWidget {
  const ImageSteganographyScreen({super.key});

  Future<List<XFile>?> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return [pickedFile];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      appBar: const ScanduryAppBar(),
      body: ItemUploadedBody(
        image: Assets.imagesMaterialSymbolsImageSearch,
        title: 'Image Steganography',
        navigateToPage: () async {
          final files = await _pickImage();

          if (files != null && files.isNotEmpty) {
            Navigator.pushNamed(context, attachmentResultView,
                arguments: files);
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => StatusImageScreen(
            //       image: files,
            //     ),
            //   ),
            // );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('No image selected')),
            );
          }
        },
      ),
    );
  }
}
