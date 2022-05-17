import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal-detail';
  const MealDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String? mealId = routeArgs['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(mealId!),
      ),
      body: Center(
        child: Text(mealId),
      ),
    );
  }
}
