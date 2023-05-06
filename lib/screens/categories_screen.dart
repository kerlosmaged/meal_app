import 'package:flutter/material.dart';
import '../widgets/categoryItem.dart';
import '../dummy_data.dart';

// this for first screen show data
class CategoriesScreen extends StatelessWidget {
  static const routeName = "CategoriesScreen";

  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // this is first screen view and showing
      body: GridView(
        padding: const EdgeInsets.all(25),
        // this is for import data from dummy categories for show in first screen or Categories screen
        // ignore: sort_child_properties_last
        children: [
          ...DUMMY_CATEGORIES.map(
            (itemDatacategories) => CategoriesItem(
                id: itemDatacategories.id,
                title: itemDatacategories.title,
                color: itemDatacategories.color),
          ),
        ],
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          maxCrossAxisExtent: 200,
        ),
      ),
    );
  }
}
