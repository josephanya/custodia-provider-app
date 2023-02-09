class User {
  String? userID, firstName, lastName, email, authToken;

  User({
    this.userID,
    this.firstName,
    this.lastName,
    this.email,
    this.authToken,
  });

  factory User.fromJSON(Map<String, dynamic> responseData) {
    return User(
      userID: responseData['data']['provider']['provider_id'],
      firstName: responseData['data']['provider']['first_name'],
      lastName: responseData['data']['provider']['last_name'],
      email: responseData['data']['provider']['email'],
      authToken: responseData['data']['token'],
    );
  }
}
