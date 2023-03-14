class AuthModel {
  String? userID, firstName, lastName, email, authToken;

  AuthModel({
    this.userID,
    this.firstName,
    this.lastName,
    this.email,
    this.authToken,
  });

  factory AuthModel.fromJSON(Map<String, dynamic> responseData) {
    return AuthModel(
      userID: responseData['data']['provider']['provider_id'],
      firstName: responseData['data']['provider']['first_name'],
      lastName: responseData['data']['provider']['last_name'],
      email: responseData['data']['provider']['email'],
      authToken: responseData['data']['token'],
    );
  }
}
