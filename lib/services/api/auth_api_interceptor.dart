import 'package:dio/dio.dart';

class ApiInterceptor implements Interceptor {
  ApiInterceptor();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // AuthData? auth;
    // try {
    //  // get user from local stroage
    //   print("Auth user data exists ${auth?.token?.length}");
    // } catch (e) {
    //   print("No auth user data");
    // }
    // options.headers['Authorization'] = 'Bearer ${auth?.token}';
    // return handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
