import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Provider/Meal_Provider.dart';
import '../../data.dart';

class ListMeal extends StatelessWidget {
  int _index;

  ListMeal(this._index);

  @override
  Widget build(BuildContext context) {
    final _meals = Provider.of<Meal>(context);

    return Card(
      color: Theme.of(context).canvasColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    '${DateFormat('y-M-d').format(_meals.items[_index].date as DateTime)} - ${TYPE_INGREDIENTS[_meals.items[_index].type.index]}'),
                Text('KCal: ${_meals.getTotalKCal(_meals.items[_index].id)}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ingredients: ${_meals.items[_index].ingredients.length}'),
                Text('CO2: ${_meals.getTotalCO2(_meals.items[_index].id)}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(''),
                Text('Water: ${_meals.getTotalWater(_meals.items[_index].id)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
