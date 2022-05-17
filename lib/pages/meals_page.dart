import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsPage extends StatelessWidget {
  static const routeName = '/meals';

  const MealsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Map<String, String> routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final String? title = routeArgs['title'];
    final String? id = routeArgs['id'];
    final filteredMeals = DUMMY_MEALS.where(
      (element) {
        return element.categories.contains(id);
      },
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: filteredMeals[index].id,
            imageUrl: filteredMeals[index].imageUrl,
            title: filteredMeals[index].title,
            duration: filteredMeals[index].duration,
            complexity: filteredMeals[index].complexity,
            affordability: filteredMeals[index].affordability,
          );
        },
        itemCount: filteredMeals.length,
      ),
    );
  }
}
