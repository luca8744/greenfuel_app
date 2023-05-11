import 'package:flutter/material.dart';
import '/Provider/Travel_Provider.dart';
import '/Provider/Weight_Provider.dart';
import '/Widgets/List/list_travel.dart';
import '/Widgets/NewItem/new_weight.dart';
import 'package:provider/provider.dart';

import '../Provider/Exercise_Provider.dart';
import '../Widgets/NewItem/new_travel.dart';
import '../Widgets/List/list_exercise.dart';
import '../Widgets/List/list_weight.dart';
import '../Widgets/NewItem/new_exercise.dart';
import '../Widgets/NewItem/new_meal.dart';

class ExtraScreen extends StatefulWidget {
  static const routeName = '/extra';

  ExtraScreen() {}

  @override
  State<ExtraScreen> createState() {
    return _ExtraScreenState();
  }
}

class _ExtraScreenState extends State<ExtraScreen> {
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
    final _exercise = Provider.of<Exercise>(context);
    final _weight = Provider.of<Weight>(context);
    final _travel = Provider.of<Travel>(context);

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
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * 0.28,
                    child: ListView.builder(
                        //itemCount: widget._availableMeals.length,
                        itemCount: _exercise.items.length,
                        itemBuilder: (ctx, index) => GestureDetector(
                            child: ListExercise(index), onTap: null)),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * 0.28,
                    child: ListView.builder(
                        //itemCount: widget._availableMeals.length,
                        itemCount: _travel.items.length,
                        itemBuilder: (ctx, index) => GestureDetector(
                            child: ListTravel(index), onTap: null)),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * 0.28,
                    child: ListView.builder(
                        //itemCount: widget._availableMeals.length,
                        itemCount: _weight.items.length,
                        itemBuilder: (ctx, index) => GestureDetector(
                            child: ListWeight(index), onTap: null)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
