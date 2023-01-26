class BloodGlucose {
  String bloodGlucose, context;
  DateTime timestamp;

  BloodGlucose({
    required this.bloodGlucose,
    required this.context,
    required this.timestamp,
  });

  factory BloodGlucose.fromJSON(Map<String, dynamic> data) {
    return BloodGlucose(
      bloodGlucose: data['bloodGlucose'],
      context: data['context'],
      timestamp: DateTime.parse(data['createdAt']),
    );
  }
}
