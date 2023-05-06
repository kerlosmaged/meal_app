import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

// this is showing in third click or third screen
class ProperitesScreen extends StatelessWidget {
  // this varible for constarctor and for move data
  final String title;

  const ProperitesScreen({super.key, required this.title});

  Widget buildSectionTitle(BuildContext context, String name) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        name,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }

  // this is for make an route name
  static const String properitesRouteNamed = "ProperitesScreen";

  @override
  Widget build(BuildContext context) {
    // this is for resived meal id for send data from mealItem file in widgets folder
    final String MealId = ModalRoute.of(context)!.settings.arguments as String;

    // now we need to create an dummymeal filter for make this meal you choose it showing the data
    final selectedDataDummyMealproperty =
        DUMMY_MEALS.firstWhere((element) => element.id == MealId);

    Widget buildContainerOfAllvalue(Widget child) {
      return Container(
        width: 400,
        height: 200,
        padding: const EdgeInsets.all(15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black)),
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedDataDummyMealproperty.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // this container for image
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(selectedDataDummyMealproperty.imageUrl),
            ),
            // this function for make title ingredintes

            buildSectionTitle(context, "Ingredients"),

            // this container for list of ingredients
            buildContainerOfAllvalue(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.amber,
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Text(
                        selectedDataDummyMealproperty.ingredients[index],
                      ),
                    ),
                  );
                },
                // the len of list ingredients inside the dummy meal
                itemCount: selectedDataDummyMealproperty.ingredients.length,
              ),
            ),
            // this is for make an steps title
            buildSectionTitle(context, "Steps"),

            // this is for make an steps body or showing steps
            buildContainerOfAllvalue(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(child: Text("# ${index + 1}")),
                        title: Text(selectedDataDummyMealproperty.steps[index]),
                      ),
                      const Divider(),
                    ],
                  );
                },
                // the len of list ingredients inside the dummy meal
                itemCount: selectedDataDummyMealproperty.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.delete,
        ),
        onPressed: () {
          Navigator.of(context).pop(MealId);
        },
      ),
    );
  }
}
