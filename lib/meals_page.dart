import 'package:flutter/material.dart';

class MealsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final String? title = routeArgs['title'];
    final String? id = routeArgs['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Center(
        child: Text(
          id!,
        ),
      ),
    );
  }
}
