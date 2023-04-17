import 'package:flutter/material.dart';
import 'package:healthe/screen/Workouts/BeginnerPage.dart';
import 'package:healthe/screen/Workouts/IntermediatePage.dart';
import 'package:healthe/screen/Workouts/ExpertPage.dart';
import 'package:healthe/screen/Workouts/WorkoutBike.dart';
import 'package:healthe/screen/Workouts/WorkoutCardio.dart';
import 'package:healthe/screen/Workouts/WorkoutLift.dart';
import 'package:healthe/screen/Workouts/WorkoutSwim.dart';
import 'package:healthe/value/color.dart';

class WorkoutPage extends StatelessWidget {
  late final String level; // add a field to store the user's assigned level
  WorkoutPage({required this.level});

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
                'Fitness Programs:',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ButtonStyle(
                  // use conditional statements to change the button color for the user's assigned level
                  backgroundColor: level == 'beginner'
                      ? MaterialStateProperty.all(Colors.green)
                      : MaterialStateProperty.all(gradientColors_1),
                ),
                child: Column(
                  children: [
                    Text(
                      'Beginner',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: level == 'beginner'
                              ? Colors.white
                              : Colors.black),
                    ),
                    // add a "Recommended" text for the user's assigned level
                    if (level == 'beginner')
                      Text(
                        'Recommended',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 0, 0),
                        ),
                      ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BeginnerWorkoutPage()),
                  );
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: level == 'intermediate'
                      ? MaterialStateProperty.all(Colors.green)
                      : MaterialStateProperty.all(gradientColors_1),
                ),
                child: Column(
                  children: [
                    Text(
                      'Intermediate',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: level == 'intermediate'
                              ? Colors.white
                              : Colors.black),
                    ),
                    if (level == 'intermediate')
                      Text(
                        'Recommended',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 0, 0),
                        ),
                      ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IntermediateWorkoutPage()),
                  );
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: level == 'expert'
                      ? MaterialStateProperty.all(Colors.green)
                      : MaterialStateProperty.all(gradientColors_1),
                ),
                child: Column(
                  children: [
                    Text(
                      'Expert',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color:
                              level == 'expert' ? Colors.white : Colors.black),
                    ),
                    if (level == 'expert')
                      Text(
                        'Recommended',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 0, 0),
                        ),
                      ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExpertWorkoutPage()),
                  );
                },
              ),
              const SizedBox(height: 20.0),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(gradientColors_1),
                ),
                child: const Text('Bike',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () {
                  // Navigate to beginner workout plan page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WorkoutBike()),
                  );
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(gradientColors_1),
                ),
                child: const Text('Cardio',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () {
                  // Navigate to beginner workout plan page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WorkoutCardio()),
                  );
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(gradientColors_1),
                ),
                child: const Text('Lift',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () {
                  // Navigate to beginner workout plan page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WorkoutLift()),
                  );
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(gradientColors_1),
                ),
                child: const Text('Swim',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () {
                  // Navigate to beginner workout plan page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WorkoutSwim()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
