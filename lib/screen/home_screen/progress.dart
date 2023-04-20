import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/screen/home_screen/workouts.dart';
import 'package:healthe/screen/startup_screens/login_screen/login_screen.dart';
import 'package:healthe/screen/widgets/add_workout.dart';
import 'package:healthe/screen/widgets/calorieCalculator.dart';
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
  Future<List<String>> _getWorkoutLogsForSelectedDay() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('workout_log')
        .where('log_date',
            isEqualTo: Timestamp.fromDate(_selectedDay ?? DateTime.now()))
        .get();
    if (querySnapshot.docs.isEmpty) {
      return [];
    }
    return querySnapshot.docs
        .map((doc) => doc['workout_log'].toString())
        .toList();
  }

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
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // The user is not signed in, so we show a sign-in screen.
      return LoginScreen();
    }
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
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
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
                          _getWorkoutLogsForSelectedDay();
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddWorkoutScreen(),
                          ),
                        );
                      },
                      child: Text('Add a Workout'),
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
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('workout_log')
                          .where('log_date',
                              isEqualTo: Timestamp.fromDate(
                                  _selectedDay ?? DateTime.now()))
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return CircularProgressIndicator();
                          default:
                            if (snapshot.data?.docs.isEmpty ?? true) {
                              return Center(
                                child: Text(
                                  'No workouts logged for this day.',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              );
                            } else {
                              List<WorkoutLog> workoutLogs = [];
                              for (final doc in snapshot.data!.docs) {
                                workoutLogs.add(WorkoutLog.fromJson(
                                    doc.data() as Map<String, dynamic>));
                              }

                              return Container(
                                height: 250,
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: workoutLogs.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    if (workoutLogs[index].logDate.day ==
                                            _selectedDay?.day &&
                                        workoutLogs[index].logDate.month ==
                                            _selectedDay?.month &&
                                        workoutLogs[index].logDate.year ==
                                            _selectedDay?.year) {
                                      return Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Container(
                                          width: 100,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: grayColors,
                                          ),
                                          child: Center(
                                            child: Text(
                                              workoutLogs[index].workoutLog,
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 30,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return SizedBox.shrink();
                                    }
                                  },
                                ),
                              );
                            }
                        }
                      },
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
                                              CalorieCalculator()),
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
