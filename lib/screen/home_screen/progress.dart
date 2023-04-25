import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/database/crud.dart';
import 'package:healthe/screen/home_screen/workouts.dart';
import 'package:healthe/screen/startup_screens/login_screen/login_screen.dart';
import 'package:healthe/screen/widgets/add_workout.dart';
import 'package:healthe/screen/widgets/calorieCalculator.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../../database/crud.dart';
import '../../value/color.dart';
import '../widgets/workout_log.dart';
import 'package:pie_chart/pie_chart.dart';

class Progress extends StatefulWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('users');

  String? id = FirebaseAuth.instance.currentUser?.uid;

  final CalendarFormat _calendarFormat = CalendarFormat.month;

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

  final Map<DateTime, List<WorkoutLog>> _workoutLogs = {};

  Map<String, dynamic>? _userInfo;

  bool states = true;

  final TextEditingController controllerWeight = TextEditingController();

  int? protein;
  int? carbs;
  int? fats;

  final dataMap = <String, double>{
    "Protein": 5,
    "Carbs": 3,
    "Fats": 2,
  };

  String calculator() {
    late int age;
    late int height;
    late int weight;
    late String gender;

    if (_userInfo != null) {
      age = _userInfo!['age'];
      height = _userInfo!['height'];
      weight = _userInfo!['weight'];
      gender = _userInfo!['gender'];
      // use _userInfo here
    } else {
      age = 0;
      height = 0;
      weight = 0;
      gender = "";

      // handle the case where _userInfo is null
    }
    late double BMR;

    if (gender == 'Male') {
      BMR = (66.5 + (13.75 * weight) + (5.003 * height) - (6.75 * age));
    } else {
      BMR = 66.5 + (13.75 * weight) + (5.003 * height) - (6.75 * age);
    }

    int BMR_int = BMR.toInt();

    return BMR_int.toString();
  }



  void initState() {
   
  }

  int? weight;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // The user is not signed in, so we show a sign-in screen.
      return LoginScreen();
    }

    String? dropdownValue = 'Build Muscle';

    String finalBmr = calculator();

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
                                    physics:
                                    const NeverScrollableScrollPhysics(),
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
                                          .toString() ??
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

                      // "Calorie Calculator"
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
                                    {}
                                  },
                                  child: Container(
                                      width: 100,
                                      height: 200,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color: grayColors),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          // Enter your weight
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 10.0),
                                            child: states
                                                ? Text("Enter your weight",
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 15.0,
                                                  fontWeight:
                                                  FontWeight.w700,
                                                ))
                                                : Text("Your TDEE is: ",
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 15.0,
                                                  fontWeight:
                                                  FontWeight.w700,
                                                )),
                                          ),

                                          // TextField/Calorie Result
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10.0),
                                            padding: const EdgeInsets.only(
                                                left: 0, bottom: 5, top: 5),
                                            width: 200.0,
                                            // height: mHeight / 16,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: states
                                                  ? Colors.white
                                                  : grayColors,
                                              borderRadius:
                                              BorderRadius.circular(8),
                                            ),
                                            child: states
                                                ? TextFormField(
                                              //  controller: controller.nameController,
                                              keyboardType:
                                              TextInputType.number,
                                              onChanged: (value) {
                                                weight = int.parse(value);
                                              },

                                              style: GoogleFonts.inter(
                                                fontSize: 15,
                                                fontWeight:
                                                FontWeight.w600,
                                                fontStyle:
                                                FontStyle.normal,
                                              ),
                                              decoration:
                                              const InputDecoration(
                                                hintText: " Weight (kg)",
                                                border: InputBorder.none,
                                                focusedBorder:
                                                InputBorder.none,
                                                enabledBorder:
                                                InputBorder.none,
                                                errorBorder:
                                                InputBorder.none,
                                                disabledBorder:
                                                InputBorder.none,
                                              ),
                                            )
                                                : Text(
                                              "$finalBmr Calories",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 25,
                                                  fontWeight:
                                                  FontWeight.w700),
                                            ), // PRINT ACTUAL CALORIES HERE
                                          ),

                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10.0),
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                MaterialStatePropertyAll<
                                                    Color>(
                                                    gradientColors_1),
                                              ),
                                              onPressed: () async {
                                                if (states) {
                                                  Crud().updateUserWeight(
                                                      id!, weight!);
                                                  setState(() {
                                                    states = false;
                                                  });
                                                } else {
                                                  setState(() {
                                                    states = true;
                                                  });
                                                }
                                              },
                                              child: states
                                                  ? const Text("Calculate")
                                                  : const Text("Reset"),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                              ),
                            ]),
                      ),

                      // "Enter your weight"

                      // Calorie Calculator Form Field

                      // "Macro Nutrient Profile
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

                      // Macro Nutrient Profile List View
                      Container(
                          height: 250,
                          child: ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: InkWell(
                                    onTap: () {
                                      {}
                                    },
                                    child: Container(
                                        width: 200,
                                        height: 200,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color: grayColors),
                                        child: Row(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                // "Select a Goal"
                                                Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 20,
                                                        horizontal: 10.0),
                                                    child: Text(
                                                        "Select a Goal: ",
                                                        textAlign:
                                                        TextAlign.left,
                                                        style:
                                                        GoogleFonts.poppins(
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                          FontWeight.w700,
                                                        ))),

                                                // Drop Down Menu
                                                Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 5,
                                                        horizontal: 10.0),
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 0,
                                                        bottom: 5,
                                                        top: 5),
                                                    width: 150.0,
                                                    // height: mHeight / 16,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8),
                                                    ),
                                                    child:
                                                    DropdownButton<String>(
                                                      value: dropdownValue,
                                                      icon: const Icon(
                                                          Icons.arrow_downward),
                                                      elevation: 16,
                                                      style: TextStyle(
                                                          color:
                                                          gradientColors_1),
                                                      underline: Container(
                                                        height: 2,
                                                        color: gradientColors_1,
                                                      ),
                                                      onChanged:
                                                          (String? value) {
                                                        setState(() {
                                                          dropdownValue = value;
                                                        });

                                                        if (dropdownValue ==
                                                            'Build Muscle') {
                                                          protein = (int.parse(
                                                              finalBmr) *
                                                              .45)
                                                              .toInt();
                                                          carbs = (int.parse(
                                                              finalBmr) *
                                                              .40)
                                                              .toInt();
                                                          fats = (int.parse(
                                                              finalBmr) *
                                                              .15)
                                                              .toInt();
                                                        } else if (dropdownValue ==
                                                            'Lose Weight') {
                                                          protein = (int.parse(
                                                              finalBmr) *
                                                              .35)
                                                              .toInt();
                                                          carbs = (int.parse(
                                                              finalBmr) *
                                                              .50)
                                                              .toInt();
                                                          fats = (int.parse(
                                                              finalBmr) *
                                                              .15)
                                                              .toInt();
                                                        } else if (dropdownValue ==
                                                            'Maintain') {
                                                          protein = (int.parse(
                                                              finalBmr) *
                                                              .35)
                                                              .toInt();
                                                          carbs = (int.parse(
                                                              finalBmr) *
                                                              .40)
                                                              .toInt();
                                                          fats = (int.parse(
                                                              finalBmr) *
                                                              .25)
                                                              .toInt();
                                                        }
                                                        dataMap["Protein"] =
                                                        (protein! / 4);
                                                        dataMap["Carbs"] =
                                                        (carbs! / 4);
                                                        dataMap["Fats"] =
                                                        (fats! / 9);
                                                      },
                                                      items: const [
                                                        DropdownMenuItem<
                                                            String>(
                                                          value: 'Build Muscle',
                                                          child: Text(
                                                              'Build Muscle'),
                                                        ),
                                                        DropdownMenuItem<
                                                            String>(
                                                          value: 'Lose Weight',
                                                          child: Text(
                                                              'Lose Weight'),
                                                        ),
                                                        DropdownMenuItem<
                                                            String>(
                                                          value: 'Maintain',
                                                          child:
                                                          Text('Maintain'),
                                                        ),
                                                      ],
                                                    )),
                                              ],
                                            ),

                                            Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 175,
                                                  child: PieChart(
                                                    dataMap: dataMap,
                                                    chartRadius: 300.0,
                                                    chartType: ChartType.ring,
                                                    chartLegendSpacing: 15.0,
                                                    legendOptions:
                                                    const LegendOptions(
                                                      legendPosition:
                                                      LegendPosition.bottom,
                                                      showLegendsInRow: true,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ) // PUT PIE GRAPH HERE
                                          ],
                                        )),
                                  ),
                                ),
                              ]))
                    ]))));
  }
}