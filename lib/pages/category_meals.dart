import 'package:flutter/material.dart';

import '../data/dummy-data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {

  static const String routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final filteredCategoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            title: filteredCategoryMeals[index].title,
            affordability: filteredCategoryMeals[index].affordability,
            complexity: filteredCategoryMeals[index].complexity,
            duration: filteredCategoryMeals[index].duration,
            imageUrl: filteredCategoryMeals[index].imageUrl,
          );
        },
        itemCount: filteredCategoryMeals.length,
      )
    );
  }
}