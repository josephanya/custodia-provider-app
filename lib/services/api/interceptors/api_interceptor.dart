import 'package:custodia_provider/services/local_storage/local_storage.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class ApiInterceptor implements Interceptor {
  ApiInterceptor(this._localStorage);

  final Future<LocalStorage> _localStorage;
  final _log = Logger(filter: DevelopmentFilter());

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token;
    try {
      token = await _localStorage.then((storage) async =>
          storage.getAuthUser().then((user) => user.authToken));
      _log.i("token exists $token");
    } catch (e) {
      _log.e("no token");
    }
    if (!options.path.contains('/auth/login')) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
