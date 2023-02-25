import 'package:flutter/material.dart';

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

            // Person Icon
            Container(
                padding: const EdgeInsets.only(top:70, left:20),
                child: Row(
                  children: [
                    Icon(Icons.person_pin, size:30, color: Colors.black),
                    Expanded(child: Container()),
                    Container(
                        margin: const EdgeInsets.only(right:20),
                        width:50,
                        height:50,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                        )
                    )
                  ],
                )
            ),

            const SizedBox(height:10,),

            // "Welcome,
            Container(
                margin: const EdgeInsets.only(left:20),
                child: AppLargeText(size: 20, text: "Welcome, User", color: Colors.black)),

            const SizedBox(height: 30),

            Container(
                margin: const EdgeInsets.only(left:20),
                child: AppLargeText(size: 20, text: "Daily Workouts", color: Colors.black)),

            // Workout Scroll View
            Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue),
                          child: Center(
                              child: Text("Cardio Workout",style: TextStyle(color: Colors.black, fontSize: 25),)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue),
                          child: Center(
                              child: Text("Calistenics",style: TextStyle(color: Colors.black, fontSize: 25),)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue),
                          child: Center(
                              child: Text("Weight Lifting",style: TextStyle(color: Colors.black, fontSize: 25),)),
                        ),
                      ),
                    ),
                  ],
                )
            ),

            const SizedBox(height: 30),

            // "Daily Workouts"
            Container(
                margin: const EdgeInsets.only(left:20),
                child: AppLargeText(size: 20, text: "Diet Tips", color: Colors.black)),

            // Workout Scroll View
            Container(
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
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue),
                          child: Center(
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
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue),
                          child: Center(
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
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue),
                          child: Center(
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