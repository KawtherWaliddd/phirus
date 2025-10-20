import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:phirus/core/utils/app_images.dart';
import 'package:phirus/features/body/video/data/model/sstegno_model.dart';
import 'package:phirus/features/body/video/data/repo/video_repo.dart';
import 'package:phirus/core/shared/scundary_app_bar.dart';
import 'package:phirus/core/shared/status_stegangraph.dart';

import 'package:phirus/core/network/api_client.dart';

class StatusSteganographScreen extends StatefulWidget {
  const StatusSteganographScreen({
    super.key,
    required this.video,
  });
  final List<XFile> video;

  @override
  State<StatusSteganographScreen> createState() => _StatusSteganographScreen();
}

class _StatusSteganographScreen extends State<StatusSteganographScreen> {
  late Future<VideoStegoResultModel> videoData;

  @override
  void initState() {
    super.initState();
    videoData = VideoRepoImpl(apiClient: ApiClient()).fetch(widget.video.first);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScanduryAppBar(),
      body: FutureBuilder(
        future: videoData,
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
            final bool videoResult = snapshot.data!.hasHiddenMessage;
            return StatusStegangraph(
              image: !videoResult
                  ? Assets.imagesIconsError
                  : Assets.imagesIconsSafe,
              title: 'Video Steganography',
              value: !videoResult
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
