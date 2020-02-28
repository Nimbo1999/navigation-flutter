import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> filteredCategoryMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    //...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_loadedInitData){
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      filteredCategoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    setState(() {
      filteredCategoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: filteredCategoryMeals[index].id,
            title: filteredCategoryMeals[index].title,
            affordability: filteredCategoryMeals[index].affordability,
            complexity: filteredCategoryMeals[index].complexity,
            duration: filteredCategoryMeals[index].duration,
            imageUrl: filteredCategoryMeals[index].imageUrl,
            removeItem: _removeMeal,
          );
        },
        itemCount: filteredCategoryMeals.length,
      )
    );
  }
}