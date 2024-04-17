import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppointmentCalendar extends StatefulWidget {
  const AppointmentCalendar({Key? key}) : super(key: key);

  @override
  _AppointmentCalendarState createState() => _AppointmentCalendarState();
}

class _AppointmentCalendarState extends State<AppointmentCalendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calendar'),
          centerTitle: true,
        ),
        body: SfCalendar(
          view: CalendarView.week,
          timeSlotViewSettings: TimeSlotViewSettings(
              timeInterval: Duration(minutes: 30),
              timeIntervalHeight: 40,
              timeIntervalWidth: 35),
        ));
  }
}
