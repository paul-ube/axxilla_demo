import 'package:axxilla_demo/ui/screens/studies/overdrop_clone/overdrop_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'header.dart';

class HourlyWeatherSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: Header(title: 'Hourly Weather', subtitle: '24-hour forecast'),
        ),
        const SizedBox(height: 24),
        _LineChart()
      ],
    );
  }
}

class _LineChart extends StatefulWidget {
  @override
  __LineChartState createState() => __LineChartState();
}

class __LineChartState extends State<_LineChart> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        child: LineChart(
          showAvg ? avgData() : mainData(),
        ),
      ),
    );
//    return Stack(
//      children: <Widget>[
//        AspectRatio(
//          aspectRatio: 1.70,
//          child: Container(
//            decoration: const BoxDecoration(
//                borderRadius: BorderRadius.all(
//                  Radius.circular(18),
//                ),
//                color: OverDropColors.background),
//            child: SingleChildScrollView(
//              scrollDirection: Axis.horizontal,
//              child: LineChart(
//                showAvg ? avgData() : mainData(),
//              ),
//            ),
//          ),
//        ),
//        SizedBox(
//          width: 60,
//          height: 34,
//          child: FlatButton(
//            onPressed: () {
//              setState(() {
//                showAvg = !showAvg;
//              });
//            },
//            child: Text(
//              'avg',
//              style: TextStyle(
//                  fontSize: 12, color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
//            ),
//          ),
//        ),
//      ],
//    );
  }

  LineChartData mainData() {
    return LineChartData(

      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        drawHorizontalLine: false,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: OverDropColors.darkBlue,
            strokeWidth: 1,
          );
        },
      ),

      titlesData: FlTitlesData(
        show: true,

        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 50,
          textStyle: const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '13';
              case 2:
                return '14';
              case 3:
                return '15';
              case 4:
                return '16';
              case 5:
                return '17';
              case 6:
                return '18';
              case 7:
                return '19';
            }
            return '';
          },
          margin: 8,
        ),

        leftTitles: SideTitles(
          showTitles: false,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: false,
          border: Border.all(color: const Color(0xff37434d), width: 1, style: BorderStyle.none)),
      minX: 0,
      maxX: 7,
      minY: 30,
      maxY: 40,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(1, 35),
            FlSpot(2, 36),
            FlSpot(3, 36),
            FlSpot(4, 36),
            FlSpot(5, 35),
            FlSpot(6, 35),
            FlSpot(7, 34),
          ],
          isCurved: true,
          colors: [OverDropColors.blue],
          barWidth: 3,
          isStrokeCapRound: true,
          aboveBarData: BarAreaData(
            show: true,
            colors: [OverDropColors.background]
          ),
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}
