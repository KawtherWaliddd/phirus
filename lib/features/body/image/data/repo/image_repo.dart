import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phirus/core/network/error/exeptions.dart';
import 'package:phirus/core/network/api_client.dart';
import 'package:phirus/core/network/api_config.dart';
import 'package:phirus/features/body/image/data/model/stegnography_image_model.dart';

abstract class ImageRepo {
  Future<ImageStegoRawModel> fetch(XFile file);
}

class ImageRepoImpl extends ImageRepo {
  final ApiClient apiClient;

  ImageRepoImpl({required this.apiClient});

  @override
  Future<ImageStegoRawModel> fetch(XFile file) async {
    try {
      final fileName = file.path.split('/').last;

      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });

      final response = await apiClient.dio.post(
        ApiConfig.stegnographyImage,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      return ImageStegoRawModel.fromJson(response.data);
    } catch (e) {
      throw ExceptionHandler().handleError(e);
    }
  }
}
