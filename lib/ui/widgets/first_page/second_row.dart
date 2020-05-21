import 'dart:math';

import 'package:axxilla_demo/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:line_icons/line_icons.dart';

class SecondRow extends StatelessWidget {
  final String title;

  const SecondRow({Key key, this.title}) : super(key: key);

  static List<Widget> _cards = <Widget>[
    const _FirstCard(),
    const _TallCard(),
    const _SecondCard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title, style: Theme.of(context).textTheme.headline5)
            ],
          ),
        ),
        Container(
          height: 350,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _cards.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: kCardDecoration.copyWith(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  color: Colors.white,
                ),
                margin: EdgeInsets.fromLTRB(index == 0 ? 16 : 12, 8,
                    index == _cards.length - 1 ? 16 : 4, 16),
                child: _cards[index],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _FirstCard extends StatelessWidget {
  const _FirstCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kBorderRadius),
                      topRight: Radius.circular(kBorderRadius),
                    ),
                    child: Image.asset(
                      kAllImagesString[
                          Random().nextInt(kAllImagesString.length)],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lorem Ipsum',
                          maxLines: 1,
                          style: _textTheme.headline6,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          kLoremIpsum,
                          maxLines: 3,
                          style: _textTheme.bodyText2.copyWith(height: 1.4),
                        ),
                      ]),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: Text('ACTION 1'),
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: Text('ACTION 2'),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _SecondCard extends StatelessWidget {
  const _SecondCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kBorderRadius),
                      topRight: Radius.circular(kBorderRadius),
                    ),
                    child: Image.asset(
                      kAllImagesString[
                          Random().nextInt(kAllImagesString.length)],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lorem Ipsum',
                          maxLines: 1,
                          style: _textTheme.headline6,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          kLoremIpsum,
                          maxLines: 3,
                          style: _textTheme.bodyText2.copyWith(height: 1.4),
                        ),
                      ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _TallCard extends StatelessWidget {
  const _TallCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kBorderRadius),
                      topRight: Radius.circular(kBorderRadius),
                    ),
                    child: Image.asset(
                      kPortraitImagesString[
                          Random().nextInt(kPortraitImagesString.length)],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: kOverlayDecoration.copyWith(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kBorderRadius),
                        topRight: Radius.circular(kBorderRadius),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        LineIcons.heart_o,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          '${Random().nextInt(100)}',
                          style:
                              _textTheme.subtitle1.apply(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lorem Ipsum',
                          maxLines: 1,
                          style: _textTheme.subtitle1,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          kLoremIpsum,
                          maxLines: 3,
                          style: _textTheme.caption.copyWith(height: 1.3),
                        ),
                      ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
