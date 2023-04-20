import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/screen/Workouts/BeginnerPage.dart';
import 'package:healthe/screen/Workouts/IntermediatePage.dart';
import 'package:healthe/screen/Workouts/ExpertPage.dart';
import 'package:healthe/screen/Workouts/WorkoutBike.dart';
import 'package:healthe/screen/Workouts/WorkoutCardio.dart';
import 'package:healthe/screen/Workouts/WorkoutLift.dart';
import 'package:healthe/screen/Workouts/WorkoutSwim.dart';
import 'package:healthe/value/color.dart';



class WorkoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(

          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Leveled Fitness Programs:',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children:  [

                      //Beginner workout info navigator
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (
                                  context) => BeginnerWorkoutPage()),);
                          },
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                              boxShadow:
                              [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(color: grayColors),
                            ),
                            child: Row(
                              children: [

                                //Image
                                Container(
                                  height:150,
                                  width: 100,
                                  margin: const EdgeInsets.only(left:10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: grayColors,
                                        width: 1.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset('assets/icon/BeginImage.gif',
                                      fit: BoxFit.fill,


                                    ),
                                  ),

                                ),

                                // Text
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(left:10, right: 10,),
                                            child: Text("Beginner",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,

                                              ),)),


                                        Container(
                                            margin: const EdgeInsets.only(left:10, right: 10,),
                                            child: Text("Welcome to the beginner level! Here you can find a three week long workout routine at the beginner level and don't be afraid to mix in any of the specific workout programs.",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 13),))
                                      ]

                                    //Text

                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),


                      //Intermediate workout info navigator
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (
                                  context) => IntermediateWorkoutPage()),);
                          },
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                              boxShadow:
                              [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(color: grayColors),
                            ),
                            child: Row(
                              children: [

                                //Image
                                Container(
                                  height:150,
                                  width: 100,
                                  margin: const EdgeInsets.only(left:10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: grayColors,
                                        width: 1.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset('assets/icon/InterImage.gif',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),

                                // Text
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(left:10, right: 10,),
                                            child: Text("Intermediate",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,

                                              ),)),


                                        Container(
                                            margin: const EdgeInsets.only(left:10, right: 10,),
                                            child: Text("Welcome to the Intermediate level! Here you can find a three week long workout routine at the intermediate level and don't be afraid to mix in any of the specific workout programs as well.",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 13),))
                                      ]

                                    //Text

                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),

                      //Expert workout info navigator
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (
                                  context) => ExpertWorkoutPage()),);
                          },
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                              boxShadow:
                              [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(color: grayColors),
                            ),
                            child: Row(
                              children: [

                                //Image
                                Container(
                                  height:150,
                                  width: 100,
                                  margin: const EdgeInsets.only(left:10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: grayColors,
                                        width: 1.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset('assets/icon/ExpertImage.gif',
                                      fit: BoxFit.fill,


                                    ),
                                  ),

                                ),

                                // Text
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(left:10, right: 10,),
                                            child: Text("Expert",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,

                                              ),)),


                                        Container(
                                            margin: const EdgeInsets.only(left:10, right: 10,),
                                            child: Text("Welcome to the Expert level! Here you can find a three week long workout routine at the expert level and don't be afraid to mix in any of the specific workout programs as well.",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 13),))
                                      ]

                                    //Text

                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  )



              ),

              // New container for specialized workouts
          Container(

              padding: EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
              Text(
                  'Specific Workout Programs:',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                  ]
              )
          ),

              SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children:  [

                      //Biking workout info navigator
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (
                                  context) => WorkoutBike()),);
                          },
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                              boxShadow:
                              [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(color: grayColors),
                            ),
                            child: Row(
                              children: [

                                //Image
                                Container(
                                  height:120,
                                  width: 100,
                                  margin: const EdgeInsets.only(left:10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: grayColors,
                                        width: 1.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset('assets/icon/BikeImage.gif',
                                      fit: BoxFit.fill,


                                    ),
                                  ),

                                ),

                                // Text
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(left:10, right: 10,),
                                            child: Text("Biking",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,

                                              ),)),


                                        Container(
                                            margin: const EdgeInsets.only(left:10, right: 10,),
                                            child: Text("Love cycling? Here you can find weekly workout routines for biking at the beginner, intermediate, and expert level.",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 13),))
                                      ]

                                    //Text

                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),


                      //Cardio workout info navigator
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (
                                  context) => WorkoutCardio()),);
                          },
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                              boxShadow:
                              [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(color: grayColors),
                            ),
                            child: Row(
                              children: [

                                //Image
                                Container(
                                  height:120,
                                  width: 100,
                                  margin: const EdgeInsets.only(left:10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: grayColors,
                                        width: 1.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset('assets/icon/CardioImage.gif',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),

                                // Text
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(left:10, right: 10,),
                                            child: Text("Cardio",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,

                                              ),)),


                                        Container(
                                            margin: const EdgeInsets.only(left:10, right: 10,),
                                            child: Text("Lets get that heart pumping! Here you can find weekly workout routines for cardio at the beginner, intermediate, and expert level.",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 13),))
                                      ]

                                    //Text

                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),

                      //Lifting workout info navigator
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (
                                  context) => WorkoutLift()),);
                          },
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                              boxShadow:
                              [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(color: grayColors),
                            ),
                            child: Row(
                              children: [

                                //Image
                                Container(
                                  height:120,
                                  width: 100,
                                  margin: const EdgeInsets.only(left:10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: grayColors,
                                        width: 1.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset('assets/icon/LiftImage.gif',
                                      fit: BoxFit.fill,


                                    ),
                                  ),

                                ),

                                // Text
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(left:10, right: 10,),
                                            child: Text("Lifting",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,

                                              ),)),


                                        Container(
                                            margin: const EdgeInsets.only(left:10, right: 10,),
                                            child: Text("Time to lift some weights! Here you can find weekly workout routines for lifting at the beginner, intermediate, and expert level.",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 13),))
                                      ]

                                    //Text

                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),

                      //Swimming workout info navigator
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (
                                  context) => WorkoutSwim()),);
                          },
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                              boxShadow:
                              [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(color: grayColors),
                            ),
                            child: Row(
                              children: [

                                //Image
                                Container(
                                  height:120,
                                  width: 100,
                                  margin: const EdgeInsets.only(left:10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: grayColors,
                                        width: 1.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset('assets/icon/SwimImage.gif',
                                      fit: BoxFit.fill,


                                    ),
                                  ),

                                ),

                                // Text
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(left:10, right: 10,),
                                            child: Text("Swimming",
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,

                                              ),)),


                                        Container(
                                            margin: const EdgeInsets.only(left:10, right: 10,),
                                            child: Text("Take the plunge! Here you can find weekly workout routines for swimming at the beginner, intermediate, and expert level.",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 13),))
                                      ]

                                    //Text

                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )



              )
            ],
          ),
        ),
      ),
    );
  }
}