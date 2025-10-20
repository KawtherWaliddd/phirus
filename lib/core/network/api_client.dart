import 'package:dio/dio.dart';
import 'package:phirus/core/network/error/exeptions.dart';
import 'package:phirus/core/network/api_config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  final Dio dio;

  ApiClient()
      : dio = Dio(
          BaseOptions(
            baseUrl: ApiConfig.baseUrl,
            connectTimeout: ApiConfig.timeOut,
            receiveTimeout: ApiConfig.timeOut,
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        ) {
    dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
  }

  /// Post method
  Future<dynamic> post({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    try {
      final Response response = await dio.post(url, data: data);
      return response.data;
    } catch (e) {
      throw ExceptionHandler().handleError(e);
    }
  }
}
