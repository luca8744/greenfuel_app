import 'package:flutter/material.dart';
import '/Provider/Exercise_Provider.dart';
import 'Provider/Travel_Provider.dart';
import 'Provider/Weight_Provider.dart';
import 'package:provider/provider.dart';

import 'Models/Meal.dart';
import 'Provider/Meal_Provider.dart';
import 'Provider/User_Provider.dart';
import 'Screen/extra_screen.dart';
import 'Screen/ingredient_screen.dart';
import 'Screen/meal_detail_screen.dart';
import 'Screen/meal_screen.dart';
import 'Screen/statistic_screen.dart';
import 'Screen/tab_screen.dart';
import 'Screen/user_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<MealItem> _availableMeals = [];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Meal(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => User(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Exercise(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Weight(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Travel(),
        ),
      ],
      child: MaterialApp(
        title: 'MyApp',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          canvasColor: Color.fromRGBO(253, 253, 253, 1),
        ),
        initialRoute: TabScreen.routeName,
        routes: {
          TabScreen.routeName: (ctx) => TabScreen(_availableMeals),
          IngredientScreen.routeName: (ctx) => IngredientScreen(),
          StatisticScreen.routeName: (ctx) => StatisticScreen(
              //_availableMeals
              ),
          MealDetailScreen.routeName: (ctx) =>
              MealDetailScreen(_availableMeals),
          UserScreen.routeName: (ctx) => UserScreen(),
          MealScreen.routeName: (ctx) => MealScreen(),
          ExtraScreen.routeName: (ctx) => ExtraScreen(),
        },
      ),
    );
  }
}
