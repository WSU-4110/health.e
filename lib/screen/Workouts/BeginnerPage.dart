import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/value/color.dart';

class BeginnerWorkoutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: gradientColors_1,
        title: Text(
          'Beginner Workout Plan',
          style:
          GoogleFonts.poppins(fontStyle: FontStyle.normal, fontWeight: FontWeight.w700, fontSize: 23),

        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        decoration: const BoxDecoration(
          color: Color(0xfff5f5dc), // Set the background color of the container
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
                  'Day 1: Warm-up: 5 minutes of brisk walking + Cardio: 8 minutes of moderate-intensity cycling + Strength training: 2 sets of 6 reps of bodyweight squats, push-ups, and lunges + Cool-down: 5 minutes of stretching\n\nDay 2: Warm-up: 5 minutes of brisk walking + Cardio: 6 minutes of moderate-intensity swimming + Strength training: 2 sets of 6 reps of bicep curls, tricep dips, and calf raises + Cool-down: 5 minutes of stretching\n\nDay 3: Rest day\n\nDay 4: Warm-up: 5 minutes of brisk walking + Cardio: 5 minutes of moderate-intensity rowing + Strength training: 2 sets of 8 reps of dumbbell bench press, lat pulldowns, and leg press + Cool-down: 5 minutes of stretching\n\nDay 5:Warm-up: 5 minutes of brisk walking + Cardio: 10 minutes of moderate-intensity elliptical training + Strength training: 2 sets of 8 reps of dumbbell shoulder press, dumbbell curls, and dumbbell flys + Cool-down: 5 minutes of stretching\n\nDay 6: Warm-up: 5 minutes of brisk walking + Cardio: 10 minutes of moderate-intensity walking + Cool-down: 5 minutes of stretching\n\nDay 7:Rest day',                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30.0),
                const Text(
                  'Weekly 2',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Day 1: Warm-up: 5 minutes of brisk walking + Cardio: 10 minutes of moderate-intensity cycling + Strength training: 3 sets of 8 reps of bodyweight squats, push-ups, and lunges + Cool-down: 5 minutes of stretching\n\nDay 2: Warm-up: 5 minutes of brisk walking + Cardio: 6 minutes of moderate-intensity swimming + Strength training: 3 sets of 6 reps of bicep curls, tricep dips, and calf raises + Cool-down: 5 minutes of stretching\n\nDay 3: Rest day\n\nDay 4: Warm-up: 5 minutes of brisk walking + Cardio: 5 minutes of moderate-intensity rowing + Strength training: 3 sets of 6 reps of dumbbell bench press, lat pulldowns, and leg press + Cool-down: 5 minutes of stretching\n\nDay 5:Warm-up: 5 minutes of brisk walking + Cardio: 5 minutes of moderate-intensity elliptical training + Strength training: 3 sets of 8 reps of dumbbell shoulder press, dumbbell curls, and dumbbell flys + Cool-down: 5 minutes of stretching\n\nDay 6: Warm-up: 5 minutes of brisk walking + Cardio: 10 minutes of moderate-intensity walking + Cool-down: 5 minutes of stretching\n\nDay 7:Rest day',                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30.0),
                const Text(
                  'Week 3',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Day 1: Warm-up: 5 minutes of brisk walking + Cardio: 12 minutes of moderate-intensity cycling + Strength training: 3 sets of 10 reps of bodyweight squats, push-ups, and lunges + Cool-down: 5 minutes of stretching\n\nDay 2: Warm-up: 5 minutes of brisk walking + Cardio: 8 minutes of moderate-intensity swimming + Strength training: 3 sets of 8 reps of bicep curls, tricep dips, and calf raises + Cool-down: 5 minutes of stretching\n\nDay 3: Rest day\n\nDay 4: Warm-up: 5 minutes of brisk walking + Cardio: 10 minutes of moderate-intensity rowing + Strength training: 3 sets of 8 reps of dumbbell bench press, lat pulldowns, and leg press + Cool-down: 5 minutes of stretching\n\nDay 5:Warm-up: 5 minutes of brisk walking + Cardio: 10 minutes of moderate-intensity elliptical training + Strength training: 3 sets of 10 reps of dumbbell shoulder press, dumbbell curls, and dumbbell flys + Cool-down: 5 minutes of stretching\n\nDay 6: Warm-up: 5 minutes of brisk walking + Cardio: 12 minutes of moderate-intensity walking + Cool-down: 5 minutes of stretching\n\nDay 7: Warm-up: 5 minutes of brisk walking + Cardio: 8 minutes of moderate-intensity cycling + Strength training: 2 sets of 6 reps of bodyweight squats, push-ups, and lunges + Cool-down: 5 minutes of stretching',                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                )
              ],
            ),
          ),
        ),

      ),
    );
  }
}
