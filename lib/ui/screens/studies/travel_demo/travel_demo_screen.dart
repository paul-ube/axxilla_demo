import 'dart:math' as math;

import 'package:axxilla_demo/core/constants/app_colors.dart';
import 'package:axxilla_demo/core/constants/constants.dart';
import 'package:axxilla_demo/ui/screens/studies/travel_demo/theme.dart';
import 'package:axxilla_demo/ui/screens/studies/travel_demo/travel_demo_articles.dart';
import 'package:axxilla_demo/ui/widgets/animations/open_container_animation/open_container_wrapper.dart';
import 'package:axxilla_demo/ui/widgets/calendar/calendar_widget.dart';
import 'package:axxilla_demo/ui/widgets/components/category_title.dart';
import 'package:axxilla_demo/ui/widgets/default_annotated_region.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'file:///C:/Users/Paul/AndroidStudioProjects/axxilla_demo/lib/ui/screens/studies/travel_demo/discover_things.dart';

class TravelDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: craneTheme.copyWith(
        appBarTheme:
            const AppBarTheme(brightness: Brightness.dark, elevation: 0),
      ),
      home: TravelDemoScreen(),
    );
  }
}

class TravelDemoScreen extends StatelessWidget {
  static List<_CategoryDescription> _category = <_CategoryDescription>[
    _CategoryDescription('Eat', kLoremIpsum),
    _CategoryDescription('Stay', kLoremIpsum),
    _CategoryDescription('Entertain', kLoremIpsum),
    _CategoryDescription('Play',
        'Discover unique things to do around you. Once in a lifetime adventure starts here.'),
  ];

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    double _maxWidth = MediaQuery.of(context).size.width;
    if (orientation == Orientation.landscape) {
      _maxWidth = 600;
    }

    return DefaultAnnotatedRegion(
      child: Container(
        color: primaryBlue,
        child: SafeArea(
          child: Scaffold(
            primary: true,
            appBar: AppBar(
              title: Text('Travel Demo'),
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: _maxWidth,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      const SizedBox(height: 32),
                      _browseByCategories(context),
                      const SizedBox(height: 32),
                      CalendarWidget(),
                      const SizedBox(height: 32),
                      DiscoverThings(),
                      const SizedBox(height: 32),
                      _Articles(),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _browseByCategories(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CategoryTitle(title: 'Browse by category'),
        const SizedBox(height: 8),
        Container(
          height: 220,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: _category.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        offset: const Offset(1.7, 1.7),
                        blurRadius: 6,
                        spreadRadius: -0.5,
                      ),
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.grey.withOpacity(.1),
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(index == 0 ? 16 : 12, 8,
                      index == _category.length - 1 ? 16 : 4, 16),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      color: Colors.white,
                    ),
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        onTap: () {},
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(kBorderRadius),
                                child: Image.asset(
                                  'assets/portrait-${index + 1}.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned.fill(
                                child: Container(
                              decoration: kOverlayDecoration,
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          _category[index].name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 22,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 12, 8, 16),
                                        child: Text(
                                          _category[index].desc,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption
                                              .apply(color: Colors.white70),
                                          maxLines: 3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class _Articles extends StatelessWidget {
  int randomNumber = math.Random().nextInt(8);

  @override
  Widget build(BuildContext context) {
    if (randomNumber == 0) randomNumber = 1;
    double _deviceWidth = MediaQuery.of(context).size.width;

    if (_deviceWidth > 600) {
      _deviceWidth = 600;
    }

    if (_deviceWidth < 400) {
      _deviceWidth = 400;
    }

    String imageAsset = 'assets/landscape-$randomNumber.png';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryTitle(
          title: 'Articles',
        ),
        const SizedBox(height: 8),
        OpenContainerWrapper(
            destination: TravelDemoArticles(
              title: 'The big brown fox jumped over the lazy dog',
              imageAsset: imageAsset,
            ),
            closedColor: Colors.white,
            closedBuilder: (BuildContext _, VoidCallback openContainer) {
              return _Article(
                context: context,
                deviceWidth: _deviceWidth,
                openContainer: openContainer,
                imageAsset: imageAsset,
              );
            }),
      ],
    );
  }

  Widget _Article(
      {BuildContext context,
      double deviceWidth,
      VoidCallback openContainer,
      String imageAsset}) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kBorderRadius),
          child: AspectRatio(
            aspectRatio: 16 / 10,
            child: Container(
              decoration: kCardDecoration.copyWith(
                color: Colors.white,
                borderRadius: BorderRadius.circular(kBorderRadius),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    child: Image.asset(imageAsset, fit: BoxFit.cover),
                  ),
                  Positioned.fill(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0, 0.4, 0.95],
                          colors: [
                            Colors.black54,
                            Colors.transparent,
                            Colors.black54,
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'SAMPLE ARTICLE',
                                style:
                                    Theme.of(context).textTheme.overline.apply(
                                          color: Colors.white,
                                        ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              ConstrainedBox(
                                constraints:
                                    BoxConstraints(maxWidth: deviceWidth / 2),
                                child: Text(
                                  'The big brown fox jumped over the lazy dog',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .apply(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'The big brown fox jumped over the lazy dog',
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      color: Colors.white,
                                      letterSpacing: 0.2,
                                      fontSize: 16,
                                    ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      onTap: openContainer,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _CategoryDescription {
  final String name;
  final String desc;

  _CategoryDescription(this.name, this.desc);
}
