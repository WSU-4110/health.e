import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/screen/home_screen/workouts.dart';
import 'package:healthe/screen/startup_screens/assessment_screen.dart';
import 'package:healthe/value/color.dart';

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

              // Workout Scroll View
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

              // Workout Scroll View
              SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                border: Border.all(color: grayColors),

                            ),
                            child: Container(
                              margin: const EdgeInsets.only(left:10, right: 10),
                              child: const Center(
                                  child: Text("Drinking water increases your metabolism by up to 25% for nearly an hour after drinking it.",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20),)),
                            ),
                          ),
                        ),
                      ),
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
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(color: grayColors),
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(left:10, right: 10),
                              child: const Center(
                                  child: Text("A study published in the American Journal of Nutrition, found that 8hrs of sleep for 6 nights can boost your metabolism by 20%",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18),)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: 300,
                            height: 500 ,
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
                            child: Container(
                              margin: const EdgeInsets.only(left:10, right: 10),
                              child: const Center(
                                  child: Text("Several studies suggest that green tea can boost metabolism and help people burn 3–4% more calories each day.",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20),)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )



              ),

              Container(
                  margin: const EdgeInsets.only(left:20),
                  child: Text("Take Assessment",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      )
                  )
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
                                    context) => QuizScreen()),);
                            }
                          },
                          child: Container(
                            width: 100,
                            height: 200,
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
                            child: Center(
                                child: Text("Take Assessment" ,
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
          ),
        )
    );
  }
}