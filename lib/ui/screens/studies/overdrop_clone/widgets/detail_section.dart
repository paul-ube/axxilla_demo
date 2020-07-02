import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weather_icons/weather_icons.dart';

import '../overdrop_colors.dart';
import 'header.dart';

class DetailSection extends StatefulWidget {
  @override
  _DetailSectionState createState() => _DetailSectionState();
}

class _DetailSectionState extends State<DetailSection> {
  final ExpandableController _expandableController = ExpandableController();

  @override
  void dispose() {
    _expandableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ExpandableNotifier(
          child: ScrollOnExpand(
            scrollOnExpand: true,
            scrollOnCollapse: true,
            child: ExpandablePanel(
              controller: _expandableController,
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.top,
                tapBodyToCollapse: true,
                iconColor: OverDropColors.active,
                tapHeaderToExpand: true,
                tapBodyToExpand: true,
                iconSize: 24,
                iconPadding: const EdgeInsets.only(right: 16, top: 24),
              ),
              header: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Header(
                  title: 'Details',
                  subtitle: 'Weather now',
                ),
              ),
            ),
          ),
        ),
        ExpandableNotifier(
            child: ScrollOnExpand(
          scrollOnExpand: true,
          scrollOnCollapse: false,
          child: ExpandablePanel(
            controller: _expandableController,
            theme: const ExpandableThemeData(
              headerAlignment: ExpandablePanelHeaderAlignment.top,
              tapBodyToCollapse: true,
              iconColor: OverDropColors.active,
              tapHeaderToExpand: true,
              hasIcon: false,
              iconPadding: EdgeInsets.zero,
            ),
            header: _Header(),
            expanded: _ExpandedItems(),
            builder: (_, collapsed, expanded) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 38.0),
                child: Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                  theme: const ExpandableThemeData(crossFadePoint: 0.5),
                ),
              );
            },
          ),
        ))
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: _WeatherItem(
                title: '36° | 29°',
                subtitle: 'Temperature',
                iconData: WeatherIcons.thermometer,
              ),
            ),
            Expanded(
              child: _WeatherItem(
                title: '47°',
                subtitle: 'Feels like',
                iconData: WeatherIcons.thermometer_exterior,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: _WeatherItem(
                title: '5%',
                subtitle: 'Chance',
                iconData: WeatherIcons.rain,
              ),
            ),
            Expanded(
              child: _WeatherItem(
                title: '20 km/h',
                subtitle: 'Wind speed',
                iconData: WeatherIcons.windy,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ExpandedItems extends StatelessWidget {
  final List<_DetailItem> firstGrid = [
    _DetailItem(
      '6',
      'UV Index',
      WeatherIcons.day_sunny_overcast,
    ),
    _DetailItem(
      '1.00 bar',
      'Pressure',
      MdiIcons.fontAwesome,
    ),
    _DetailItem(
      '26°',
      'Dew point',
      WeatherIcons.alien,
    ),
    _DetailItem(
      '05:30',
      'Sunrise',
      WeatherIcons.sunrise,
    ),
  ];

  final List<_DetailItem> secondGrid = [
    _DetailItem(
      '43%',
      'Cloud cover',
      WeatherIcons.cloudy,
    ),
    _DetailItem(
      '56%',
      'Humidity',
      WeatherIcons.humidity,
    ),
    _DetailItem(
      '15 km',
      'Visibility',
      FeatherIcons.eye,
    ),
    _DetailItem(
      '19:10',
      'Sunset',
      WeatherIcons.sunset,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: firstGrid.length,
      itemBuilder: (BuildContext context, int index) {
        _DetailItem item1 = firstGrid[index];
        _DetailItem item2 = secondGrid[index];

        return Row(
          children: <Widget>[
            Expanded(
              child: _WeatherItem(
                title: item1.title,
                subtitle: item1.subtitle,
                iconData: item1.iconData,
              ),
            ),
            Expanded(
              child: _WeatherItem(
                title: item2.title,
                subtitle: item2.subtitle,
                iconData: item2.iconData,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _DetailItem {
  final String title, subtitle;
  final IconData iconData;

  _DetailItem(this.title, this.subtitle, this.iconData);
}

class _ItemRow extends StatelessWidget {
  final String title1, title2;
  final String subtitle1, subtitle2;
  final IconData iconData1, iconData2;

  const _ItemRow(
      {Key key,
      this.title1,
      this.title2,
      this.subtitle1,
      this.subtitle2,
      this.iconData1,
      this.iconData2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: _WeatherItem(
            title: '5%',
            subtitle: 'Chance',
            iconData: WeatherIcons.rain,
          ),
        ),
        Expanded(
          child: _WeatherItem(
            title: '20 km/h',
            subtitle: 'Wind speed',
            iconData: WeatherIcons.windy,
          ),
        ),
      ],
    );
  }
}

class _WeatherItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subtitle;

  const _WeatherItem(
      {Key key,
      @required this.iconData,
      @required this.title,
      @required this.subtitle})
      : assert(title != null),
        assert(subtitle != null),
        assert(iconData != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
            child: Transform.translate(
              offset: Offset(0, -4),
              child: Icon(
                iconData,
                color: OverDropColors.subText,
                size: 22,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                      fontSize: 20,
                      color: OverDropColors.headerText,
                      letterSpacing: 0.1,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontSize: 17,
                      color: OverDropColors.subText,
                      letterSpacing: 0.1,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
