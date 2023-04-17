import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/screen/home_screen/workouts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../../value/color.dart';
import '../widgets/workout_log.dart';

class Progress extends StatefulWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final Map<DateTime, List<dynamic>> _events = {
    DateTime(2023, 4, 10): [], // example date with workout information
    DateTime(2023, 4, 15): [], // example date with workout information
    DateTime(2023, 4, 16): [], // example date with workout information
  };

  Map<DateTime, List<dynamic>> workoutMap = {
    DateTime.now(): [
      'Workout 1',
      'Workout 2',
    ],
    DateTime.now().subtract(Duration(days: 1)): [
      'Workout 3',
    ],
    DateTime.now().subtract(Duration(days: 2)): [
      'Workout 4',
      'Workout 5',
    ],
  };

  List<dynamic> _selectedWorkouts = [];
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
    });
  }

  Map<DateTime, List<WorkoutLog>> _workoutLogs = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      child: Text(
                        "My Calendar",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TableCalendar(
                        calendarStyle: CalendarStyle(
                          todayDecoration: BoxDecoration(
                            color: Colors
                                .transparent, // Set the today's day color to transparent
                            shape: BoxShape.circle,
                            border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          todayTextStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        focusedDay: DateTime.now(),
                        firstDay: DateTime(2019, 1, 1),
                        lastDay: DateTime(2300, 1, 1),
                        selectedDayPredicate: (day) =>
                            isSameDay(_selectedDay, day),
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      child: Text(
                        _selectedDay != null
                            ? "Workout Logs for ${DateFormat.yMd().format(_selectedDay!)}"
                            : "No date selected",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Container(
                      height: 250,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _workoutLogs[_selectedDay]?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: grayColors,
                              ),
                              child: Center(
                                  child: Text(
                                _workoutLogs[_selectedDay]?[index]
                                        ?.toString() ??
                                    '',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 30,
                                ),
                              )),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      child: Text("Calorie Calculator",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                    Container(
                        height: 250,
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: InkWell(
                                onTap: () {
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Workouts()),
                                    );
                                  }
                                },
                                child: Container(
                                  width: 100,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: grayColors),
                                  child: Center(
                                      child: Text("Go to your workout",
                                          style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 30,
                                          ))),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      child: Text("MacroNutrient Profile",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                    const SizedBox(height: 1.0),
                    Container(
                        height: 250,
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: InkWell(
                                onTap: () {
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Workouts()),
                                    );
                                  }
                                },
                                child: Container(
                                  width: 100,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: grayColors),
                                  child: Center(
                                      child: Text("Go to your workout",
                                          style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 30,
                                          ))),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ))));
  }
}
