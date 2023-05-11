import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Provider/Exercise_Provider.dart';
import '../Provider/Meal_Provider.dart';
import '../Provider/Travel_Provider.dart';
import '../Provider/Weight_Provider.dart';
import 'Chart/vbar_chart.dart';

class MidStat extends StatelessWidget {
  MidStat();

  @override
  Widget build(BuildContext context) {
    final _exercise = Provider.of<Exercise>(context);
    final _weight = Provider.of<Weight>(context);
    final _travel = Provider.of<Travel>(context);
    final _meals = Provider.of<Meal>(context);

    final List<String> lstDate = [
      DateFormat('yMd')
          .format(DateTime.now().subtract(const Duration(days: 4))),
      DateFormat('yMd')
          .format(DateTime.now().subtract(const Duration(days: 3))),
      DateFormat('yMd')
          .format(DateTime.now().subtract(const Duration(days: 2))),
      DateFormat('yMd')
          .format(DateTime.now().subtract(const Duration(days: 1))),
      DateFormat('yMd').format(DateTime.now())
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 250,
              child: VBarElement(lstDate, _meals, _exercise),
            ),
          ],
        )
      ],
    );
  }
}
