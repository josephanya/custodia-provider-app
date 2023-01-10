import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'default_card.dart';

class FoodLogCard extends StatelessWidget {
  const FoodLogCard({
    Key? key,
    required this.meal,
    required this.mealType,
  }) : super(key: key);

  final String meal, mealType;

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              mealType,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const YMargin(7),
            Text(
              meal,
              style: const TextStyle(
                fontSize: 14,
                height: 1.357,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
