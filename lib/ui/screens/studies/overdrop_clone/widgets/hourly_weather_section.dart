import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../change_notifier_provider.dart';
import '../overdrop_colors.dart';
import 'header.dart';

class HourlyWeatherSection extends StatefulWidget {
  @override
  _HourlyWeatherSectionState createState() => _HourlyWeatherSectionState();
}

class _HourlyWeatherSectionState extends State<HourlyWeatherSection>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
        length: 3,
        vsync: this,
        initialIndex: context.read<SelectedIndex>().selectedIndex);
//    _tabController.addListener(_handleTabChange);
    super.initState();
  }

//  void _handleTabChange() {
//    if (_tabController.index.round() !=
//        context.read<SelectedIndex>().selectedIndex) {
//      setState(() {
//        context.read<SelectedIndex>().changeIndex(_tabController.index.round());
//      });
//    }
//  }

  @override
  void dispose() {
//    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: Header(title: 'Hourly Weather', subtitle: '24-hour forecast'),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: TabBar(
            controller: _tabController,
            onTap: (int) {
              context.read<SelectedIndex>().changeIndex(int);
            },
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: OverDropColors.active,
            indicatorWeight: 1.5,
            labelColor: OverDropColors.active,
            unselectedLabelColor: OverDropColors.subText,
            labelStyle: Theme.of(context).textTheme.subtitle1.copyWith(
                  fontSize: 18,
                  color: OverDropColors.subText,
                  letterSpacing: 0.1,
                ),
            tabs: <Widget>[
              Tab(
                text: context.watch<SelectedIndex>().selectedIndex != 0
                    ? 'Temperature'
                    : 'Temperature • °C',
              ),
              Tab(
                text: context.watch<SelectedIndex>().selectedIndex != 1
                    ? 'Wind'
                    : 'Wind • km/h',
              ),
              Tab(
                text: context.watch<SelectedIndex>().selectedIndex != 2
                    ? 'Rain'
                    : 'Rain • %',
              ),
            ],
          ),
        ),
        _LineChart(),
        const SizedBox(height: 38),
      ],
    );
  }
}

class _LineChart extends StatefulWidget {
  final int selectedIndex;

  const _LineChart({Key key, this.selectedIndex}) : super(key: key);

  @override
  __LineChartState createState() => __LineChartState();
}

class __LineChartState extends State<_LineChart> {
  List<int> showIndexes = [];
  final List<FlSpot> allSpots = [
    FlSpot(0, 35),
    FlSpot(1, 35),
    FlSpot(2, 34),
    FlSpot(3, 34),
    FlSpot(4, 34),
    FlSpot(5, 34),
    FlSpot(6, 33),
    FlSpot(7, 33),
    FlSpot(8, 33),
    FlSpot(9, 33),
    FlSpot(10, 33),
    FlSpot(11, 33),
    FlSpot(12, 33),
    FlSpot(13, 33),
    FlSpot(14, 34),
    FlSpot(15, 34),
    FlSpot(16, 35),
    FlSpot(17, 35),
    FlSpot(18, 34),
    FlSpot(19, 35),
    FlSpot(20, 36),
    FlSpot(21, 37),
    FlSpot(22, 34),
    FlSpot(23, 33),
    FlSpot(24, 32),
  ];

  List<FlSpot> allZero;

  List<FlSpot> randomWinds;

  @override
  void initState() {
    for (int x = 0; x < allSpots.length; x++) {
      showIndexes.add(x);
    }

    allZero =
        List.generate(allSpots.length, (index) => FlSpot(index.toDouble(), 0));

    randomWinds = List.generate(allSpots.length, (index) {
      double abc = Random().nextInt(12).toDouble();
      if (abc < 5) {
        abc = 7;
      }
      return FlSpot(index.toDouble(), abc);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<FlSpot> _spot;
    double maxY;

    switch (context.watch<SelectedIndex>().selectedIndex) {
      case (0):
        _spot = allSpots;
        maxY = 38;
        break;
      case (1):
        _spot = randomWinds;
        maxY = 15;
        break;
      case (2):
        _spot = allZero;
        maxY = 12;
        break;
      default:
        _spot = allSpots;
        maxY = 38;
    }

    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showIndexes,
        spots: _spot,
        isCurved: true,
        curveSmoothness: 0.2,
        barWidth: 3,
        isStrokeCapRound: true,
        belowBarData: BarAreaData(
            show: true,
            colors: [
              OverDropColors.blue,
              OverDropColors.darkBlue.withOpacity(0.5),
              OverDropColors.darkBlue.withOpacity(0.5),
              OverDropColors.darkBlue.withOpacity(0.01),
            ],
            gradientColorStops: [
              0.1,
              0.5,
              0.7,
              1.0,
            ],
            gradientFrom: Offset(0, 0),
            gradientTo: Offset(0, 1)),
        dotData: FlDotData(show: false),
        colors: [
          OverDropColors.blue,
        ],
        colorStops: [
          0.1,
        ],
      ),
    ];

    final LineChartBarData tooltipsOnBar = lineBarsData[0];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
//      width: MediaQuery.of(context).size.width,
        width: (allSpots.length.toDouble() * 60),
        height: 200,
        child: LineChart(
          LineChartData(
            showingTooltipIndicators: showIndexes.map((index) {
              return ShowingTooltipIndicators(index, [
                LineBarSpot(tooltipsOnBar, lineBarsData.indexOf(tooltipsOnBar),
                    tooltipsOnBar.spots[index]),
              ]);
            }).toList(),
            lineTouchData: LineTouchData(
              enabled: false,
              getTouchedSpotIndicator:
                  (LineChartBarData barData, List<int> spotIndexes) {
                return spotIndexes.map((index) {
                  if (index == (allSpots.length - 1)) {
                    return TouchedSpotIndicatorData(
                      FlLine(
                        color: Colors.transparent,
                      ),
                      FlDotData(show: false),
                    );
                  }

                  return TouchedSpotIndicatorData(
                    FlLine(
                      color: index != 0
                          ? OverDropColors.blue.withOpacity(0.5)
                          : Colors.transparent,
                      strokeWidth: 0.5,
                    ),
                    FlDotData(
                      show: false,
//                    getDotPainter: (spot, percent, barData, index) =>
//                        FlDotCirclePainter(
//                      radius: 8,
//                      color: lerpGradient(
//                          barData.colors, barData.colorStops, percent / 100),
//                      strokeWidth: 2,
//                      strokeColor: Colors.black,
//                    ),
                    ),
                  );
                }).toList();
              },
              touchTooltipData: LineTouchTooltipData(
                tooltipBgColor: Colors.transparent,
                tooltipPadding: EdgeInsets.zero,
                tooltipBottomMargin: 10,
//                tooltipRoundedRadius: 8,
                getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                  return lineBarsSpot.map((lineBarSpot) {
                    if (lineBarSpot.x == 0 ||
                        lineBarSpot.x == (allSpots.length - 1)) {
                      return LineTooltipItem(
                        lineBarSpot.y.toString(),
                        const TextStyle(
                            color: Colors.transparent,
                            fontWeight: FontWeight.w500),
                      );
                    }

                    String degree = '°';

                    if (context.read<SelectedIndex>().selectedIndex == 1) {
                      degree = '';
                    }

                    if (context.read<SelectedIndex>().selectedIndex == 2) {
                      degree = '%';
                    }

                    return LineTooltipItem(
                      '${lineBarSpot.y.toInt().toString()}$degree',
                      const TextStyle(
                          color: OverDropColors.subText,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    );
                  }).toList();
                },
              ),
            ),
            lineBarsData: lineBarsData,
            minX: 0,
            maxX: allSpots.length.toDouble() - 1,
            minY: context.watch<SelectedIndex>().selectedIndex != 0 ? 0 : 31,
            maxY: maxY,
            titlesData: FlTitlesData(
              leftTitles: SideTitles(
                showTitles: false,
              ),
              bottomTitles: SideTitles(
                reservedSize: 24.0,
                showTitles: true,
                getTitles: (val) {
                  if (val < 10) {
                    switch (val.toInt()) {
                      case 0:
                        return '';
                      case 1:
                        return '01';
                      case 2:
                        return '02';
                      case 3:
                        return '03';
                      case 4:
                        return '04';
                      case 5:
                        return '05';
                      case 6:
                        return '06';
                      case 7:
                        return '07';
                      case 8:
                        return '08';
                      case 9:
                        return '09';
                    }
                  }

                  if (val.toInt() == (allSpots.length - 1)) {
                    return '';
                  }

                  return val.toInt().toString();
                },
                textStyle: const TextStyle(
                  color: OverDropColors.subText,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
//            axisTitleData: FlAxisTitleData(
//              rightTitle: AxisTitle(showTitle: true, titleText: 'count'),
//              leftTitle: AxisTitle(showTitle: true, titleText: 'count'),
//              topTitle: AxisTitle(
//                  showTitle: true,
//                  titleText: 'Wall clock',
//                  textAlign: TextAlign.left),
//            ),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(
              show: false,
            ),
          ),
        ),
      ),
    );
  }
}

/// Lerps between a [LinearGradient] colors, based on [t]
Color lerpGradient(List<Color> colors, List<double> stops, double t) {
  if (stops == null || stops.length != colors.length) {
    stops = [];

    /// provided gradientColorStops is invalid and we calculate it here
    colors.asMap().forEach((index, color) {
      final percent = 1.0 / colors.length;
      stops.add(percent * (index + 1));
    });
  }

  for (var s = 0; s < stops.length - 1; s++) {
    final leftStop = stops[s], rightStop = stops[s + 1];
    final leftColor = colors[s], rightColor = colors[s + 1];
    if (t <= leftStop) {
      return leftColor;
    } else if (t < rightStop) {
      final sectionT = (t - leftStop) / (rightStop - leftStop);
      return Color.lerp(leftColor, rightColor, sectionT);
    }
  }
  return colors.last;
}

//class __LineChartState extends State<_LineChart> {
//  List<Color> gradientColors = [
//    const Color(0xff23b6e6),
//    const Color(0xff02d39a),
//  ];
//
//
//  final List<FlSpot> allSpots = [
//    FlSpot(0, 1),
//    FlSpot(1, 2),
//    FlSpot(2, 1.5),
//    FlSpot(3, 3),
//    FlSpot(4, 3.5),
//    FlSpot(5, 5),
//    FlSpot(6, 8),
//  ];
//
//
//
//  bool showAvg = false;
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      width: double.infinity,
//      decoration: const BoxDecoration(
//        borderRadius: BorderRadius.all(
//          Radius.circular(18),
//        ),
//      ),
//      child: SingleChildScrollView(
//        padding: EdgeInsets.zero,
//        scrollDirection: Axis.horizontal,
//        child: LineChart(
//          showAvg ? avgData() : mainData(),
//        ),
//      ),
//    );
////    return Stack(
////      children: <Widget>[
////        AspectRatio(
////          aspectRatio: 1.70,
////          child: Container(
////            decoration: const BoxDecoration(
////                borderRadius: BorderRadius.all(
////                  Radius.circular(18),
////                ),
////                color: OverDropColors.background),
////            child: SingleChildScrollView(
////              scrollDirection: Axis.horizontal,
////              child: LineChart(
////                showAvg ? avgData() : mainData(),
////              ),
////            ),
////          ),
////        ),
////        SizedBox(
////          width: 60,
////          height: 34,
////          child: FlatButton(
////            onPressed: () {
////              setState(() {
////                showAvg = !showAvg;
////              });
////            },
////            child: Text(
////              'avg',
////              style: TextStyle(
////                  fontSize: 12, color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
////            ),
////          ),
////        ),
////      ],
////    );
//  }
//
//  LineChartData mainData() {
//    return LineChartData(
//
//      gridData: FlGridData(
//        show: true,
//        drawVerticalLine: true,
//        drawHorizontalLine: false,
//        getDrawingHorizontalLine: (value) {
//          return FlLine(
//            color: const Color(0xff37434d),
//            strokeWidth: 1,
//          );
//        },
//        getDrawingVerticalLine: (value) {
//          return FlLine(
//            color: OverDropColors.darkBlue,
//            strokeWidth: 1,
//          );
//        },
//      ),
//
//      titlesData: FlTitlesData(
//        show: true,
//
//        bottomTitles: SideTitles(
//          showTitles: true,
//          reservedSize: 50,
//          textStyle: const TextStyle(
//              color: Color(0xff68737d),
//              fontWeight: FontWeight.bold,
//              fontSize: 16),
//          getTitles: (value) {
//            switch (value.toInt()) {
//              case 1:
//                return '13';
//              case 2:
//                return '14';
//              case 3:
//                return '15';
//              case 4:
//                return '16';
//              case 5:
//                return '17';
//              case 6:
//                return '18';
//              case 7:
//                return '19';
//            }
//            return '';
//          },
//          margin: 8,
//        ),
//
//        leftTitles: SideTitles(
//          showTitles: false,
//          textStyle: const TextStyle(
//            color: Color(0xff67727d),
//            fontWeight: FontWeight.bold,
//            fontSize: 15,
//          ),
//          getTitles: (value) {
//            switch (value.toInt()) {
//              case 1:
//                return '11';
//              case 3:
//                return '30k';
//              case 5:
//                return '50k';
//            }
//            return '';
//          },
//          reservedSize: 28,
//          margin: 12,
//        ),
//      ),
//      borderData: FlBorderData(
//          show: false,
//          border: Border.all(color: const Color(0xff37434d), width: 1, style: BorderStyle.none)),
//      minX: 1,
//      maxX: 7,
//      minY: 30,
//      maxY: 40,
//      lineBarsData: [
//        LineChartBarData(
//          spots: [
//            FlSpot(1, 35),
//            FlSpot(2, 36),
//            FlSpot(3, 36),
//            FlSpot(4, 36),
//            FlSpot(5, 35),
//            FlSpot(6, 35),
//            FlSpot(7, 34),
//          ],
//          isCurved: true,
//          colors: [OverDropColors.blue],
//          barWidth: 3,
//          isStrokeCapRound: true,
//          aboveBarData: BarAreaData(
//            show: true,
//            colors: [OverDropColors.background]
//          ),
//          dotData: FlDotData(
//            show: false,
//
//          ),
//          belowBarData: BarAreaData(
//            show: true,
//            colors:
//                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
//          ),
//        ),
//      ],
//    );
//  }
//
//  LineChartData avgData() {
//    return LineChartData(
//      lineTouchData: LineTouchData(enabled: false),
//      gridData: FlGridData(
//        show: true,
//        drawHorizontalLine: true,
//        getDrawingVerticalLine: (value) {
//          return FlLine(
//            color: const Color(0xff37434d),
//            strokeWidth: 1,
//          );
//        },
//        getDrawingHorizontalLine: (value) {
//          return FlLine(
//            color: const Color(0xff37434d),
//            strokeWidth: 1,
//          );
//        },
//      ),
//      titlesData: FlTitlesData(
//        show: true,
//        bottomTitles: SideTitles(
//          showTitles: true,
//          reservedSize: 22,
//          textStyle: const TextStyle(
//              color: Color(0xff68737d),
//              fontWeight: FontWeight.bold,
//              fontSize: 16),
//          getTitles: (value) {
//            switch (value.toInt()) {
//              case 2:
//                return 'MAR';
//              case 5:
//                return 'JUN';
//              case 8:
//                return 'SEP';
//            }
//            return '';
//          },
//          margin: 8,
//        ),
//        leftTitles: SideTitles(
//          showTitles: true,
//          textStyle: const TextStyle(
//            color: Color(0xff67727d),
//            fontWeight: FontWeight.bold,
//            fontSize: 15,
//          ),
//          getTitles: (value) {
//            switch (value.toInt()) {
//              case 1:
//                return '10k';
//              case 3:
//                return '30k';
//              case 5:
//                return '50k';
//            }
//            return '';
//          },
//          reservedSize: 28,
//          margin: 12,
//        ),
//      ),
//      borderData: FlBorderData(
//          show: true,
//          border: Border.all(color: const Color(0xff37434d), width: 1)),
//      minX: 0,
//      maxX: 11,
//      minY: 0,
//      maxY: 6,
//      lineBarsData: [
//        LineChartBarData(
//          spots: [
//            FlSpot(0, 3.44),
//            FlSpot(2.6, 3.44),
//            FlSpot(4.9, 3.44),
//            FlSpot(6.8, 3.44),
//            FlSpot(8, 3.44),
//            FlSpot(9.5, 3.44),
//            FlSpot(11, 3.44),
//          ],
//          isCurved: true,
//          colors: [
//            ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                .lerp(0.2),
//            ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                .lerp(0.2),
//          ],
//          barWidth: 5,
//          isStrokeCapRound: true,
//          dotData: FlDotData(
//            show: false,
//          ),
//          belowBarData: BarAreaData(show: true, colors: [
//            ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                .lerp(0.2)
//                .withOpacity(0.1),
//            ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                .lerp(0.2)
//                .withOpacity(0.1),
//          ]),
//        ),
//      ],
//    );
//  }
//}
