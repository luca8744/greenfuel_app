import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/Provider/Travel_Provider.dart';
import 'package:provider/provider.dart';

class ListTravel extends StatelessWidget {
  int _index;

  ListTravel(this._index);

  @override
  Widget build(BuildContext context) {
    final _travel = Provider.of<Travel>(context);

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
                  'Km: ${_travel.getTotalKmById(_travel.items[_index].id)}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                    '${DateFormat('y-M-d').format(_travel.items[_index].date as DateTime)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
