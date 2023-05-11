import 'package:fitness/moduls/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {
  final List weeklySummary;

  const MyBarGraph({
    Key? key,
    required this.weeklySummary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        sunAmount: weeklySummary[0],
        monAmount: weeklySummary[1],
        tueAmount: weeklySummary[2],
        wedAmount: weeklySummary[3],
        thuAmount: weeklySummary[4],
        friAmount: weeklySummary[5],
        satAmount: weeklySummary[6]);
    myBarData.initializeBarData();
    return BarChart(BarChartData(
      maxY: 2240,
      minY: 0,
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        show: true,
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles:
              SideTitles(showTitles: true, getTitlesWidget: getBottomTitles),
        ),
      ),
      barGroups: myBarData.barData
          .map((data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                      toY: data.y,
                      color: const Color(0xffd0fd3e),
                      borderRadius: BorderRadius.circular(4),
                      width: 20,
                      backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: 100,
                          color: const Color(0x5a7388a9))),
                ],
              ))
          .toList(),
    ));
  }

  Widget getBottomTitles(double value, TitleMeta meta) {
    const style =
        TextStyle(color: Color(0x59ffffff), fontFamily: 'Roboto', fontSize: 13);

    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text("Sun", style: style);
        break;
      case 1:
        text = const Text("Mon", style: style);
        break;
      case 2:
        text = const Text("Tue", style: style);
        break;
      case 3:
        text = const Text("Wed", style: style);
        break;
      case 4:
        text = const Text("Thu", style: style);
        break;
      case 5:
        text = const Text("Fri", style: style);
        break;
      case 6:
        text = const Text("Sat", style: style);
        break;
      default:
        text = const Text('');
        break;
    }
    return SideTitleWidget(axisSide: meta.axisSide, child: text);
  }
}
