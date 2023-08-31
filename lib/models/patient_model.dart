class PatientModel {
  String firstName, lastName, patientID, gender;
  DateTime dob;

  PatientModel({
    required this.patientID,
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.gender,
  });

  factory PatientModel.fromJSON(Map<String, dynamic> data) {
    return PatientModel(
      patientID: data['_id'],
      firstName: data['first_name'],
      lastName: data['last_name'],
      gender: data['gender'],
      dob: DateTime.parse(data['dob']),
    );
  }
}
