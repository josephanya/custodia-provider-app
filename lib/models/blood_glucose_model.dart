class BloodGlucoseModel {
  String bloodGlucose, context;
  DateTime timestamp;

  BloodGlucoseModel({
    required this.bloodGlucose,
    required this.context,
    required this.timestamp,
  });

  factory BloodGlucoseModel.fromJSON(Map<String, dynamic> data) {
    return BloodGlucoseModel(
      bloodGlucose: data['bloodGlucose'],
      context: data['context'],
      timestamp: DateTime.parse(data['createdAt']),
    );
  }
}
