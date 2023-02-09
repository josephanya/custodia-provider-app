abstract class Api {
  Future<Map<String, dynamic>> get(
    Uri uri, {
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> post(
    Uri uri, {
    required Map<String, dynamic> body,
  });
}
