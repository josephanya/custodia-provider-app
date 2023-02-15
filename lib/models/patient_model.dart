class PatientModel {
  String firstName, lastName, phoneNumber, patientID, gender;

  PatientModel({
    required this.firstName,
    required this.lastName,
    required this.patientID,
    required this.phoneNumber,
    required this.gender,
  });

  factory PatientModel.fromJSON(Map<String, dynamic> data) {
    return PatientModel(
      firstName: data['firstName'],
      lastName: data['lastName'],
      patientID: data['_id'],
      phoneNumber: data['phoneNumber'],
      gender: data['gender'],
    );
  }
}
