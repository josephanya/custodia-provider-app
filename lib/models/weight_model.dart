class WeightModel {
  String weight;
  DateTime timestamp;

  WeightModel({
    required this.weight,
    required this.timestamp,
  });

  factory WeightModel.fromJSON(Map<String, dynamic> data) {
    return WeightModel(
      weight: data['weight'],
      timestamp: DateTime.parse(data['createdAt']),
    );
  }
}
