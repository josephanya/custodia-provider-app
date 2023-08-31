class UserModel {
  String? firstName, lastName, email, userID;

  UserModel({
    required this.userID,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory UserModel.fromJSON(Map<String, dynamic> data) {
    return UserModel(
      userID: data['_id'],
      firstName: data['first_name'],
      lastName: data['last_name'],
      email: data['email'],
    );
  }
}
