class BloodPressure {
  String systolicBloodPressure, diastolicBloodPressure;
  DateTime timestamp;

  BloodPressure({
    required this.systolicBloodPressure,
    required this.diastolicBloodPressure,
    required this.timestamp,
  });

  factory BloodPressure.fromJSON(Map<String, dynamic> data) {
    return BloodPressure(
      systolicBloodPressure: data['systolicBloodPressure'],
      diastolicBloodPressure: data['diastolicBloodPressure'],
      timestamp: DateTime.parse(data['createdAt']),
    );
  }
}
