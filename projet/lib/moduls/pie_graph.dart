import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';

Map<String, double> dataMap = {
  'Protein': 65,
  'Carbs': 10,
  'Fat': 25,
};
List<Color> colorList = [
  Colors.red,
  const Color(0xffe79332),
  const Color(0xffd0fd3e),
];
Widget pieChart() {
  return PieChart(
    dataMap: dataMap,
    initialAngleInDegree: 0,
    animationDuration: const Duration(milliseconds: 2000),
    chartType: ChartType.ring,
    ringStrokeWidth: 9,
    colorList: colorList,
    chartLegendSpacing: 100,
    chartValuesOptions: const ChartValuesOptions(
        showChartValuesOutside: true,
        showChartValuesInPercentage: false,
        showChartValueBackground: true,
        showChartValues: true,
        decimalPlaces: 1,
        chartValueStyle: TextStyle(
          color: Colors.white,
          backgroundColor: Color(0xff636363),
        )),
    legendOptions: const LegendOptions(
      showLegendsInRow: false,
      showLegends: true,
      legendShape: BoxShape.circle,
      legendPosition: LegendPosition.right,
      legendTextStyle: TextStyle(
        color: Color(0xb2ffffff),
        fontSize: 13,
        fontFamily: 'WorkSans',
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
