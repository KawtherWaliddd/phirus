import 'package:dio/dio.dart';

class ExceptionHandler {
  Exception handleError(dynamic error) {
    if (error is DioException) {
      final statusCode = error.response?.statusCode;
      final messageError = error.response?.data ?? error.message;
      return Exception("Status code: $statusCode, error: $messageError");
    } else {
      return Exception("Unknown error: ${error.toString()}");
    }
  }
}
