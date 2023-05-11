import 'package:flutter/material.dart';
import '../Screen/extra_screen.dart';
import '../Screen/meal_screen.dart';
import '../Screen/statistic_screen.dart';
import '../Screen/user_screen.dart';

import '../Models/Meal.dart';

class TabScreen extends StatefulWidget {
  static const routeName = '/tab-screen';
  List<MealItem> _availableMeals = [];

  TabScreen(this._availableMeals);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages = [];
  int _selectedPage = 0;

  void initState() {
    _pages = [
      {'page': UserScreen(), 'title': 'User'},
      {'page': StatisticScreen(), 'title': 'Statistic'},
      {'page': MealScreen(), 'title': 'Meal'},
      {'page': ExtraScreen(), 'title': 'Extra'},
    ];

    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPage]['title'] as String,
        ),
      ),
      drawer: null,
      body: _pages[_selectedPage]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).focusColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).toggleableActiveColor,
        currentIndex: _selectedPage,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).focusColor,
            icon: Icon(Icons.settings),
            label: 'User',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).focusColor,
            icon: Icon(Icons.category),
            label: 'Statistic',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).focusColor,
            icon: Icon(Icons.food_bank),
            label: 'Meal',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).focusColor,
            icon: Icon(Icons.extension_rounded),
            label: 'Extra',
          )
        ],
      ),
    );
  }
}
