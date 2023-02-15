class ProviderModel {
  String? firstName, lastName, email;

  ProviderModel({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory ProviderModel.fromJSON(Map<String, dynamic> data) {
    return ProviderModel(
      firstName: data['firstName'],
      lastName: data['lastName'],
      email: data['email'],
    );
  }
}
