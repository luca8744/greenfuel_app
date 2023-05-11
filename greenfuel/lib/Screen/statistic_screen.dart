import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/Provider/Meal_Provider.dart';
import '/Widgets/bottom_stat.dart';
import '/Widgets/header_stat.dart';
import '/Widgets/NewItem/new_meal.dart';
import 'package:provider/provider.dart';

import '../Widgets/NewItem/new_exercise.dart';
import '../Widgets/NewItem/new_weight.dart';
import '../Widgets/NewItem/new_travel.dart';
import '../Widgets/mid_stat.dart';

import '../Widgets/ingredient_details.dart';

class StatisticScreen extends StatefulWidget {
  static const routeName = '/statistic';

  StatisticScreen() {}

  @override
  State<StatisticScreen> createState() {
    return _StatisticScreenState();
  }
}

class _StatisticScreenState extends State<StatisticScreen> {
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
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: Card(
                child: Column(
                  children: [
                    HeaderStat(DateFormat('yMd').format(DateTime.now())),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: Card(
                child: Column(
                  children: [
                    MidStat(),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: Card(
                child: Column(
                  children: [
                    BottomStat(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
