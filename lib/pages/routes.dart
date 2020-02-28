import './tabs_screen.dart';
import './category_meals_screen.dart';
import './meal_detail_screen.dart';
import './settings_screen.dart';

final routes = {
  '/': (context) => TabsScreen(),
  '/category-meals': (context) => CategoryMealsScreen(),
  '/category-meals/details': (context) => MealDetailScreen(),
  '/settings': (context) => SettingsScreen(),
};