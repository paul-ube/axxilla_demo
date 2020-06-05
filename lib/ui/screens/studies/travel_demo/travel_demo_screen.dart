import 'dart:math';

import 'package:axxilla_demo/core/constants/app_colors.dart';
import 'package:axxilla_demo/core/constants/constants.dart';
import 'package:axxilla_demo/ui/widgets/calendar/calendar_widget.dart';
import 'package:axxilla_demo/ui/widgets/components/category_title.dart';
import 'package:axxilla_demo/ui/widgets/discover_things.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlue,
        title: Text('Travel Demo'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: _maxWidth,
              ),
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                padding: const EdgeInsets.only(top: kToolbarHeight),
                children: <Widget>[
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
  int randomNumber = Random().nextInt(8);

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CategoryTitle(
          title: 'Articles',
        ),
        const SizedBox(height: 8),
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 4),
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
                      child: Image.asset('assets/landscape-$randomNumber.png',
                          fit: BoxFit.cover),
                    ),
                    Positioned.fill(
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline
                                      .apply(
                                        color: Colors.white,
                                      ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxWidth: _deviceWidth / 2),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                    color: Colors.white,
                                    letterSpacing: 0.2,
                                    fontSize: 16,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}

class _CategoryDescription {
  final String name;
  final String desc;

  _CategoryDescription(this.name, this.desc);
}
