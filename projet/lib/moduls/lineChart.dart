// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartWidget extends StatelessWidget {
  TooltipBehavior? _tooltipBehavior;

  LineChartWidget({Key? key}) : super(key: key);

  void initState() {
    _tooltipBehavior = TooltipBehavior(
        enable: true, borderWidth: 5, color: const Color(0xffec6666));
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        // Chart title
        title: ChartTitle(text: 'Weight Kg'),
        // Enable legend
        legend: Legend(isVisible: true),
        // Enable tooltip
        tooltipBehavior: _tooltipBehavior,
        series: <LineSeries<SalesData, String>>[
          LineSeries<SalesData, String>(
              dataSource: <SalesData>[
                SalesData('week1', 70),
                SalesData('week2', 71),
                SalesData('Wed', 74),
                SalesData('Thu', 71),
                SalesData('Fri', 73),
                SalesData('Sat', 74),
                SalesData('Sun', 75),
              ],
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales,
              // Enable data label
              dataLabelSettings: const DataLabelSettings(isVisible: true))
        ]);
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
