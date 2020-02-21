import 'package:flutter/material.dart';
import '../data/dummy-data.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final mealId = ModalRoute.of(context).settings.arguments;
    final filteredMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(filteredMeal.title),
      ),
      body: Center(
        child: Text('Item Detail')
      ),
    );
  }
}