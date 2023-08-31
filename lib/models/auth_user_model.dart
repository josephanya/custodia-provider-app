class AuthModel {
  String? authToken;

  AuthModel({
    this.authToken,
  });

  factory AuthModel.fromJSON(Map<String, dynamic> responseData) {
    return AuthModel(
      authToken: responseData['data']['auth_token'],
    );
  }
}
