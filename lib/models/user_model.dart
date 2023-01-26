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
      userID: responseData['data']['user']['user_id'],
      firstName: responseData['data']['user']['first_name'],
      lastName: responseData['data']['user']['last_name'],
      email: responseData['data']['user']['email'],
      authToken: responseData['data']['token'],
    );
  }
}
