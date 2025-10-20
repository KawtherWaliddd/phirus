import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phirus/core/utils/app_images.dart';
import 'package:phirus/core/network/api_client.dart';
import 'package:phirus/features/body/image/data/model/stegnography_image_model.dart';
import 'package:phirus/features/body/image/data/repo/image_repo.dart';
import 'package:phirus/core/shared/scundary_app_bar.dart';
import 'package:phirus/core/shared/status_stegangraph.dart';

class StatusImageScreen extends StatefulWidget {
  const StatusImageScreen({
    super.key,
    required this.image,
  });
  final List<XFile> image;

  @override
  State<StatusImageScreen> createState() => _StatusImageScreenState();
}

class _StatusImageScreenState extends State<StatusImageScreen> {
  late Future<ImageStegoRawModel> imageData;

  @override
  void initState() {
    super.initState();
    // Initialize the future once, during widget initialization
    imageData = ImageRepoImpl(apiClient: ApiClient()).fetch(widget.image.first);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScanduryAppBar(),
      body: FutureBuilder(
        future: imageData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            final bool imageResult = snapshot.data!.hidden;
            return StatusStegangraph(
              image: imageResult
                  ? Assets.imagesIconsError
                  : Assets.imagesIconsSafe,
              title: 'Image Steganography',
              value: imageResult
                  ? 'There is hidden message found in the image'
                  : 'There is No hidden message found in the image',
            );
          }
          return const Center(
            child: Text("No Data Found!"),
          );
        },
      ),
    );
  }
}
