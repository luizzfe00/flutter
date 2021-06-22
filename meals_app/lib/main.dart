import 'package:flutter/material.dart';

import './screens/category_meals.dart';
import './screens/categories.dart';
import './screens/meal_detail.dart';
import './screens/tabs.dart';
import './screens/filters.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.grey[200],
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),
      home: Tabs(),
      routes: {
        CategoryMeal.routeName: (_) => CategoryMeal(),
        MealDetail.routeName: (_) => MealDetail(),
        Filter.routeName: (_) => Filter(),
      },
      onGenerateRoute: (_) {
        return MaterialPageRoute(builder: (_) => Categories());
      },
      onUnknownRoute: (_) {
        return MaterialPageRoute(builder: (_) => Categories());
      },
    );
  }
}
