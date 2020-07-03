import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

import '../overdrop_colors.dart';
import 'header.dart';

class ThisWeekSection extends StatelessWidget {
  final List<DateTime> _7DaysAhead =
      List.generate(7, (index) => DateTime.now().add(Duration(days: index+1)));

  final List<_HeaderItemData> _headerData = [
    _HeaderItemData('4%', '38° | 32°'),
    _HeaderItemData('3%', '38° | 32°'),
    _HeaderItemData('3%', '38° | 32°'),
    _HeaderItemData('2%', '39° | 32°'),
    _HeaderItemData('1%', '38° | 31°'),
    _HeaderItemData('2%', '37° | 31°'),
    _HeaderItemData('3%', '40° | 35°'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: Header(title: 'This Week', subtitle: '7-day forecast'),
        ),
        const SizedBox(height: 24),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: _7DaysAhead.length,
          itemBuilder: (BuildContext context, int index) {
            String dayNumber;

            int dayInt = _7DaysAhead[index].day;

            if (_7DaysAhead[index].day < 10) {
              dayNumber = '0$dayInt';
            } else {
              dayNumber = dayInt.toString();
            }

            return _ExpandableDayPanel(
              date:
                  '${DateFormat.EEEE().format(_7DaysAhead[index])} $dayNumber',
              headerItemData: _headerData[index],
            );
          },
        )
      ],
    );
  }
}

class _ExpandableDayPanel extends StatefulWidget {
  final String date;
  final _HeaderItemData headerItemData;

  const _ExpandableDayPanel({Key key, this.date, this.headerItemData})
      : super(key: key);

  @override
  _ExpandableDayPanelState createState() => _ExpandableDayPanelState();
}

class _ExpandableDayPanelState extends State<_ExpandableDayPanel> {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: ScrollOnExpand(
      scrollOnExpand: true,
      scrollOnCollapse: true,
      child: ExpandablePanel(
        theme: const ExpandableThemeData(
          headerAlignment: ExpandablePanelHeaderAlignment.top,
          tapBodyToCollapse: true,
          iconColor: OverDropColors.active,
          tapHeaderToExpand: true,
          tapBodyToExpand: true,
          iconPadding: EdgeInsets.fromLTRB(8, 8, 22, 8),
        ),
        header: _HeaderItem(
          date: widget.date,
          lohiTemp: widget.headerItemData.temp,
          rainChance: widget.headerItemData.chance,
        ),
        expanded: _ExpandedItems(),
        builder: (_, collapsed, expanded) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 28.0),
            child: Expandable(
              collapsed: collapsed,
              expanded: expanded,
              theme: const ExpandableThemeData(crossFadePoint: 0.5),
            ),
          );
        },
      ),
    ));
  }
}

class _HeaderItem extends StatelessWidget {
  final IconData mainIcon;
  final String lohiTemp;
  final String rainChance;
  final String date;

  const _HeaderItem(
      {Key key,
      this.mainIcon = WeatherIcons.day_sunny,
      this.lohiTemp,
      this.rainChance,
      this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 18, 8),
            child: Transform.translate(
              offset: Offset(0, -4),
              child: Icon(
                mainIcon,
                color: OverDropColors.subText,
                size: 32,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Text(
                  date,
                  style: TextStyle(
                      color: OverDropColors.headerText,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      letterSpacing: 0.2),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _HeaderRowDetail(
                    detail: rainChance,
                    yIconOffset: -3,
                  ),
                  _HeaderRowDetail(
                    icon: WeatherIcons.thermometer,
                    detail: lohiTemp,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _HeaderRowDetail extends StatelessWidget {
  final String detail;
  final IconData icon;
  final double yIconOffset;

  const _HeaderRowDetail(
      {Key key,
      this.detail,
      this.icon = WeatherIcons.rain,
      this.yIconOffset = -1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
            child: Transform.translate(
              offset: Offset(0, yIconOffset),
              child: Icon(
                icon,
                color: OverDropColors.blue,
                size: 14,
              ),
            ),
          ),
          Text(
            detail,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  fontSize: 17,
                  color: OverDropColors.subText,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w400,
                ),
          )
        ],
      ),
    );
  }
}

class _ExpandedItems extends StatelessWidget {
  final List<_ExpandedDetailItemData> _data = [
    _ExpandedDetailItemData('12', 'UV Index', WeatherIcons.day_sunny_overcast),
    _ExpandedDetailItemData('16%', 'Cloud cover', WeatherIcons.cloud_up),
    _ExpandedDetailItemData('8 km/h', 'Wind speed', WeatherIcons.windy),
    _ExpandedDetailItemData('15 km/h', 'Wind gust', WeatherIcons.cloudy_gusts),
    _ExpandedDetailItemData('05:31', 'Sunrise', WeatherIcons.sunrise),
    _ExpandedDetailItemData('19:10', 'Sunset', WeatherIcons.sunset),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      ///32 + 24 + 18 padding from the left
      padding: const EdgeInsets.fromLTRB(74, 0, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 22, top: 18),
            child: Text(
              'Humid throughout the day',
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontSize: 17,
                    color: OverDropColors.subText,
                    letterSpacing: 0.1,
                  ),
            ),
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2.7,
            ),
            itemCount: _data.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              _ExpandedDetailItemData _itemData = _data[index];
              return _ExpandedItemDetail(
                title: _itemData.title,
                subtitle: _itemData.subtitle,
                iconData: _itemData.iconData,
              );
            },
          )
        ],
      ),
    );
  }
}

class _ExpandedItemDetail extends StatelessWidget {
  final IconData iconData;
  final String title, subtitle;

  const _ExpandedItemDetail({Key key, this.iconData, this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: OverDropColors.cardColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Transform.translate(
            offset: Offset(0, -5),
            child: Icon(
              iconData,
              color: OverDropColors.subText,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: OverDropColors.headerText,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: OverDropColors.subText,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.3,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _ExpandedDetailItemData {
  final String title, subtitle;
  final IconData iconData;

  _ExpandedDetailItemData(this.title, this.subtitle, this.iconData);
}

class _HeaderItemData {
  final String chance;
  final String temp;

  _HeaderItemData(this.chance, this.temp);
}
