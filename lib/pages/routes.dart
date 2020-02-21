import './categories_screen.dart';
import './category_meals_screen.dart';
import './meal_detail_screen.dart';

final routes = {
  '/': (context) => CategoriesScreen(),
  '/category-meals': (context) => CategoryMealsScreen(),
  '/category-meals/details': (context) => MealDetailScreen()
};