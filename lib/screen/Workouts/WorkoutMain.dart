import 'package:flutter/material.dart';
import 'package:healthe/screen/Workouts/BeginnerPage.dart';
import 'package:healthe/screen/Workouts/IntermediatePage.dart';
import 'package:healthe/screen/Workouts/ExpertPage.dart';
import 'package:healthe/screen/Workouts/WorkoutBike.dart';
import 'package:healthe/screen/Workouts/WorkoutCardio.dart';
import 'package:healthe/screen/Workouts/WorkoutLift.dart';
import 'package:healthe/screen/Workouts/WorkoutSwim.dart';



class WorkoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Plans'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Fitness Programs:',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40.0),
              ElevatedButton (
                child: const Text('Beginner', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () {
                  // Navigate to beginner workout plan page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BeginnerWorkoutPage()),
                  );
                },
              ),
              const SizedBox(height: 30.0),
              ElevatedButton (
                child: const Text('Intermediate', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () {
                  // Navigate to beginner workout plan page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => IntermediateWorkoutPage()),
                  );
                },
              ),
              const SizedBox(height: 30.0),
              ElevatedButton (
                child: const Text('Expert', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () {
                  // Navigate to beginner workout plan page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ExpertWorkoutPage()),
                  );
                },
              ),
              const SizedBox(height: 30.0),
              ElevatedButton (
                child: const Text('Bike', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () {
                  // Navigate to beginner workout plan page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutBike()),
                  );
                },
              ),
              const SizedBox(height: 30.0),
              ElevatedButton (
                child: const Text('Cardio', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () {
                  // Navigate to beginner workout plan page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutCardio()),
                  );
                },
              ),
              const SizedBox(height: 30.0),
              ElevatedButton (
                child: const Text('Lift', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () {
                  // Navigate to beginner workout plan page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutLift()),
                  );
                },
              ),
              const SizedBox(height: 30.0),
              ElevatedButton (
                child: const Text('Swim', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () {
                  // Navigate to beginner workout plan page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutSwim()),
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
