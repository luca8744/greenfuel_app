import 'package:flutter/material.dart';
import '/Provider/Weight_Provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}

class SplineElement extends StatelessWidget {
  List<String> _datepart;
  Weight _weight;

  SplineElement(this._datepart, this._weight);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(4, _weight.getTotalWeightByDay(_datepart[4])),
      ChartData(3, _weight.getTotalWeightByDay(_datepart[3])),
      ChartData(2, _weight.getTotalWeightByDay(_datepart[2])),
      ChartData(1, _weight.getTotalWeightByDay(_datepart[1])),
      ChartData(0, _weight.getTotalWeightByDay(_datepart[0]))
    ];

    return Scaffold(
        body: Center(
            child: Container(
                child: SfCartesianChart(series: <ChartSeries>[
      SplineAreaSeries<ChartData, int>(
          dataSource: chartData,
          splineType: SplineType.cardinal,
          cardinalSplineTension: 0.9,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y)
    ]))));
  }
}
