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
      systolicBloodPressure: data['systolic_blood_pressure'],
      diastolicBloodPressure: data['diastolic_blood_pressure'],
      timestamp: DateTime.parse(data['createdAt']),
    );
  }
}
