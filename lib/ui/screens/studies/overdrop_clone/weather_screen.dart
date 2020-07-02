import 'package:axxilla_demo/ui/screens/studies/overdrop_clone/widgets/hourly_weather_section.dart';
import 'package:axxilla_demo/ui/screens/studies/overdrop_clone/widgets/this_week_section.dart';
import 'package:axxilla_demo/ui/widgets/appbar/sliver_status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'overdrop_colors.dart';
import 'widgets/detail_section.dart';
import 'widgets/weather_radar_section.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: Colors.transparent,
    ));
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.renderView.automaticSystemUiAdjustment = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverStatusBar(
      child: Theme(
        data: Theme.of(context).copyWith(
//        textTheme: GoogleFonts.montserratTextTheme(),
          primaryColor: Colors.grey[800],
          accentColor: Colors.grey[200],
          brightness: Brightness.dark,
        ),
        child: Scaffold(
          backgroundColor: OverDropColors.darkBlue,
          body: CustomScrollView(
            shrinkWrap: false,
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 280,
//                title: SliverStatusBar(),
                brightness: Brightness.dark,
                elevation: 0,
                backgroundColor: OverDropColors.background,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/portrait-8.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24, 54, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    RichText(
                                      textAlign: TextAlign.start,
                                      text: TextSpan(
                                        text: '35',
                                        style: GoogleFonts.montserrat(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline2
                                              .copyWith(
                                                  color: OverDropColors.active,
                                                  fontWeight: FontWeight.w600,
                                                  height: 1,
                                                  shadows: [
                                                BoxShadow(
                                                  color: OverDropColors
                                                      .background
                                                      .withOpacity(0.5),
                                                )
                                              ]),
                                        ),
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: '°C',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(
                                          color: OverDropColors.active,
                                          fontWeight: FontWeight.w600,
                                          height: 1.5,
                                          shadows: [
                                            BoxShadow(
                                              color: OverDropColors.background
                                                  .withOpacity(0.5),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  'Fujairah • Humid and Partly Cloudy',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(
                                        color: OverDropColors.active,
                                        fontSize: 18,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
//                      Positioned(
//                        bottom: -15,
//                        left: 0,
//                        child: Container(
//                          height: 30,
//                          width: MediaQuery.of(context).size.width,
//                          decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(15),
//                            color: background,
//                          ),
//                        ),
//                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        color: OverDropColors.background,
                      ),
//                      padding: const EdgeInsets.fromLTRB(24, 15, 24, 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          DetailSection(),
                          HourlyWeatherSection(),
                          WeatherRadarSection(),
                          ThisWeekSection(),
                        ],
                      ),
                    );
                  },
                  childCount: 1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
