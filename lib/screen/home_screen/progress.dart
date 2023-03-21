import 'package:flutter/material.dart';
import 'package:healthe/Calendar/calendarfactory.dart';
import 'package:healthe/Calendar/Calendar.dart';

CalendarFactory factory = MonthlyCalendarFactory();
Calendar monthlyCalendar = factory.createCalendar();

class Progress extends StatefulWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
