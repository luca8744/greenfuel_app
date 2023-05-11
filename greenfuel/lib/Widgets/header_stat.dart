import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Meal_Provider.dart';
import 'Chart/hbar_chart.dart';
import 'Chart/radialbar_chart.dart';

class HeaderStat extends StatelessWidget {
  String _date;

  HeaderStat(this._date);

  @override
  Widget build(BuildContext context) {
    final _meals = Provider.of<Meal>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  '${_date}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('KCal: ${_meals.getTotalKCalByDay(_date)}'),
                Text('CO2: ${_meals.getTotalCO2ByDay(_date)}'),
                Text('H2O: ${_meals.getTotalWaterByDay(_date)}'),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 200,
                    child: RadialBarElement(
                        _meals.getTotalKCalByDay(_date),
                        _meals.getTotalCO2ByDay(_date),
                        _meals.getTotalWaterByDay(_date),
                        2000)),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 250,
              child: HBarElement(
                  _meals.getTotalProteinByDay(_date),
                  _meals.getTotalFatByDay(_date),
                  _meals.getTotalSugarByDay(_date)),
            ),
          ],
        )
      ],
    );
  }
}
