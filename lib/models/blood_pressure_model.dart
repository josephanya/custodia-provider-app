class BloodPressureModel {
  String systolicBloodPressure, diastolicBloodPressure;
  DateTime timestamp;

  BloodPressureModel({
    required this.systolicBloodPressure,
    required this.diastolicBloodPressure,
    required this.timestamp,
  });

  factory BloodPressureModel.fromJSON(Map<String, dynamic> data) {
    return BloodPressureModel(
      systolicBloodPressure: data['systolicBloodPressure'],
      diastolicBloodPressure: data['diastolicBloodPressure'],
      timestamp: DateTime.parse(data['createdAt']),
    );
  }
}
