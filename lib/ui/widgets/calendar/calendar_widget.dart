import 'package:axxilla_demo/core/constants/app_colors.dart';
import 'package:axxilla_demo/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({
    Key key,
  }) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  Map<DateTime, List> _events;
  AnimationController _animationController;
  CalendarController _calendarController;
  List _selectedEvents = List();
  DateTime _selectedDay;
  final _today = DateTime.now();
  var eventsList;

//  final Map<DateTime, List> _holidays = {
//    DateTime(2019, 11, 1): ['Test'],
//    DateTime(2019, 1, 6): ['Epiphany'],
//    DateTime(2019, 2, 14): ['Valentine\'s Day'],
//    DateTime(2019, 4, 21): ['Easter Sunday'],
//    DateTime(2019, 4, 22): ['Easter Monday'],
//  };

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _selectedEvents = events;
      _selectedDay = day;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
//    print('CALLBACK: _onVisibleDaysChanged');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Event Calendar',
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: primaryBlue,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0,
                    ),
              ),
            ],
          ),
        ),
        _buildTableCalendarWithBuilders(context),
        const SizedBox(height: 8.0),
      ],
    );
  }

  Widget _buildTableCalendarWithBuilders(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: kCardDecoration.copyWith(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kBorderRadius)),
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height / 2.5,
            minWidth: MediaQuery.of(context).size.height / 2,
          ),
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.only(bottom: 16),
          child: _buildCalendar(context),
        ),
      ],
    );
  }

  Widget _buildCalendar(BuildContext context) {
    TextStyle _bodyText2 = Theme.of(context).textTheme.bodyText2;
    TextStyle _action = Theme.of(context).textTheme.button;
    return TableCalendar(
      locale: 'en_as',
      calendarController: _calendarController,
      events: _events,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      weekendDays: [6],
      availableGestures: AvailableGestures.horizontalSwipe,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: _bodyText2.copyWith(
          color: Colors.blue[800],
          fontSize: 16.0,
          height: 1.3,
        ),
        holidayStyle: _bodyText2.copyWith(
          color: Colors.red[800],
          fontSize: 16.0,
          height: 1.3,
        ),
        weekdayStyle: _bodyText2.copyWith(
          fontSize: 16.0,
          height: 1.3,
        ),
        markersColor: Colors.red,
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: _action,
        weekendStyle: _action.copyWith(color: Colors.blue[800]),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
        titleTextStyle: Theme.of(context).textTheme.subtitle1,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.blue,
            ),
            width: 100,
            height: 100,
            child: Center(
              child: Text(
                '${date.day}',
                style: _bodyText2.copyWith(
                  fontSize: 16.0,
                  color: Colors.black87,
                  height: 1.3,
                ),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryBlue,
            ),
            width: 100,
            height: 100,
            child: Center(
              child: Text(
                '${date.day}',
                style: _bodyText2.copyWith(
                  fontSize: 16.0,
                  color: Colors.white,
                  height: 1.3,
                ),
              ),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                bottom: 1,
                child: Row(
                    children: List<Widget>.generate(events.length, (index) {
                  return index < 4
                      ? _buildMarker(date, events)
                      : SizedBox.shrink();
                })),
              ),
            );
          }

//          if (holidays.isNotEmpty) {
//            children.add(
//              Positioned(
//                right: 2,
//                top: 2,
//                child: _buildHolidaysMarker(),
//              ),
//            );
//          }

          return children;
        },
      ),
      onDaySelected: (date, events) {
        _onDaySelected(date, events);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }

  Widget _buildMarker(DateTime date, dynamic event) {
    return Container(
      width: 5.0,
      height: 5.0,
      margin: const EdgeInsets.symmetric(horizontal: 0.5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: primaryBlue,
      ),
    );
  }

  Widget _buildEventList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _selectedEvents.length == 0
            ? SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.fromLTRB(
                  22.0,
                  22.0,
                  22.0,
                  12.0,
                ),
                child: Text('asdfadf'),
              ),
        ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: _selectedEvents.map((event) {
            List<String> eventInfo = event.toString().split('&');

            return Container(
              decoration: kCardDecoration,
              margin:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 7.0),
              child: Stack(
                overflow: Overflow.clip,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      eventInfo[1],
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    subtitle: Text(
                      '${eventInfo[2]} • ${eventInfo[3]}',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
//                  Positioned(
//                    top: 12,
//                    right: 12,
//                    child: Container(
//                      height: 5,
//                      width: 5,
//                      decoration: BoxDecoration(
//                        color: Colors.white,
//                        boxShadow: <BoxShadow>[
//                          BoxShadow(
//                              color: color.withOpacity(0.82),
//                              offset: const Offset(0, 0),
//                              blurRadius: 1,
//                              spreadRadius: 1),
//                        ],
//                        shape: BoxShape.circle,
//                      ),
//                    ),
//                  ),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 22),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
