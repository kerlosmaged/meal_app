// ignore: file_names
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/properites_screen.dart';

// this is file make data show in second screen or show data for any categories you choose it
// ignore: camel_case_types
class mealDataItem extends StatelessWidget {
  // this is constractor for recived an data from another file
  final String id;
  // ignore: non_constant_identifier_names
  final String ConstractorImageUrl;
  final String title;
  final int duration;
  final Function removeItem;
  final Complexity complexity;
  final Affordability affordability;

  const mealDataItem({
    super.key,
    required this.removeItem,
    required this.id,
    required this.ConstractorImageUrl,
    required this.title,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  // for get value from complexity enum must extract in varible for this we make this get
  String get ComplixtyValueText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      default:
        return "unknwon";
        break;
    }
  }

  // this is affordability show after dolar sign in card and this affordability enum
  String get AffordabilityValueText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;

      default:
        return "unknwon";
        break;
    }
  }

// this function will happend when you click on the item in meal screen(second screen) not in cateogries(first screen)

// for note all data in first screen or second screen saved in file dummy data
  void SelectMealProperites(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(
      ProperitesScreen.properitesRouteNamed,
      arguments: id,
    )
        .then((result) {
      if (result != null) removeItem(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: const Color.fromRGBO(225, 225, 225, 0),
      onTap: () => SelectMealProperites(context),
      borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(40),
        child: Column(children: [
          // this is stack is show app orederd and this containes an image and title with background black
          Stack(
            children: [
              // this is for make an rounded for image and image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  ConstractorImageUrl,
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // this position for title in photo
              Positioned(
                right: 10,
                bottom: 20,
                child: Container(
                  width: 300,
                  color: Colors.black54,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Icon(Icons.schedule),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("$duration Min")
                ],
              ),
              Row(
                children: [const Icon(Icons.work), Text(ComplixtyValueText)],
              ),
              Row(
                children: [
                  const Icon(Icons.attach_money),
                  Text(AffordabilityValueText)
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
