import 'dart:math';

import 'package:axxilla_demo/core/constants/constants.dart';
import 'package:axxilla_demo/core/functions/get_text_size.dart';
import 'package:axxilla_demo/ui/widgets/components/square_image.dart';
import 'package:axxilla_demo/ui/widgets/logo_and_name_caption.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:weather_icons/weather_icons.dart';

BoxDecoration get _boxDecoration => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade900.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 0.4,
            offset: Offset(1.7, 1.7),
          ),
//          BoxShadow(
//            color: Colors.grey.shade100,
//            blurRadius: 4,
//            offset: Offset(0.7, 1.7),
//          ),
        ]);

EdgeInsets get _margin => const EdgeInsets.fromLTRB(18, 6, 18, 12);

class GoogleDiscoverClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _AnnotatedRegion(
      child: MaterialApp(
        title: 'Google Discover Clone',
        debugShowCheckedModeBanner: false,
        theme: Theme.of(context),
        home: DiscoverClone(),
      ),
    );
  }
}

class _AnnotatedRegion extends StatelessWidget {
  final Widget child;

  const _AnnotatedRegion({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white70,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white70,
        systemNavigationBarDividerColor: null,
      ),
      child: child,
    );
  }
}

class DiscoverClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        addAutomaticKeepAlives: true,
        children: <Widget>[
          const SizedBox(height: 54),
          _CustomAppBar(),
          const SizedBox(height: 16),
          _WeatherCard(),
          _SmallCard(
            title: 'This is a wide card inspired by Google Feed',
            content: kLoremIpsum,
            orgName: 'Google',
            relativeDate: '20 hours ago',
          ),
          _BigCard(
            content: kLoremIpsum,
            title: 'This is a big card inspired by Google Discover',
            iconData: MdiIcons.google,
            orgName: 'Google',
            relativeDate: '1 month ago',
          ),
          _BigCard(
            content: kLoremIpsum,
            title: 'This is a big card inspired by Google Discover',
            iconData: MdiIcons.google,
            orgName: 'Google',
            relativeDate: '1 month ago',
            inCaseYouMissedIt: true,
          ),
          _SmallCard(
            title:
                'iLTW Apologises To Xcalibur For His Remarks in The Pub Game',
            content: 'Virtus Pro carry iLTW made a public apology on his social'
                ' media page for his toxic behaviour in the pub '
                'game yesterday against Xcalibur',
            iconData: Icons.translate,
            relativeDate: '4 hours ago',
            orgName: 'AFK Gaming',
            inCaseYouMissedIt: true,
          ),
          _MultiRowCard(),
          _BigCard(
            content: kLoremIpsum,
            title: 'This is a big card inspired by Google Discover',
            iconData: MdiIcons.google,
            orgName: 'Google',
            relativeDate: '1 month ago',
          ),
          _DailyLifeDuringCOVID(),
          _BigCard(
            content: kLoremIpsum,
            title: 'This is a big card inspired by Google Discover',
            iconData: MdiIcons.google,
            orgName: 'Google',
            relativeDate: '1 month ago',
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List<Widget>.generate(
              4,
              (index) => _SmallCard(
                title: 'This is a wide card inspired by Google Feed',
                content: kLoremIpsum,
                orgName: 'Google',
                relativeDate: '20 hours ago',
              ),
            ),
          ),
          _MoreStories(),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;

    String googleText = 'google_logo';
    TextStyle googleStyle =
        _textTheme.headline4.copyWith(fontFamily: 'ProductSansBold');

    Size _textSize = getTextSize(googleText, googleStyle);

    return Container(
      margin: const EdgeInsets.fromLTRB(18, 4, 18, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                MdiIcons.inboxOutline,
                color: Colors.black54,
              ),
              Text(
                'Updates',
                style: _textTheme.caption.copyWith(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.1),
              )
            ],
          ),
          Text(
            'google_logo',
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(fontFamily: 'ProductSansBold'),
          ),
//          GoogleText(text: 'google_logo'),
//          ShaderMask(
//            shaderCallback: (bounds) => gradient.createShader(
//              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
//            ),
//            child: Text(
//              'google_logo',
//              style: googleStyle.copyWith(
//                foreground: Paint()
//                  ..shader = LinearGradient(
//                    stops: [0.2, 0.36, 0.42, 0.44, 0.98, 1.0],
//                    colors: <Color>[
//                      Color.fromRGBO(66, 133, 244, 1),
//                      Color.fromRGBO(219, 68, 55, 1),
//                      Color.fromRGBO(244, 160, 0, 1),
//                      Color.fromRGBO(66, 133, 244, 1),
//                      Color.fromRGBO(15, 157, 88, 1),
//                      Color.fromRGBO(219, 68, 55, 1),
//                    ],
//                  ).createShader(
//                    Rect.fromLTWH(0.0, 0.0, _textSize.width, _textSize.height),
//                  ),
//              ),
//            ),
//          ),
          CircleAvatar(
            radius: 16,
            child: Text('google_G', style: _textTheme.subtitle1),
            backgroundColor: Colors.black12,
          )
        ],
      ),
    );
  }
}

class _WeatherCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: _boxDecoration,
      padding: const EdgeInsets.all(16),
      margin: _margin,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.translate(
            offset: Offset(0, -7),
            child: Icon(
              WeatherIcons.day_haze,
              color: Colors.blueGrey.shade200,
              size: 36,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  '36°C in Fujairah',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 12),
                ),
                Text(
                  'Haze',
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 12,
                        color: Colors.grey[900].withOpacity(0.4),
                        letterSpacing: -0.2,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  '37° / 29°',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 12),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      MdiIcons.umbrella,
                      size: 14,
                      color: Colors.black.withOpacity(0.35),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      '0% today',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            fontSize: 12,
                            color: Colors.grey[900].withOpacity(0.4),
                            letterSpacing: -0.2,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _SmallCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData iconData;
  final String orgName;
  final String relativeDate;
  final bool inCaseYouMissedIt;

  const _SmallCard({
    Key key,
    this.title,
    this.content,
    this.iconData = MdiIcons.googlePlay,
    this.orgName,
    this.relativeDate,
    this.inCaseYouMissedIt = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: _boxDecoration,
      margin: _margin,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _Content(
                                title: title,
                                content: content,
                                inCaseYouMissedIt: inCaseYouMissedIt),
                          ],
                        ),
                      ),
                    ),
                    SquareImage(
                      height: 90,
                      padding: const EdgeInsets.only(left: 16),
                    ),
                  ],
                ),
              ),
              _BottomRow(
                iconData: iconData,
                name: orgName,
                relativeDate: relativeDate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BigCard extends StatelessWidget {
  final String relativeDate, orgName;
  final String title, content;
  final IconData iconData;
  final bool inCaseYouMissedIt;
  final int integer;

  _BigCard({
    Key key,
    this.relativeDate,
    this.orgName,
    this.title,
    this.content = kLoremIpsum,
    this.iconData,
    this.inCaseYouMissedIt = false,
  })  : integer = Random().nextInt(6),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration,
      margin: _margin,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kBorderRadius),
                  topRight: Radius.circular(kBorderRadius),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    'assets/landscape-${integer + 1}.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: _Content(
                  title: title,
                  content: content,
                  inCaseYouMissedIt: inCaseYouMissedIt,
                ),
              ),
              _BottomRow(
                iconData: iconData,
                name: orgName,
                relativeDate: relativeDate,
              ),
            ],
          ),
          Positioned.fill(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {},
                splashColor: Colors.black.withOpacity(0.16),
                borderRadius: BorderRadius.circular(kBorderRadius),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final String title;
  final String content;
  final bool inCaseYouMissedIt;

  const _Content({
    Key key,
    this.title,
    this.content,
    this.inCaseYouMissedIt = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        !inCaseYouMissedIt
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  'In case you missed it',
                  style: _textTheme.caption.copyWith(
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
                  ),
                ),
              ),
        Text(
          title,
          maxLines: 4,
          textWidthBasis: TextWidthBasis.longestLine,
          style: _textTheme.headline6.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 17,
              height: 1.4,
              shadows: [
                Shadow(color: Colors.black12, blurRadius: 1),
              ]),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 6),
        Text(
          content,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: _textTheme.bodyText2.copyWith(
              height: 1.4,
              color: Colors.black.withOpacity(0.5),
              letterSpacing: -0.05,
              fontSize: 14),
        ),
      ],
    );
  }
}

class _BottomRow extends StatelessWidget {
  final IconData iconData;
  final String relativeDate;
  final String name;

  const _BottomRow({Key key, this.iconData, this.relativeDate, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: LogoAndName(
            name: name,
            relativeDate: relativeDate,
            icon: iconData,
          ),
        ),
        Spacer(),
        Row(
          children: <Widget>[
            IconButton(
              visualDensity: VisualDensity.comfortable,
              icon: Icon(OMIcons.share),
              iconSize: 18,
              color: Colors.black54,
              onPressed: () {},
            ),
            IconButton(
              visualDensity: VisualDensity.comfortable,
              icon: Icon(Icons.filter_list),
              iconSize: 18,
              color: Colors.black54,
              onPressed: () {},
            ),
            IconButton(
              visualDensity: VisualDensity.comfortable,
              icon: Icon(Icons.more_vert),
              iconSize: 18,
              color: Colors.black54,
              onPressed: () {
                print('i am pressed');
              },
            ),
          ],
        ),
      ],
    );
  }
}

List<String> _times = <String>['hours', 'months', 'minutes'];

class MultiRowCardDetail {
  final String title;
  final String logoName;
  final IconData iconData;
  final int randomTime;
  final String randomRelativeTime;

  MultiRowCardDetail({
    this.title,
    this.logoName,
    this.iconData,
    this.randomTime,
    this.randomRelativeTime,
  });
}

class _MultiRowCard extends StatelessWidget {
  final List<MultiRowCardDetail> _details = [
    MultiRowCardDetail(
      title: 'A multi-row card inspired by Google News',
      iconData: MdiIcons.googleNearby,
      logoName: 'Google News',
      randomTime: Random().nextInt(24),
      randomRelativeTime: _times[Random().nextInt(_times.length)],
    ),
    MultiRowCardDetail(
      title:
          'Microsoft Surface Book 3 15-inch review: Better, faster, but don\'t call it \'ultimate\'',
      logoName: 'Test Logo Name',
      randomTime: Random().nextInt(24),
      randomRelativeTime: _times[Random().nextInt(_times.length)],
    ),
    MultiRowCardDetail(
      title:
          'DepEd postpones face-to-face classes until COVID-19 vaccine is available',
      logoName: 'Wrappler',
      iconData: MdiIcons.wrap,
      randomTime: Random().nextInt(24),
      randomRelativeTime: _times[Random().nextInt(_times.length)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _COVID19Header(_textTheme),
        Container(
          decoration: _boxDecoration,
          margin: _margin,
          child: Material(
            type: MaterialType.transparency,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: List<Widget>.generate(_details.length, (index) {
                    MultiRowCardDetail x = _details[index];
                    double _indent = 18;

                    if (index == (_details.length - 1)) _indent = 0;

                    return _article(
                      _textTheme,
                      title: x.title,
                      logoName: x.logoName,
                      iconData: x.iconData,
                      randomTime: x.randomTime,
                      randomRelativeTime: x.randomRelativeTime,
                      endIndent: _indent,
                      indent: _indent,
                    );
                  }),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: Text(
                      'More about COVID-19',
                      style: _textTheme.subtitle2
                          .apply(color: Colors.blue[700], fontSizeDelta: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Padding _COVID19Header(TextTheme _textTheme) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 0, 12),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'COVID-19 news',
                style: _textTheme.headline6.copyWith(
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                  shadows: [
                    Shadow(color: Colors.black12, blurRadius: 1),
                  ],
                ),
              ),
              Text(
                'Updated 21 mins ago',
                style: _textTheme.subtitle2.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          IconButton(
            visualDensity: VisualDensity.comfortable,
            icon: Icon(Icons.more_vert),
            iconSize: 18,
            color: Colors.black54,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _article(
    TextTheme _textTheme, {
    String title,
    String logoName = 'Test',
    double indent = 20,
    double endIndent = 20,
    IconData iconData = Icons.code,
    int randomTime,
    String randomRelativeTime,
  }) {
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Text(
                    title,
                    maxLines: 4,
                    textWidthBasis: TextWidthBasis.longestLine,
                    style: _textTheme.headline6.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        height: 1.4,
                        shadows: [
                          Shadow(color: Colors.black12, blurRadius: 1),
                        ]),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SquareImage(
                  height: 70,
                  padding: const EdgeInsets.only(left: 20),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: LogoAndName(
                  name: logoName,
                  icon: iconData,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Text(
                  '•',
                  style: _textTheme.caption.apply(
                    color: Colors.black45,
                  ),
                ),
              ),
              Text(
                '$randomTime '
                '$randomRelativeTime ago',
                style: _textTheme.caption.apply(
                  color: Colors.black54,
                ),
              ),
              Spacer(),
              IconButton(
                visualDensity: VisualDensity.comfortable,
                icon: Icon(Icons.more_vert),
                iconSize: 18,
                color: Colors.black45,
                onPressed: () {},
              ),
            ],
          ),
          Divider(
            height: 0,
            endIndent: endIndent,
            indent: indent,
          ),
        ],
      ),
    );
  }
}

class _DailyLifeDuringCOVID extends StatelessWidget {
  final double _sidePadding = 14;

  final List<String> _itemText = [
    'COVID-19 news',
    'Wellbeing',
    'Fitness',
    'Recipes',
    'Working from home',
    'Parenting',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: _sidePadding, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _title(context),
          Padding(
            padding: EdgeInsets.only(right: _sidePadding),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DailyLifeDuringCovidScreen(
                                title: _itemText[index],
                              )),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.fromLTRB(5, 0, 5, 10),
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          child: Image.asset(
                            'assets/landscape-${index + 1}.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: [0, 0.7],
                                colors: [
                                  Colors.black,
                                  Colors.transparent,
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12, 0, 16, 12),
                              child: Text(
                                _itemText[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Row _title(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.explore,
                size: 22,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  'Daily life during COVID-19',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          icon: Icon(Icons.more_vert),
          iconSize: 18,
          color: Colors.black54,
          onPressed: () {},
        ),
      ],
    );
  }
}

class _MoreStories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _margin,
      decoration: _boxDecoration,
      child: Material(
        type: MaterialType.transparency,
        borderRadius: BorderRadius.circular(kBorderRadius),
        child: InkWell(
          onTap: () {},
          splashColor: Colors.grey[50],
          borderRadius: BorderRadius.circular(kBorderRadius),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                IconButton(
                  visualDensity: VisualDensity.compact,
                  icon: Icon(Icons.arrow_forward),
                  iconSize: 24,
                  color: Colors.black38,
                ),
                const SizedBox(width: 8),
                Text('More stories',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .apply(color: Colors.black54)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DailyLifeDuringCovidScreen extends StatelessWidget {
  final String title;

  const DailyLifeDuringCovidScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _AnnotatedRegion(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            shrinkWrap: false,
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                brightness: Brightness.light,
                iconTheme: Theme.of(context).iconTheme.copyWith(
                      color: Colors.grey[900],
                    ),
                title: Text(
                  title,
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.grey[900],
                        fontSize: 16,
                      ),
                ),
                titleSpacing: 0.0,
                pinned: false,
                floating: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    if (index % 3 == 0) {
                      return _SmallCard(
                        title: 'The big brown fox jumped over the lazy dog',
                        relativeDate: '2 hours ago',
                        orgName: '$index Company',
                        iconData: Icons.code,
                        content: kLoremIpsum,
                      );
                    }

                    return _BigCard(
                      title: 'The big brown fox jumped over the lazy dog',
                      relativeDate: '2 hours ago',
                      orgName: '$index Company',
                      iconData: Icons.code,
                      content: kLoremIpsum,
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
