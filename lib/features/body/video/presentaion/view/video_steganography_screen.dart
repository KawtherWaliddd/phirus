import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phirus/core/utils/app_images.dart';
import 'package:phirus/core/utils/constants.dart';
import 'package:phirus/core/shared/item_uploaded_body.dart';
import 'package:phirus/core/shared/scundary_app_bar.dart';
import 'package:phirus/core/theme/colors_manager.dart';

class VideoSteganographyScreen extends StatelessWidget {
  const VideoSteganographyScreen({super.key});

  Future<List<XFile>?> _pickVideo() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickVideo(source: ImageSource.gallery);
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
        image: Assets.imagesFluentMdl2VideoSearch,
        title: 'Video Steganography',
        navigateToPage: () async {
          final files = await _pickVideo();

          if (files != null && files.isNotEmpty) {
            Navigator.pushNamed(context, statusSteganographScreen,
                arguments: files);
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => StatusSteganographScreen(
            //       video: files,
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
