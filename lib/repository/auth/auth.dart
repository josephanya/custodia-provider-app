abstract class Auth {
  String? get token;

  Future<void> login({required String email, required String password});

  Future<void> logout();

  Future<bool> hasAuthToken();

  Future<void> saveDeviceToken({
    required String deviceToken,
  });
}
