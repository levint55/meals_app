import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsPage extends StatefulWidget {
  static const routeName = '/meals';

  const MealsPage({Key? key}) : super(key: key);

  @override
  State<MealsPage> createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  late String? title;
  late List<Meal> filteredMeals;
  late String? id;

  @override
  void didChangeDependencies() {
    final Map<String, String> routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    title = routeArgs['title'];
    id = routeArgs['id'];
    filteredMeals = DUMMY_MEALS.where(
      (element) {
        return element.categories.contains(id);
      },
    ).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      filteredMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
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
            removeItem: _removeMeal,
          );
        },
        itemCount: filteredMeals.length,
      ),
    );
  }
}
