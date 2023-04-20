import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/value/color.dart';

class WorkoutSwim extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: gradientColors_1,
        title: Text(
          'Specific Swimming Plan',
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
                  "Weekly Plan For Beginners",
                  style:
                  GoogleFonts.poppins(fontStyle: FontStyle.normal, fontWeight: FontWeight.w700, fontSize: 23),
                ),
                const SizedBox(height: 10.0),
                const Text(

                  'Day 1: Warm up: 5 minutes of walking or light swimming + Swim 1 x 25 meters freestyle + Swim 1 x 25 meters backstroke + Cool down: 5 minutes of slow swimming\n\nDay 2: Warm up: 5 minutes of walking or light swimming + Swim 2 x 25 meters freestyle, resting 30 seconds between each set + Swim 1 x 25 meters breaststroke + Cool down: 5 minutes of slow swimming\n\nDay 3: Rest day or light activity such as walking or yoga\n\nDay 4: Warm up: 5 minutes of walking or light swimming + Swim 1 x 50 meters freestyle + Swim 1 x 50 meters backstroke + Cool down: 5 minutes of slow swimming\n\nDay 5: Warm up: 5 minutes of walking or light swimming + Swim 2 x 25 meters freestyle, resting 30 seconds between each set + Swim 2 x 25 meters breaststroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming\n\nDay 6:Rest day or light activity such as walking or yoga\n\nDay 7: Warm up: 5 minutes of walking or light swimming + Swim 1 x 50 meters freestyle + Swim 2 x 50 meters breaststroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30.0),
                const Text(
                  'Weekly Plan for Intermediates:',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                const Text(

                  'Day 1: Warm up: 5 minutes of walking or light swimming + Swim 2 x 25 meters freestyle, resting 30 seconds between each set + Swim 2 x 25 meters backstroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming\n\nDay 2: Warm up: 5 minutes of walking or light swimming + Swim 4 x 25 meters freestyle, resting 30 seconds between each set + Swim 2 x 25 meters breaststroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming\n\nDay 3: Rest day or light activity such as walking or yoga\n\nDay 4: Warm up: 5 minutes of walking or light swimming + Swim 2 x 50 meters freestyle, resting 30 seconds between each set + Swim 2 x 50 meters backstroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming\n\nDay 5: Warm up: 5 minutes of walking or light swimming + Swim 4 x 25 meters freestyle, resting 30 seconds between each set + Swim 4 x 25 meters breaststroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming\n\nDay 6:Rest day or light activity such as walking or yoga\n\nDay 7: Warm up: 5 minutes of walking or light swimming + Swim 2 x 50 meters freestyle, resting 30 seconds between each set + Swim 2 x 50 meters breaststroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30.0),
                const Text(
                  'Weekly Plan for Experts:',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                const Text(

                  'Day 1: Warm up: 5 minutes of walking or light swimming + Swim 4 x 25 meters freestyle, resting 30 seconds between each set + Swim 4 x 25 meters backstroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming\n\nDay 2: Warm up: 5 minutes of walking or light swimming + Swim 8 x 25 meters freestyle, resting 30 seconds between each set + Swim 4 x 25 meters breaststroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming\n\nDay 3: Rest day or light activity such as walking or yoga\n\nDay 4: Warm up: 5 minutes of walking or light swimming + Swim 5 x 50 meters freestyle, resting 30 seconds between each set + Swim 5 x 50 meters backstroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming\n\nDay 5: Warm up: 5 minutes of walking or light swimming + Swim 8 x 25 meters freestyle, resting 30 seconds between each set + Swim 8 x 25 meters breaststroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming\n\nDay 6: Warm up: 5 minutes of walking or light swimming + Swim 4 x 25 meters freestyle, resting 30 seconds between each set + Swim 2 x 25 meters breaststroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming \n\nDay 7: Warm up: 5 minutes of walking or light swimming + Swim 4 x 50 meters freestyle, resting 30 seconds between each set + Swim 5 x 50 meters breaststroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming',
                  textAlign: TextAlign.center,
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