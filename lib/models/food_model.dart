class FoodModel {
  String food, mealType, imageURL;
  DateTime timestamp;

  FoodModel({
    required this.food,
    required this.mealType,
    required this.imageURL,
    required this.timestamp,
  });

  factory FoodModel.fromJSON(Map<String, dynamic> data) {
    return FoodModel(
      food: data['food'],
      mealType: data['mealType'],
      imageURL: data['imageURL'] ?? '',
      timestamp: DateTime.parse(data['createdAt']),
    );
  }
}
