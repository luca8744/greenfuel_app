import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/Provider/Weight_Provider.dart';
import 'package:provider/provider.dart';

class ListWeight extends StatelessWidget {
  int _index;

  ListWeight(this._index);

  @override
  Widget build(BuildContext context) {
    final _weight = Provider.of<Weight>(context);

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
                  'Weight: ${_weight.getTotalWeightById(_weight.items[_index].id)}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                    '${DateFormat('y-M-d').format(_weight.items[_index].date as DateTime)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
