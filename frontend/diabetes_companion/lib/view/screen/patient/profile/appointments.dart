import '/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../widget/sectopbar.dart';

// /// The hove page which hosts the calendar
class Appointments extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  const Appointments({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  AppointmentsState createState() => AppointmentsState();
}

final CalendarController _controller = CalendarController();
Color? _headerColor, _viewHeaderColor, _calendarColor;

class AppointmentsState extends State<Appointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: SecTopBar(
          label: 'مواعيدي',
        ),
      ),
      body: SfCalendar(
        headerStyle: const CalendarHeaderStyle(
            textAlign: TextAlign.center,
            textStyle: TextStyle(
                fontSize: 25, fontFamily: 'Amiri', color: ColorApp.blue)),

        todayTextStyle: TextStyle(
            // color: ColorApp.,
            ),

        view: CalendarView.week,
        allowedViews: const [
          CalendarView.day,
          CalendarView.week,
          CalendarView.month,
        ],
        viewHeaderStyle: ViewHeaderStyle(backgroundColor: _viewHeaderColor),
        backgroundColor: _calendarColor,
        controller: _controller,
        initialDisplayDate: DateTime.now(),
        // dataSource: getCalendarDataSource(),
        onTap: calendarTapped,
        monthViewSettings: const MonthViewSettings(
            navigationDirection: MonthNavigationDirection.vertical),
      ),
    );
  }

  void calendarTapped(CalendarTapDetails calendarTapDetails) {
    if (_controller.view == CalendarView.month &&
        calendarTapDetails.targetElement == CalendarElement.calendarCell) {
      _controller.view = CalendarView.day;
    } else if (_controller.view == CalendarView.week &&
        calendarTapDetails.targetElement == CalendarElement.viewHeader) {
      _controller.view = CalendarView.day;
    }
  }
}
