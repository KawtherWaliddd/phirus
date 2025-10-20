import 'dart:io';
import 'package:dio/dio.dart';
import 'package:phirus/core/network/error/exeptions.dart';
import 'package:phirus/core/network/api_client.dart';
import 'package:phirus/core/network/api_config.dart';
import 'package:phirus/features/body/attachment/data/models/check_checkattach_model.dart';

abstract class AttachmentRepo {
  Future<AttachmentModel> fetch(File file);
}

class AttachmentRepoImpl extends AttachmentRepo {
  final ApiClient apiClient;

  AttachmentRepoImpl({required this.apiClient});

  @override
  Future<AttachmentModel> fetch(File file) async {
    try {
      final fileName = file.path.split('/').last;

      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });

      final response = await apiClient.dio.post(
        ApiConfig.checkattach,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      return AttachmentModel.fromJson(response.data);
    } catch (e) {
      throw ExceptionHandler().handleError(e);
    }
  }
}
