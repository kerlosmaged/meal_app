import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/firebase_options.dart';
import 'package:meal_app/screens/auth%20screen/auth_mode.dart';
import 'package:meal_app/screens/auth%20screen/login.dart';
import 'package:meal_app/screens/favort_screen.dart';

import './dummy_data.dart';
import './models/meal.dart';
import './screens/categories_meal_screen.dart';
import './screens/properites_screen.dart';
import './screens/tabs_screen.dart';
import './screens/categories_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoritsMeals = [];

  // this is for save data
  Map<String, bool> _map = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  // this map we passed in this function and passed in filters screen in constractor
  void setFilters(Map<String, bool> mapSavedData) {
    setState(() {
      _map = mapSavedData;

      availableMeals.where((meal) {
        if (_map['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_map['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_map['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_map['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void setFavorites(String mealId) {
    final exitsIndex = favoritsMeals.indexWhere((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleSmall: const TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
      ),
      //home: const CategoriesScreen(),
      routes: {
        "/": (context) => const Auth(),
        CategoriesMealScreen.routeName: (context) =>
            CategoriesMealScreen(AvailableDataMeal: availableMeals),
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        ProperitesScreen.properitesRouteNamed: (context) =>
            const ProperitesScreen(
              title: '',
            ),
        favoritesScreen.routeNamed: (context) =>
            favoritesScreen(favoriteMeals: favoritsMeals),
        TabView.routinaName: (context) => const TabView(),
        Loginscreen.routNamed: (context) => const Loginscreen(),
      },
    );
  }
}
