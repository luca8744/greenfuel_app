import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Widgets/Chart/spline_chart.dart';
import 'package:provider/provider.dart';

import '../Provider/Weight_Provider.dart';

class BottomStat extends StatelessWidget {
  BottomStat();

  @override
  Widget build(BuildContext context) {
    final _weight = Provider.of<Weight>(context);

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
              child: SplineElement(lstDate, _weight),
            ),
          ],
        )
      ],
    );
  }
}
