import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Progress extends StatefulWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        focusedDay: DateTime.now(),
        firstDay: DateTime(2019,1,1),
        lastDay: DateTime(2030,1,1),
      )


    );
  }
}

