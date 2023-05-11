import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Provider/Exercise_Provider.dart';

class ListExercise extends StatelessWidget {
  int _index;

  ListExercise(this._index);

  @override
  Widget build(BuildContext context) {
    final _exercise = Provider.of<Exercise>(context);

    return Card(
      color: Theme.of(context).canvasColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'KCal: ${_exercise.getTotalKCalById(_exercise.items[_index].id)}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                    '${DateFormat('y-M-d').format(_exercise.items[_index].date as DateTime)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
