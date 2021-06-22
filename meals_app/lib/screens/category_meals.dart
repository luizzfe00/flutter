import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMeal extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealState createState() => _CategoryMealState();
}

class _CategoryMealState extends State<CategoryMeal> {
  String title;
  List<Meal> displayedMeals;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_isLoading) {
      final routeProps =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      title = routeProps['title'];
      final id = routeProps['id'];
      displayedMeals =
          DUMMY_MEALS.where((meal) => meal.categories.contains(id)).toList();
      _isLoading = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String id) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) => MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            removeItem: _removeMeal,
          ),
          itemCount: displayedMeals.length,
        ),
      ),
    );
  }
}
