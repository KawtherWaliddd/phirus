import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phirus/core/error/exeptions.dart';
import 'package:phirus/core/network/api_client.dart';
import 'package:phirus/core/network/api_config.dart';
import 'package:phirus/features/body/video/data/model/sstegno_model.dart';

abstract class VideoRepo {
  Future<VideoStegoResultModel> fetch(XFile video);
}

class VideoRepoImpl extends VideoRepo {
  final ApiClient apiClient;

  VideoRepoImpl({required this.apiClient});

  @override
  Future<VideoStegoResultModel> fetch(XFile video) async {
    try {
      final fileName = video.path.split('/').last;

      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          video.path,
          filename: fileName,
        ),
      });

      final response = await apiClient.dio.post(
        ApiConfig.stegnographyVideo,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      return VideoStegoResultModel.fromJson(response.data);
    } catch (e) {
      throw ExceptionHandler().handleError(e);
    }
  }
}
