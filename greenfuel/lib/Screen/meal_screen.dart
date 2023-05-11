import 'package:flutter/material.dart';

import '/Provider/Meal_Provider.dart';
import '/Widgets/List/list_meal.dart';
import '/Widgets/NewItem/new_meal.dart';
import 'package:provider/provider.dart';

import '../Widgets/NewItem/new_exercise.dart';
import '../Widgets/NewItem/new_travel.dart';
import '../Widgets/NewItem/new_weight.dart';
import 'meal_detail_screen.dart';

class MealScreen extends StatefulWidget {
  static const routeName = '/meal';

  MealScreen() {}

  @override
  State<MealScreen> createState() {
    return _MealScreenState();
  }
}

class _MealScreenState extends State<MealScreen> {
  void _showaddmealpopup(BuildContext ctx) {
    showModalBottomSheet(
        enableDrag: true,
        context: ctx,
        builder: (bctx) {
          return GestureDetector(
              onTap: () {}, behavior: HitTestBehavior.opaque, child: NewMeal());
        });
  }

  void _showaddexercisepopup(BuildContext ctx) {
    showModalBottomSheet(
        enableDrag: true,
        context: ctx,
        builder: (bctx) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: NewExercise());
        });
  }

  void _showaddweightpopup(BuildContext ctx) {
    showModalBottomSheet(
        enableDrag: true,
        context: ctx,
        builder: (bctx) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: NewWeight());
        });
  }

  void _showaddtravelpopup(BuildContext ctx) {
    showModalBottomSheet(
        enableDrag: true,
        context: ctx,
        builder: (bctx) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: NewTravel());
        });
  }

  @override
  Widget build(BuildContext context) {
    final _meals = Provider.of<Meal>(context);

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => _showaddexercisepopup(context),
                      icon: Icon(Icons.sports_gymnastics),
                      color: Colors.lightGreen,
                      iconSize: 50),
                  IconButton(
                      onPressed: () => _showaddmealpopup(context),
                      icon: Icon(Icons.add),
                      color: Colors.lightGreen,
                      iconSize: 50),
                  IconButton(
                      onPressed: () => _showaddtravelpopup(context),
                      icon: Icon(Icons.travel_explore),
                      color: Colors.lightGreen,
                      iconSize: 50),
                  IconButton(
                      onPressed: () => _showaddweightpopup(context),
                      icon: Icon(Icons.monitor_weight),
                      color: Colors.lightGreen,
                      iconSize: 50),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              child: ListView.builder(
                  //itemCount: widget._availableMeals.length,
                  itemCount: _meals.items.length,
                  itemBuilder: (ctx, index) => GestureDetector(
                        child: ListMeal(index),
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              MealDetailScreen.routeName,
                              arguments: _meals.items[index].id);
                        },
                      )),
            ),
          ],
        ),
      ),
    ));
  }
}
