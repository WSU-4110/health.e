import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/screen/Workouts/WorkoutCardio.dart';
import 'package:healthe/value/color.dart';

import '../startup_screens/reassessment_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Person and Notification Icon
              const SizedBox(height:20),

              // "Welcome,
              Container(
                  margin: const EdgeInsets.only(left:20),
                  child: Text( "Welcome, User!",
                      style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                      )),
              ),

              // Go to Workout
              SizedBox(
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
                                    context) => WorkoutCardio()),);
                            }
                          },

                          child: Stack(
                              children: <Widget>[
                          Container(
                                      height:200,
                                      width: 400,
                  margin: const EdgeInsets.only(left:10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                        color: grayColors,
                        width: 1.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset('assets/icon/Workouts.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                          ),
                              Container(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Personal Workout',
                                    style: TextStyle(color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28.0),
                              )
                ),
                          ]
                  ),
                        ),
                  ),
              //Spacer
              const SizedBox(height: 0),

              // "Diet Tips"
              Container(
                  margin: const EdgeInsets.only(left:20),
                  child: Text("Diet Tips",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    )
                  )
              ),
          ]
        ),
              ),


              // Diet Tips List View
              SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:  [

                      //Diet Tip 1
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {},
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
                                  height:100,
                                  width: 70,
                                  margin: const EdgeInsets.only(left:10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: grayColors,
                                        width: 1.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset('assets/icon/water_drinking.jpg',
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
                                            child: Text("Water",
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
                          onTap: () {},
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
                                  height:100,
                                  width: 70,
                                  margin: const EdgeInsets.only(left:10, right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                          color: grayColors,
                                      width: 1.0),
                                  ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset('assets/icon/sleep.jpg',
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
                                          child: Text("Sleep",
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
                          onTap: () {},
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
                                  height:100,
                                  width: 70,
                                  margin: const EdgeInsets.only(left:10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: grayColors,
                                        width: 1.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset('assets/icon/green_tea.jpg',
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
                                            child: Text("Drink Green Tea",
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

              SizedBox(
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
                                    context) => QuizScreen2()),);
                            }
                          },
                          child: Stack(
                              children: <Widget>[
                                Container(
                                  height:200,
                                  width: 400,
                                  margin: const EdgeInsets.only(left:10, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: grayColors,
                                        width: 1.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset('assets/icon/Assessment.jpg',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Reevaluate Assessment',
                                      style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28.0),
                                    )
                                ),
                              ]
                          ),
                        ),
                      ), ],
                  )
              ),

            ],
          ),
        )
    );
  }
}