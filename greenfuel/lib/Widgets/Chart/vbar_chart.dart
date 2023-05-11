import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Provider/Exercise_Provider.dart';
import '../../Provider/Meal_Provider.dart';

class ChartData {
  ChartData(this.x, this.y, this.y1);
  final int x;
  final double y;
  final double y1;
}

class VBarElement extends StatelessWidget {
  List<String> _datepart;
  Exercise _exercise;
  Meal _meal;

  VBarElement(this._datepart, this._meal, this._exercise);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(4, _meal.getTotalKCalByDay(_datepart[4]),
          _exercise.getTotalKCalByDay(_datepart[4])),
      ChartData(3, _meal.getTotalKCalByDay(_datepart[3]),
          _exercise.getTotalKCalByDay(_datepart[3])),
      ChartData(2, _meal.getTotalKCalByDay(_datepart[2]),
          _exercise.getTotalKCalByDay(_datepart[2])),
      ChartData(1, _meal.getTotalKCalByDay(_datepart[1]),
          _exercise.getTotalKCalByDay(_datepart[1])),
      ChartData(0, _meal.getTotalKCalByDay(_datepart[0]),
          _exercise.getTotalKCalByDay(_datepart[0]))
    ];

    return Scaffold(
        body: Center(
            child: Container(
                child: SfCartesianChart(
                    // Columns will be rendered back to back
                    enableSideBySideSeriesPlacement: false,
                    primaryXAxis: NumericAxis(
                        //to hide whole axis
                        isVisible: false,
                        // To hide the axis label alone
                        labelStyle: const TextStyle(fontSize: 0)),
                    legend: Legend(
                        isVisible: true,
                        position: LegendPosition.bottom,
                        overflowMode: LegendItemOverflowMode.wrap,
                        height: "80",
                        width: "200",
                        textStyle: TextStyle(fontSize: 15)),
                    series: <ChartSeries<ChartData, int>>[
          ColumnSeries<ChartData, int>(
              dataSource: chartData,
              name: 'Meal',
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y),
          ColumnSeries<ChartData, int>(
              opacity: 0.9,
              width: 0.4,
              name: 'Exercise',
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y1)
        ]))));
  }
}
