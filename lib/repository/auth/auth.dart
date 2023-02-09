abstract class Auth {
  String? get token;

  void setToken({required String token});

  Future<void> login({required String email, required String password});

  Future<void> logout();

  Future<bool> hasAuthToken();
}
