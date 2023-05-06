// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_meal_screen.dart';

// this widget for show data about categories (first screen)
class CategoriesItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  // ignore: use_key_in_widget_constructors
  const CategoriesItem({
    required this.id,
    required this.title,
    required this.color,
  });

  // this varible is an define in constractor and passed value in page categories_screen and this value i used it in this page

  // this is very import part in app because you move data from categories screen (first screen) to meal screen (second screen from this ) from this function
  selectCategories(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoriesMealScreen.routeName,
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // if you click the selectCategories will go to categoriesmeal
      onTap: () => selectCategories(context),
      splashColor: Theme.of(context).canvasColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
