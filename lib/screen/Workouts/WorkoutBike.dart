import 'package:flutter/material.dart';


class WorkoutBike extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Specific Cycling Plan'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Text(
                'Weekly Plan Beginner:',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text(
                'Day 1: 5 minutes of cycling at an easy pace + 5 minutes of rest + 5 minutes of cycling at an easy pace + 5 minutes of rest + 5 minutes of cycling at an easy pace\n\nDay 2: Rest\n\nDay 3: 7 minutes of cycling at an easy pace + 3 minutes of rest + 7 minutes of cycling at an easy pace + 3 minutes of rest + 7 minutes of cycling at an easy pace\n\nDay 4: Rest\n\nDay 5: 10 minutes of cycling at an easy pace + 5 minutes of rest + 10 minutes of cycling at an easy pace + 5 minutes of rest + 10 minutes of cycling at an easy pace\n\nDay 6: Rest\n\nDay 7: 12 minutes of cycling at an easy pace + 8 minutes of rest + 12 minutes of cycling at an easy pace\n\n',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              Text(
                'Weekly Plan Intermediate:',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text(
                'Day 1: 15 minutes of cycling at an easy pace + 10 minutes of rest + 15 minutes of cycling at an easy pace\n\nDay 2: Rest\n\nDay 3: 18 minutes of cycling at an easy pace + 7 minutes of rest + 18 minutes of cycling at an easy pace\n\nDay 4: Rest\n\nDay 5: 20 minutes of cycling at an easy pace + 5 minutes of rest + 20 minutes of cycling at an easy pace\n\nDay 6: Rest\n\nDay 7: 22 minutes of cycling at an easy pace + 3 minutes of rest + 22 minutes of cycling at an easy pace',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              Text(
                'Weekly Plan Expert:',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text(
                'Day 1: Endurance ride (60-90 minutes) at a moderate pace. Focus on maintaining a steady effort level throughout the ride.\n\nDay 2: Tempo intervals (45-60 minutes). Warm up for 10-15 minutes, then do 4-6 intervals of 5-10 minutes at a tempo effort level (around 80-85% of your maximum heart rate) with 2-3 minutes of recovery between intervals. Cool down for 10-15 minutes.\n\nDay 3: Active recovery ride (30-45 minutes) at a very easy pace. This ride should be at a low effort level and should focus on recovery rather than performance.\n\nDay 4: Hill repeats (45-60 minutes). Warm up for 10-15 minutes, then do 4-6 hill repeats of 2-5 minutes each at a high effort level (around 90-95% of your maximum heart rate) with a recovery period of 2-3 minutes between repeats. Cool down for 10-15 minutes.\n\nDay 5: Rest day or easy ride (30-60 minutes) at an easy pace.\n\nDay 6: Long ride (90-120 minutes) at a moderate pace. This ride should be at a comfortable pace, but you can incorporate some tempo intervals or hill repeats into the ride if you feel up to it.\n\nDay 7: Rest day or easy ride (30-60 minutes) at an easy pace.\n\n',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}