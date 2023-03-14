class PatientModel {
  String firstName, lastName, patientID, gender;

  PatientModel({
    required this.firstName,
    required this.lastName,
    required this.patientID,
    required this.gender,
  });

  factory PatientModel.fromJSON(Map<String, dynamic> data) {
    return PatientModel(
      firstName: data['firstName'],
      lastName: data['lastName'],
      patientID: data['_id'],
      gender: data['gender'],
    );
  }
}
