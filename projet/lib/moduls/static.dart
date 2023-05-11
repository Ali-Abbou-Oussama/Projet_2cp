// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MYstatic extends StatelessWidget {
  late List<SalesData> _ChartData;

  MYstatic({Key? key}) : super(key: key);
  @override
  void initState() {
    _ChartData = getChartData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: 400,
      height: 250,
      child: Scaffold(
        body: SfCartesianChart(
          series: <ChartSeries>[
            LineSeries<SalesData, double>(
                dataSource: _ChartData,
                yValueMapper: (SalesData Sales, _) => Sales.day,
                xValueMapper: (SalesData Sales, _) => Sales.kg),
          ],
        ),
      ),
    ));
  }

  List<SalesData> getChartData() {
    final List<SalesData> ChartData = [
      SalesData(2, 70),
      SalesData(3, 74),
      SalesData(4, 71),
      SalesData(5, 70),
      SalesData(6, 73),
      SalesData(7, 74),
      SalesData(1, 75),
    ];
    return ChartData;
  }
}

class SalesData {
  SalesData(this.day, this.kg);
  final double day;
  final double kg;
}
