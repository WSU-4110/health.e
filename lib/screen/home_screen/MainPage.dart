import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/screen/home_screen/home_screen.dart';
import 'package:healthe/screen/home_screen/notification_screen.dart';
import 'package:healthe/screen/home_screen/progress.dart';
import 'package:healthe/screen/home_screen/workouts.dart';
import 'package:healthe/screen/notification_page.dart';
import 'package:healthe/value/color.dart';
import 'notification_screen.dart';

import '../common_widget/app_large_text.dart';



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
            Container(
                padding: const EdgeInsets.only(top:40, left:20),
                child: Row(
                  children: [
                    const Icon(Icons.person_pin, size:30, color: Colors.black),
                    Expanded(child: Container()),
                    Container(
                        margin: const EdgeInsets.only(right:20),
                        width:50,
                        height:50,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    IconButton(
                      icon:  const Icon(Icons.notifications),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ENotification()), // PLACEHOLDER for MINGRAN
                        );


                      },
                      color: Colors.black,
                      ),
                    Container(
                        margin: const EdgeInsets.only(right:10),
                        width:10,
                        height:50,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ],
                )
            ),

            const SizedBox(height:10,),

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
                        onTap: () {},
                        child: Container(
                          width: 100,
                          height: 150,
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