
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StockGraph extends StatelessWidget {
  StockGraph({super.key, required this.industryName, required this.delGroupName});

  final String industryName;
  final String delGroupName;

  List<FlSpot> spotsList= [];
  @override
  Widget build(BuildContext context) {
    if (delGroupName == '1A'){
    if(industryName == "Military") {
      spotsList = [
              FlSpot(1, 1),
              FlSpot(2, 10),
              FlSpot(3, 5),
              FlSpot(4, 6),
              FlSpot(5, 8),
              FlSpot(6, 4),
              FlSpot(7, 6),
              FlSpot(8, 10),
              FlSpot(9, 84),
            ];
     } else{
      spotsList = [
              FlSpot(1, 6),
              FlSpot(2, 8),
              FlSpot(3, 1),
              FlSpot(4, 10),
              FlSpot(5, 5),
              FlSpot(6, 3),
              FlSpot(7, 2),
              FlSpot(8, 4),
              FlSpot(9, 10),
            ];
     }}else {
      if(industryName == "Auto") {
      spotsList = [
              FlSpot(1, 1),
              FlSpot(2, 10),
              FlSpot(3, 5),
              FlSpot(4, 6),
              FlSpot(5, 8),
              FlSpot(6, 4),
              FlSpot(7, 6),
              FlSpot(8, 10),
              FlSpot(9, 84),
            ];
     } else {
      spotsList = [
              FlSpot(1, 6),
              FlSpot(2, 8),
              FlSpot(3, 1),
              FlSpot(4, 10),
              FlSpot(5, 5),
              FlSpot(6, 3),
              FlSpot(7, 2),
              FlSpot(8, 4),
              FlSpot(9, 10),
            ];
     }
     }
     

    return LineChart(
      LineChartData(
        rangeAnnotations: RangeAnnotations(),
        backgroundColor: const Color.fromARGB(255, 2, 26, 46),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            left: BorderSide(
              width: 3,
              color: Color.fromARGB(255, 119, 152, 192)
            ),
            bottom: BorderSide(
              width: 3,
            ),
          )
        ),
        gridData: FlGridData(
          drawHorizontalLine: true,
          drawVerticalLine: false,
        ),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            spots: spotsList,
          )
        ]
      ),
    );
  }
}
