import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import '../dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 140,
      width: 300,
      child: child,
    );
  }

  Widget buildIngredients(BuildContext context, Meal selectedMeal) {
    return ListView.builder(
      itemBuilder: (_, index) => Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(selectedMeal.ingredients[index]),
        ),
        color: Theme.of(context).accentColor,
      ),
      itemCount: selectedMeal.ingredients.length,
    );
  }

  Widget buildSteps(BuildContext context, Meal selectedMeal) {
    return ListView.builder(
      itemBuilder: (_, index) => ListTile(
        leading: CircleAvatar(
          child: Text('# ${index + 1}'),
        ),
        title: Text(selectedMeal.steps[index]),
      ),
      itemCount: selectedMeal.steps.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeProps =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeProps['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(context, buildIngredients(context, selectedMeal)),
            buildSectionTitle(context, 'Steps'),
            buildContainer(context, buildSteps(context, selectedMeal))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(id);
        },
      ),
    );
  }
}
