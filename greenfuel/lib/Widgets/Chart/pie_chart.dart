import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartElement extends StatelessWidget {
  final double _value;
  final double _total;

  PieChartElement(this._value, this._total);

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Flutter": _total > _value ? _value : _total,
    };

    final colorList = <Color>[
      _total > _value ? Colors.green : Colors.green,
    ];

    return PieChart(
      dataMap: dataMap,
      chartType: ChartType.ring,
      chartRadius: 75,
      legendOptions: LegendOptions(
        showLegends: false,
      ),
      chartValuesOptions: ChartValuesOptions(showChartValues: false),
      totalValue: _total > _value ? _total : _value,
      colorList: colorList,
      baseChartColor:
          _total > _value ? Colors.green.withOpacity(0.30) : Colors.red,
    );
  }
}
