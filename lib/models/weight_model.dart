class Weight {
  String weight;
  DateTime timestamp;

  Weight({
    required this.weight,
    required this.timestamp,
  });

  factory Weight.fromJSON(Map<String, dynamic> data) {
    return Weight(
      weight: data['weight'],
      timestamp: DateTime.parse(data['createdAt']),
    );
  }
}
