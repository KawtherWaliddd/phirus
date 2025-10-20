import 'dart:io';
import 'package:dio/dio.dart';
import 'package:phirus/core/network/error/exeptions.dart';
import 'package:phirus/core/network/api_client.dart';
import 'package:phirus/core/network/api_config.dart';
import 'package:phirus/features/header/heder_info/data/model/heder_model.dart';

abstract class HeaderRepo {
  Future<HederModel> fetch(File file);
}

class HeaderRepoImpl extends HeaderRepo {
  final ApiClient apiClient;

  HeaderRepoImpl({required this.apiClient});

  @override
  Future<HederModel> fetch(File file) async {
    try {
      final fileName = file.path.split('/').last;

      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });

      final response = await apiClient.dio.post(
        ApiConfig.header,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      return HederModel.fromJson(response.data);
    } catch (e) {
      throw ExceptionHandler().handleError(e);
    }
  }
}
