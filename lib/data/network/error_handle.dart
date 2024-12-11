import 'package:testflutter/data/network/my_error.dart';
import 'package:dio/dio.dart';

class ErrorHandler implements Exception {
  late MyError myError;
  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // dio error so its error from response of the API
      myError = MyError(
          code: error.response?.statusCode ?? 400,
          message: error.response?.statusMessage);
    } else {
      // default error
      myError = MyError(
          code: error.response?.statusCode ?? 400,
          message: error.response?.statusMessage);
    }
  }
}
