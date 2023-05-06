import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/auth%20screen/login.dart';
import '../screens/categories_screen.dart';
import '../screens/favort_screen.dart';

class TabView extends StatefulWidget {
  static const routinaName = "tabsScreen";

  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  // this map for on tap changed page
  final List<Map<String, Widget>> _pages = [
    {
      'page': const CategoriesScreen(),
    },
    {
      'page': const favoritesScreen(
        favoriteMeals: [],
      ),
    }
  ];

  final List<Map<String, String>> _pagesTitle = [
    {
      'title': "Your Categories Screen",
    },
    {
      'title': "Your Favorite Screen",
    }
  ];

  // this is fuction for make changes when you tab
  int changedValue = 0;
  void _selectedPage(int value) {
    setState(() {
      changedValue = value;
    });
  }

  FirebaseAuth inistance = FirebaseAuth.instance;

  @override
  void initState() {
    inistance.authStateChanges().listen((event) {
      if (event == null) {
        setState(() {
          Navigator.of(context).pushReplacementNamed(Loginscreen.routNamed);
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello ${FirebaseAuth.instance.currentUser!.email}"),
      ),
      body: _pages[changedValue]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: changedValue,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
        ],
      ),
      // drawer: const MyDrawer(),
    );
  }
}
