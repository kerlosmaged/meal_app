// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/mealItem.dart';

class CategoriesMealScreen extends StatefulWidget {
  static const routeName = "CategoriesMealScreen";

  // this is for take an constracotor about meal filterd from main.dart
  final List<Meal> AvailableDataMeal;

  const CategoriesMealScreen({
    Key? key,
    required this.AvailableDataMeal,
  }) : super(key: key);

  @override
  State<CategoriesMealScreen> createState() => _CategoriesMealScreenState();
}

// this for show in second screen data
class _CategoriesMealScreenState extends State<CategoriesMealScreen> {
  late String CategoryTitle;
  late List<Meal> displayedMeal;

  // this is complete before build the widget
  // we used didChangeDependencies because if we used initState don't use context global
  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final CategoryId = routeArg['id'];
    CategoryTitle = routeArg['title']!;

    // dummy meal have an meals data that's show in you presse in the item but dummy categories have an first data or categories in app
    // this is varible return an meal Id and meal id contains categories id and this id have an item data all of this in dummey_data and will return an dumey_categories id
    displayedMeal = widget.AvailableDataMeal.where((meal) {
      return meal.categories.contains(CategoryId);
    }).toList();

    super.didChangeDependencies();
  }

// this function for remove data from properites page
  void _removeItem(String constractorMealId) {
    setState(() {
      // this element is an varible and passed into displayedMeal you can access id from this displayedMeallist
      //displayedMeal ==  DUMMY_MEALS but filterd in the varible have where
      displayedMeal.removeWhere((element) => constractorMealId == element.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(CategoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          // this value you return it for meal data item file and will store in varible you declear it in this file
          return mealDataItem(
            removeItem: _removeItem,
            id: displayedMeal[index].id,
            ConstractorImageUrl: displayedMeal[index].imageUrl,
            complexity: displayedMeal[index].complexity,
            duration: displayedMeal[index].duration,
            title: displayedMeal[index].title,
            affordability: displayedMeal[index].affordability,
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
