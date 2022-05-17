import 'package:flutter/material.dart';
import 'package:meals_app/pages/meals_page.dart';
import 'package:meals_app/pages/tabs_screen.dart';
import 'package:meals_app/widgets/meal_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const TabsScreen(),
        MealsPage.routeName: (context) => const MealsPage(),
        MealDetail.routeName: (context) => const MealDetail(),
      },
    );
  }
}
