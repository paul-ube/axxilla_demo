import 'package:axxilla_demo/core/constants/app_colors.dart';
import 'package:axxilla_demo/ui/screens/studies/google_discover_clone/discover_clone_screen.dart';
import 'package:axxilla_demo/ui/screens/studies/travel_demo/travel_demo_screen.dart';
import 'package:axxilla_demo/ui/widgets/cards/studies_card.dart';
import 'package:axxilla_demo/ui/widgets/default_annotated_region.dart';
import 'package:flutter/material.dart';

import 'studies/overdrop_clone/weather_screen.dart';

class StudiesScreen extends StatefulWidget {
  @override
  _StudiesScreenState createState() => _StudiesScreenState();
}

class _StudiesScreenState extends State<StudiesScreen> {
  @override
  void initState() {
    Future.microtask(() => TravelDemoScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Studies'),
        backgroundColor: Colors.blue[800],
      ),
      body: SafeArea(
//        top: false,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
//          OpenContainerWrapper(
//              destination: TravelDemoScreen(),
//              closedColor: Colors.white,
//              closedBuilder: (BuildContext _, VoidCallback openContainer) {
//                return InkWellOverlay(
//                  openContainer: openContainer,
//                  height: 300,
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.stretch,
//                    children: <Widget>[
//                      Expanded(
//                        child: Container(
//                          color: Colors.black38,
//                          child: Center(
//                            child: Image.asset(
//                              'assets/portrait-9.png',
//                              width: 100,
//                            ),
//                          ),
//                        ),
//                      ),
//                      const ListTile(
//                        title: Text('Title'),
//                        subtitle: Text('Secondary text'),
//                      ),
//                      Padding(
//                        padding: const EdgeInsets.only(
//                          left: 16.0,
//                          right: 16.0,
//                          bottom: 16.0,
//                        ),
//                        child: Text(
//                          'Lorem ipsum dolor sit amet, consectetur '
//                          'adipiscing elit, sed do eiusmod tempor.',
//                          style: Theme.of(context)
//                              .textTheme
//                              .bodyText2
//                              .copyWith(color: Colors.black54),
//                        ),
//                      ),
//                    ],
//                  ),
//                );
//              }),
            StudiesCard(
              destination: TravelDemoApp(),
              title: 'Travel App UI',
              subtitle: 'A travel app ui inspired by figma',
              color: primaryBlue,
              assetImage: 'assets/landscape-4.png',
            ),
            StudiesCard(
              destination: GoogleDiscoverClone(),
              title: 'Google Discover and News Clone',
              subtitle:
                  'Cloning of cards present in Google Discover and News App',
              color: Colors.white,
              textColor: Colors.grey.shade900,
              assetImage: 'assets/landscape-5.png',
            ),
            StudiesCard(
              destination: WeatherScreen(),
              title: 'Overdrop Clone',
              subtitle: 'A weather forecasting application',
              color: Colors.grey[800],
              textColor: Colors.white,
              assetImage: 'assets/landscape-2.png',
            )
          ],
        ),
      ),
    );
  }
}
