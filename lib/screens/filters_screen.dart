import 'package:flutter/material.dart';
import '../widgets/Main_Drawe.dart';

class MyFilterScreen extends StatefulWidget {
  static const RoutNamed = "MyFilterScreen";
  final Function SaveFunction;
  final Map<String, bool> ListData;

  const MyFilterScreen(
      {super.key, required this.SaveFunction, required this.ListData});

  @override
  State<MyFilterScreen> createState() => _MyFilterScreenState();
}

class _MyFilterScreenState extends State<MyFilterScreen> {
  // all of this varible will be in the first false becase make the user don't make any filterd
  bool _glutenFree = false;

  bool _lactoseFree = false;

  bool _vegan = false;

  bool _vegetarian = false;

  @override
  void initState() {
    _glutenFree = widget.ListData['gluten']!;

    _lactoseFree = widget.ListData['lactose']!;

    _vegan = widget.ListData['vegan']!;

    _vegetarian = widget.ListData['vegetarian']!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                final Map<String, bool> selectedData = {
                  "gluten": _glutenFree,
                  "lactose": _lactoseFree,
                  "vegan": _vegan,
                  "vegetarian": _vegetarian,
                };
                widget.SaveFunction(selectedData);
              },
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust Your Meal Selection.",
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
          ),
          // this widget take all space empty of the column
          Expanded(
            child: ListView(
              children: [
                BuildTheSwitchListTile(
                  "Gulten-free",
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                BuildTheSwitchListTile(
                  "Lactose-free",
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                BuildTheSwitchListTile(
                  "Vegetarian",
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                BuildTheSwitchListTile(
                  "Vegan",
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
      drawer: const MyDrawer(),
    );
  }

  SwitchListTile BuildTheSwitchListTile(
      String title, bool VaribleName, Function UpdateValue) {
    return SwitchListTile(
      value: VaribleName,
      onChanged: UpdateValue(),
      title: Text(title),
    );
  }
}
