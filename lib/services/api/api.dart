import 'package:dio/dio.dart';

abstract class Api {
  Future<Map<String, dynamic>> get(
    Uri uri, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onReceiveProgress,
  });

  Future<Map<String, dynamic>> post(
    Uri uri, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onReceiveProgress,
  });

  Future<Map<String, dynamic>> put(
    Uri uri, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onReceiveProgress,
  });
}
