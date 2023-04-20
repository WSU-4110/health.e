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

                      //Diet Tip 1
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
                                            child: Text("Drinking water increases your metabolism by up to 25% for nearly an hour after drinking it.",
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


                      //Diet Tip 2
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
                                    child: Image.asset('assets/icon/InterImage.webp',
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
                                            child: Text("A study published in the American Journal of Nutrition, found that 8hrs of sleep for 6 nights can boost your metabolism by 20%",
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

                      //Diet Tip 3
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
                                    child: Image.asset('assets/icon/ExpertImage.gifgit add .',
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
                                            child: Text("Several studies suggest that green tea can boost metabolism and help people burn 3–4% more calories each day.",
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

              // Diet Tips List View
    Container(

    padding: EdgeInsets.all(20.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
    const Text(
    'Specific Workout Programs:',
    style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    ),])),
              SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children:  [

                      //Diet Tip 1
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


                      //Diet Tip 2
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

                      //Diet Tip 3
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