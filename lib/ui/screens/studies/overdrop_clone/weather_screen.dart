import 'package:axxilla_demo/ui/screens/studies/overdrop_clone/widgets/hourly_weather_section.dart';
import 'package:flutter/material.dart';

import 'overdrop_colors.dart';
import 'widgets/detail_section.dart';

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
//        textTheme: GoogleFonts.montserratTextTheme(),
        primaryColor: Colors.grey[800],
        accentColor: Colors.grey[200],
      ),
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: CustomScrollView(
            shrinkWrap: false,
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 280,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.none,
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        color: Colors.deepOrange,
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
