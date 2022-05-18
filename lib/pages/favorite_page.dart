import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritePage extends StatelessWidget {
  final List<Meal> _favoriteMeals;

  const FavoritePage(this._favoriteMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      return const Center(child: Text('No Favorite Meal'));
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: _favoriteMeals[index].id,
            imageUrl: _favoriteMeals[index].imageUrl,
            title: _favoriteMeals[index].title,
            duration: _favoriteMeals[index].duration,
            complexity: _favoriteMeals[index].complexity,
            affordability: _favoriteMeals[index].affordability,
          );
        },
        itemCount: _favoriteMeals.length,
      );
    }
  }
}
