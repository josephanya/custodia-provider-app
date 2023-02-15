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
      userID: responseData['data']['patient']['patient_id'],
      firstName: responseData['data']['patient']['first_name'],
      lastName: responseData['data']['patient']['last_name'],
      email: responseData['data']['patient']['email'],
      authToken: responseData['data']['token'],
    );
  }
}
