import 'package:custodia_provider/core/api_base.dart';
import 'package:custodia_provider/services/api/failure.dart';
import 'package:custodia_provider/services/api/interceptors/api_interceptor.dart';
import 'package:custodia_provider/services/local_storage/local_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'api.dart';

final apiProvider = Provider<Api>(
  (ref) => ApiService(
    ref.watch(localStorageProvider.future),
  ),
);

class ApiService implements Api {
  ApiService(this._localStorage) {
    initialize();
  }

  final _log = Logger(filter: DevelopmentFilter());
  final Future<LocalStorage> _localStorage;

  late final Dio _http;

  void initialize() {
    _http = Dio()
      ..options.baseUrl = ApiBase.baseUri.toString()
      // ..options.connectTimeout = ApiBase.connectTimeout
      // ..options.sendTimeout = ApiBase.sendTimeout
      // ..options.responseType = ResponseType.json
      // ..options.receiveTimeout = ApiBase.receiveTimeout
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

    if (kDebugMode) {
      _http.interceptors.add(
        LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true,
          request: true,
          requestBody: true,
        ),
      );
    }

    _http.interceptors.add(ApiInterceptor(_localStorage));
  }

  @override
  Future<Map<String, dynamic>> get(
    Uri uri, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _performRequest(
      _http.get(
        uri.toString(),
        queryParameters: queryParameters,
      ),
    );
  }

  @override
  Future post(
    Uri uri, {
    required Map<String, dynamic> body,
  }) async {
    return await _performRequest(
      _http.post(
        uri.toString(),
        data: body,
      ),
    );
  }

  Future _performRequest(Future<Response<dynamic>> apiCall) async {
    try {
      final response = await apiCall;
      return response.data;
    } on DioError catch (e) {
      _log.e(e.error);
      throw Failure.fromDioError(e);
    }
  }
}
