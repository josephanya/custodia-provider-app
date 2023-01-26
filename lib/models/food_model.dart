class Food {
  String food, mealType, imageURL;
  DateTime timestamp;

  Food({
    required this.food,
    required this.mealType,
    required this.imageURL,
    required this.timestamp,
  });

  factory Food.fromJSON(Map<String, dynamic> data) {
    return Food(
      food: data['food'],
      mealType: data['mealType'],
      imageURL: data['imageURL'],
      timestamp: DateTime.parse(data['createdAt']),
    );
  }
}
