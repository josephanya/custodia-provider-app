class PatientModel {
  String firstName, lastName, patientID, gender, motivation, phoneNumber;
  DateTime dob;

  PatientModel({
    required this.patientID,
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.gender,
    required this.motivation,
    required this.phoneNumber,
  });

  factory PatientModel.fromJSON(Map<String, dynamic> data) {
    return PatientModel(
      patientID: data['_id'],
      firstName: data['first_name'],
      lastName: data['last_name'],
      gender: data['gender'],
      dob: DateTime.parse(data['dob']),
      motivation: data['motivation'] ?? 'no data',
      phoneNumber: data['phone_number'],
    );
  }
}
