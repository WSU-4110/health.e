import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/value/color.dart';

class IntermediateWorkoutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Intermediate Workout Plan',
          style:
          GoogleFonts.poppins(fontStyle: FontStyle.normal, fontWeight: FontWeight.w700, fontSize: 23),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientColors_1, gradientColors_1],
          ),
        ),
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Week 1",
                  style:
                  GoogleFonts.poppins(fontStyle: FontStyle.normal, fontWeight: FontWeight.w700, fontSize: 23),
                ),
                const SizedBox(height: 10.0),
                const Text(

                  'Day 1: Warm-up: 5 minutes of brisk jogging + Cardio: 15 minutes of high-intensity interval training (HIIT) on the treadmill (30 seconds sprint, 60 seconds rest) + Strength training: 2 sets of 8 reps of bench press, lat pulldowns, and squats + Swimming: 5 minutes of freestyle laps + Cool-down: 5 minutes of stretching\n\nDay 2: Warm-up: 5 minutes of brisk jogging + Cardio: 25 minutes of steady-state cycling at a moderate intensity + Strength training: 3 sets of 8 reps of bicep curls, tricep extensions, and calf raises + Swimming: 10 minutes of backstroke laps + Cool-down: 5 minutes of stretching\n\nDay 3: Rest day\n\nDay 4: Warm-up: 5 minutes of brisk jogging + Cardio: 15 minutes of HIIT on the rowing machine (30 seconds rowing hard, 30 seconds rest) + Strength training: 2 sets of 8 reps of overhead press, lunges, and deadlifts + Swimming: 5 minutes of breaststroke laps + Cool-down: 5 minutes of stretching\n\nDay 5: Rest Day \n\nDay 6: Warm-up: 10 minutes of brisk jogging + Cardio: 20 minutes of low-intensity steady-state walking + Swimming: 8 minutes of any stroke of your choice + Cool-down: 5 minutes of stretching\n\nDay 7: Rest day',                  textAlign: TextAlign.center,            ),

                const SizedBox(height: 30.0),
                const Text(
                  'Weekly 2',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Day 1: Warm-up: 5 minutes of brisk jogging + Cardio: 15 minutes of high-intensity interval training (HIIT) on the treadmill (30 seconds sprint, 60 seconds rest) + Strength training: 2 sets of 10 reps of bench press, lat pulldowns, and squats + Swimming: 8 minutes of freestyle laps + Cool-down: 5 minutes of stretching\n\nDay 2: Warm-up: 5 minutes of brisk jogging + Cardio: 20 minutes of steady-state cycling at a moderate intensity + Strength training: 3 sets of 10 reps of bicep curls, tricep extensions, and calf raises + Swimming: 10 minutes of backstroke laps + Cool-down: 5 minutes of stretching\n\nDay 3: Rest day\n\nDay 4: Warm-up: 5 minutes of brisk jogging + Cardio: 15 minutes of HIIT on the rowing machine (30 seconds rowing hard, 30 seconds rest) + Strength training: 2 sets of 10 reps of overhead press, lunges, and deadlifts + Swimming: 8 minutes of breaststroke laps + Cool-down: 5 minutes of stretching\n\nDay 5: Warm-up: 10 minutes of brisk walking + Cardio: 15 minutes of steady-state elliptical training at a moderate intensity + Strength training: 2 sets of 10 reps of lateral raises, hamstring curls, and planks + Swimming: 8 minutes of butterfly laps + Cool-down: 5 minutes of stretching\n\nDay 6: Warm-up: 10 minutes of brisk jogging + Cardio: 15 minutes of low-intensity steady-state walking + Swimming: 10 minutes of any stroke of your choice + Cool-down: 5 minutes of stretching\n\nDay 7: Rest day',
                  textAlign: TextAlign.center, ),
                  const SizedBox(height: 30.0),
                const Text(
                  'Week 3',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                const Text(

                  'Day 1: Warm-up: 10 minutes of brisk jogging + Cardio: 20 minutes of high-intensity interval training (HIIT) on the treadmill (30 seconds sprint, 60 seconds rest) + Strength training: 3 sets of 10 reps of bench press, lat pulldowns, and squats + Swimming: 10 minutes of freestyle laps + Cool-down: 5 minutes of stretching\n\nDay 2: Warm-up: 5 minutes of brisk jogging + Cardio: 20 minutes of steady-state cycling at a moderate intensity + Strength training: 3 sets of 10 reps of bicep curls, tricep extensions, and calf raises + Swimming: 10 minutes of backstroke laps + Cool-down: 5 minutes of stretching\n\nDay 3: Rest day\n\nDay 4: Warm-up: 5 minutes of brisk jogging + Cardio: 20 minutes of HIIT on the rowing machine (30 seconds rowing hard, 30 seconds rest) + Strength training: 3 sets of 10 reps of overhead press, lunges, and deadlifts + Swimming: 10 minutes of breaststroke laps + Cool-down: 5 minutes of stretching\n\nDay 5: Warm-up: 5 minutes of brisk jogging + Cardio: 20 minutes of steady-state elliptical training at a moderate intensity + Strength training: 3 sets of 10 reps of lateral raises, hamstring curls, and planks + Swimming: 10 minutes of butterfly laps + Cool-down: 5 minutes of stretching\n\nDay 6: Warm-up: 10 minutes of brisk jogging + Cardio: 20 minutes of low-intensity steady-state walking + Swimming: 12 minutes of any stroke of your choice + Cool-down: 5 minutes of stretching\n\nDay 7: Rest day',
                  textAlign: TextAlign.center, ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
