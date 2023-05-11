import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final double x;
  final double y;
}

class HBarElement extends StatelessWidget {
  final double _value_1;
  final double _value_2;
  final double _value_3;

  HBarElement(this._value_1, this._value_2, this._value_3);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData_1 = [ChartData(1, _value_1)];
    final List<ChartData> chartData_2 = [ChartData(1, _value_2)];
    final List<ChartData> chartData_3 = [ChartData(1, _value_3)];

    return Scaffold(
        body: Container(
            child: SfCartesianChart(
                backgroundColor: Colors.transparent,
                plotAreaBorderWidth: 0,
                primaryYAxis: NumericAxis(
                    //to hide whole axis
                    isVisible: false,
                    // To hide the axis label alone
                    labelStyle: const TextStyle(fontSize: 0)),
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
                series: <ChartSeries>[
          BarSeries<ChartData, double>(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            width: 0.5,
            spacing: 0.2,
            name: 'Protein',
            dataSource: chartData_1,
            trackColor: Colors.black12,
            // Renders the track
            isTrackVisible: true,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
          ),
          BarSeries<ChartData, double>(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              width: 0.5,
              spacing: 0.2,
              name: 'Fat',
              dataSource: chartData_2,
              trackColor: Colors.black12,
              // Renders the track
              isTrackVisible: true,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y),
          BarSeries<ChartData, double>(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              width: 0.5,
              spacing: 0.2,
              name: 'Sugar',
              dataSource: chartData_3,
              trackColor: Colors.black12,
              // Renders the track
              isTrackVisible: true,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ])));
  }
}
