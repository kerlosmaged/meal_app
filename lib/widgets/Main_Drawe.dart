// ignore: file_names
import 'package:flutter/material.dart';

// this is for make an drawer to app
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.amber,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BuildListTile(
            name: "Meal",
            icons: Icons.restaurant_menu,
            function: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          //   BuildListTile(
          //     name: "Filters",
          //     icons: Icons.settings,
          //     function: () {
          //       Navigator.of(context).pushReplacement(
          //         PageRouteBuilder(
          //           pageBuilder: (context, animation, secondaryAnimation) =>
          //               MyFilterScreen(
          //             SaveFunction: () {},
          //             ListData: const {},
          //           ),
          //         ),
          //       );
          //     },
          //   )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BuildListTile(
      {required String name,
      required IconData icons,
      required Function function}) {
    return ListTile(
      leading: Icon(
        icons,
        size: 26,
      ),
      title: Text(
        name,
        style: const TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold),
      ),
      onTap: function(),
    );
  }
}
