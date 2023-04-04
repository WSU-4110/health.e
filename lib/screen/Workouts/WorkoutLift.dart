import 'package:flutter/material.dart';


class WorkoutLift extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Specific Lifting Plan'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Text(
                'Weekly Plan for Beginners:',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text(
                'Day 1: Squats: 3 sets of 6 reps + Lunges: 3 sets of 6 reps (each leg) + Leg press: 3 sets of 6 reps + Cool-down: 5 minutes of stretching\n\nDay 2: Warm-up: 5 minutes of cardio + Bench press: 3 sets of 6 reps + Dumbbell flyes: 3 sets of 6 reps + Push-ups: 3 sets of 6 reps + Cool-down: 5 minutes of stretching\n\nDay 3: + Rest day or light activity such as yoga or stretching\n\nDay 4:Warm-up: 5 minutes of cardio + Lat pull-downs: 3 sets of 8 reps + Seated rows: 3 sets of 8 reps + Bicep curls: 3 sets of 8 reps + Tricep extensions: 3 sets of 8 reps + Cool-down: 5 minutes of stretching\n\nDay 5: Warm-up: 5 minutes of cardio + Deadlifts: 3 sets of 8 reps + Leg curls: 3 sets of 8 reps + Leg extensions: 3 sets of 8 reps + Cool-down: 5 minutes of stretching\n\nDay 6: Warm-up: 5 minutes of cardio + Shoulder press: 3 sets of 8 reps + Lateral raises: 3 sets of 8 reps + Upright rows: 3 sets of 8 reps + Cool-down: 5 minutes of stretching\n\nDay 7: Rest day or light activity such as yoga or stretching',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              Text(
                'Weekly plan for Intermediates:',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text(
                'Day 1: Warm-up: 5-10 minutes of cardio (such as jogging, cycling, or jumping jacks) + Squats: 3 sets of 8-10 reps + Deadlifts: 3 sets of 8-10 reps + Leg press: 3 sets of 12-15 reps + Leg curls: 3 sets of 12-15 reps + Cool-down: 5-10 minutes of stretching\n\nDay 2: Warm-up: 5-10 minutes of cardio + Bench press: 3 sets of 8-10 reps + Incline dumbbell press: 3 sets of 8-10 reps + Cable flies: 3 sets of 12-15 reps + Dips: 3 sets of 12-15 reps + Cool-down: 5-10 minutes of stretching\n\nDay 3: Rest day or light activity such as yoga or stretching\n\nDay 4: Warm-up: 5-10 minutes of cardio + Lat pull-downs: 3 sets of 8-10 reps + Seated rows: 3 sets of 8-10 reps + Bicep curls: 3 sets of 12-15 reps + Tricep extensions: 3 sets of 12-15 reps + Cool-down: 5-10 minutes of stretching\n\nDay 5: Warm-up: 5-10 minutes of cardio + Military press: 3 sets of 8-10 reps + Lateral raises: 3 sets of 12-15 reps + Upright rows: 3 sets of 12-15 reps + Cool-down: 5-10 minutes of stretchingDay \n\n6: Warm-up: 5-10 minutes of cardio + Romanian deadlifts: 3 sets of 8-10 reps + Leg extensions: 3 sets of 12-15 reps + Calf raises: 3 sets of 12-15 reps + Cool-down: 5-10 minutes of stretchingDay \n\n7:Rest day or light activity such as yoga or stretching',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              Text(
                'Weekly Plan for Experts:',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text(
                'Day 1: Warm-up: 10 minutes of cardio (such as jogging, cycling, or jumping jacks) + Squats: 3 sets of 8-10 reps + Deadlifts: 3 sets of 8-10 reps + Leg press: 3 sets of 12-15 reps + Leg curls: 3 sets of 12-15 reps + Cool-down: 5-10 minutes of stretching\n\nDay 2: Warm-up: 10 minutes of cardio + Bench press: 5 sets of 8-10 reps + Incline dumbbell press: 5 sets of 8-10 reps + Cable flies: 5 sets of 12-15 reps + Dips: 5 sets of 12-15 reps + Cool-down: 5-10 minutes of stretching\n\nDay 3: Warm-up 10 minutes of cardio + Romanian deadlifts: 5 sets of 8-10 reps + Leg extensions: 5 sets of 12-15 reps + Calf raises: 5 sets of 12-15 reps + Cool-down: 5-10 minutes of stretching\n\nDay 4: Warm-up: 10 minutes of cardio + Lat pull-downs: 5 sets of 8-10 reps + Seated rows: 5 sets of 8-10 reps + Bicep curls: 5 sets of 12-15 reps + Tricep extensions: 5 sets of 12-15 reps + Cool-down: 5-10 minutes of stretching\n\nDay 5: Warm-up: 10 minutes of cardio + Military press: 5 sets of 8-10 reps + Lateral raises: 5 sets of 12-15 reps + Upright rows: 5 sets of 12-15 reps + Cool-down: 5-10 minutes of stretchingDay \n\n6: Warm-up: 10 minutes of cardio + Romanian deadlifts: 5 sets of 8-10 reps + Leg extensions: 5 sets of 12-15 reps + Calf raises: 5 sets of 12-15 reps + Cool-down: 5-10 minutes of stretching \n\nDay 7:Rest day or light activity such as yoga or stretching',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}