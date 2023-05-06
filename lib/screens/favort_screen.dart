import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class favoritesScreen extends StatelessWidget {
  static const String routeNamed = "favoriteScreen";

  const favoritesScreen({
    super.key,
    required List<Meal> favoriteMeals,
  });
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Hello ",
        ),
      ),
    );
  }
}
