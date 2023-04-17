import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/screen/home_screen/workouts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../value/color.dart';

class Progress extends StatefulWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
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
                  child: Text( "My Calendar",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TableCalendar(
                    focusedDay: DateTime.now(),
                    firstDay: DateTime(2019,1,1),
                    lastDay: DateTime(2300,1,1),
                  ),
                ) ,

                Container(
                  margin: const EdgeInsets.all(20.0),
                  child: Text( "Calorie Calculator",
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
                                  MaterialPageRoute(builder: (
                                      context) => const Workouts()),);
                              }
                            },
                            child: Container(
                              width: 100,
                              height: 200,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: grayColors),
                              child: Center(
                                  child: Text("Go to your workout" ,
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 30,
                                      ))
                              ),
                            ),
                          ),
                        ),



                      ],
                    )
                ),

                Container(
                  margin: const EdgeInsets.all(20.0),
                  child: Text( "MacroNutrient Profile",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                 const SizedBox(height:1.0),
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
                                  MaterialPageRoute(builder: (
                                      context) => const Workouts()),);
                              }
                            },
                            child: Container(
                              width: 100,
                              height: 200,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: grayColors),
                              child: Center(
                                  child: Text("Go to your workout" ,
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 30,
                                      ))
                              ),
                            ),
                          ),
                        ), ],
                    )
                ),






              ],


            )



          ))
    );
  }
}
