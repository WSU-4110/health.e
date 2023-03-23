import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/screen/home_screen/home_screen.dart';
import 'package:healthe/screen/home_screen/progress.dart';
import 'package:healthe/screen/home_screen/workouts.dart';
import 'package:healthe/value/color.dart';


import '../Workouts/beginner_page.dart';
import '../common_widget/app_large_text.dart';
import 'notification_page.dart';



class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Person and Notification Icon


            const SizedBox(height:30),

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
                height: 200,
                child: ListView(

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: InkWell(
                        onTap: () {

                          // Navigate to beginner workout plan page
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BeginnerWorkoutPage()),
                          );
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

            const SizedBox(height: 30),

            // "Diet Tips"
            Container(
                margin: const EdgeInsets.only(left:20),
                child: AppLargeText(size: 20, text: "Diet Tips", color: Colors.black)),

            // Workout Scroll View
            SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: grayColors),
                          child: const Center(
                              child: Text("Diet Tip 1",style: TextStyle(color: Colors.black, fontSize: 25),)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: grayColors),
                          child: const Center(
                              child: Text("Diet Tip 2",style: TextStyle(color: Colors.black, fontSize: 25),)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: grayColors),
                          child: const Center(
                              child: Text("Diet Tip 3",style: TextStyle(color: Colors.black, fontSize: 25),)),
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ],
        )
    );
  }
}