import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';

final List food = [
  {'name': 'Garlicky Greek Chicken salad', 'mealType': 'Breakfast'},
  {'name': 'Keto Fried Chicken', 'mealType': 'Lunch'},
  {'name': 'Cheesy Bacon Ranch Chicken', 'mealType': 'Dinner'},
];

class MealPlanner extends StatelessWidget {
  const MealPlanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Meal Planner'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: const [],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 50,
        height: 50,
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: white,
          ),
        ),
      ),
    );
  }
}
