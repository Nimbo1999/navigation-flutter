import 'package:flutter/widgets.dart';
import './tabs_screen.dart';
import './category_meals_screen.dart';
import './meal_detail_screen.dart';
import './settings_screen.dart';
import '../models/meal.dart';

Map<String, WidgetBuilder> routes(Function function, List<Meal> availableMeals, Map<String, bool> filters) {
  return {
    '/': (context) => TabsScreen(),
    '/category-meals': (context) => CategoryMealsScreen(availableMeals),
    '/category-meals/details': (context) => MealDetailScreen(),
    '/settings': (context) => SettingsScreen(function, filters),
  };
}