import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/value/color.dart';

class WorkoutCardio extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Specific Cardio Plan',
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
              "Weekly Plan For Beginners",
              style:
              GoogleFonts.poppins(fontStyle: FontStyle.normal, fontWeight: FontWeight.w700, fontSize: 23),
            ),
              const SizedBox(height: 10.0),
              const Text(
                'Day 1: 5-10 minute warm-up (walking or marching in place), followed by 10-15 minutes of low-impact aerobics (such as seated marching or seated leg lifts), and a 5-10 minute cool-down (gentle movements).\n\nDay 2: 5-10 minute warm-up (walking or marching in place), followed by 10-15 minutes of stationary cycling or recumbent biking, and a 5-10 minute cool-down (gentle movements).\n\nDay 3: Rest day or light activity such as stretching or yoga.\n\nDay 4: 5-10 minute warm-up (walking or marching in place), followed by 10-15 minutes of low-impact aerobics (such as seated side steps or seated arm raises), and a 5-10 minute cool-down (gentle movements).\n\nFriday: 5-10 minute warm-up (walking or marching in place), followed by 10-15 minutes of stationary cycling or recumbent biking, and a 5-10 minute cool-down (gentle movements).\n\nDay 6: 5-10 minute warm-up (walking or marching in place), followed by a 10-15 minute walk at a comfortable pace, and a 5-10 minute cool-down (gentle movements).\n\nDay 7: Rest day or light activity such as stretching or yoga.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),
              const Text(
                'Weekly Plan for Intermediates:',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Day 1: 10-minute warm-up (walking or jogging) + 30-minute run or brisk walk + 5-minute cool-down (walking or stretching)\n\nDay 2: 10-minute warm-up (jumping jacks or high knees) +20 minutes of HIIT (high-intensity interval training) or circuit training + 5-minute cool-down (walking or stretching)\n\nDay 3: Rest day or light activity such as yoga or stretching\n\nDay 4: 10-minute warm-up (elliptical or cycling + 30-minute moderate-intensity cardio (elliptical, cycling, or rowing machine) + 5-minute cool-down (walking or stretching)\n\nDay 5: 10-minute warm-up (jumping jacks or high knees) + 20 minutes of steady-state cardio (jogging or cycling) + 5-minute cool-down (walking or stretching)\n\nDay 6: 10-minute warm-up (elliptical or cycling) + 30-minute moderate-intensity cardio (elliptical, cycling, or rowing machine) + 5-minute cool-down (walking or stretching)\n\nDay 7: Rest day or light activity such as yoga or stretching',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),
              const Text(
                'Weekly Plan for Experts:',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Day 1: 10-minute warm-up (jumping jacks or high knees) + 45-minute run or high-intensity interval training (HIIT) + 5-minute cool-down (walking or stretching)\n\nDay 2: 10-minute warm-up (jumping jacks or high knees) + 30-minute cycling (indoor or outdoor) + 15 minutes of strength training (such as weight lifting or bodyweight exercises) + 5-minute cool-down (walking or stretching)\n\nDay 3:10-minute warm-up (elliptical or cycling) + 45-minute moderate-intensity cardio (elliptical, cycling, or rowing machine) + 5-minute cool-down (walking or stretching)\n\nDay 4:10-minute warm-up (jumping jacks or high knees) + 30 minutes of HIIT or circuit training + 15 minutes of strength training + 5-minute cool-down (walking or stretching)\n\nDay 5:10-minute warm-up (elliptical or cycling) + 45-minute run or high-intensity cardio (such as stair climbing) + 5-minute cool-down (walking or stretching)\n\nDay 6:10-minute warm-up (jumping jacks or high knees) + 30-minute cycling (indoor or outdoor) + 15 minutes of strength training + 5-minute cool-down (walking or stretching)\n\nDay 7:Rest day or light activity such as yoga or stretching',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),

    ),
      );
  }
}