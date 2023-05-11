import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

class RadialBarElement extends StatelessWidget {
  final double _valueKCal;
  final double _valueCO2;
  final double _valueWater;
  final double _total;

  RadialBarElement(
      this._valueKCal, this._valueCO2, this._valueWater, this._total);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('KCal', _valueKCal),
      ChartData('CO2', _valueCO2 * 10),
      ChartData('H2O', _valueWater / 10),
    ];

    return Scaffold(
        body: Center(
            child: Container(
                child: SfCircularChart(series: <CircularSeries>[
      // Renders radial bar chart
      RadialBarSeries<ChartData, String>(
          maximumValue: _total,
          dataSource: chartData,
          trackColor: Colors.black12,
          trackOpacity: 0.1,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          radius: '100%',
          cornerStyle: CornerStyle.bothCurve),
    ]))));
  }
}
