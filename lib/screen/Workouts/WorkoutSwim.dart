import 'package:flutter/material.dart';


class WorkoutSwim extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Specific Swimming Plan'),
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
                'Day 1: Warm up: 5 minutes of walking or light swimming + Swim 1 x 25 meters freestyle + Swim 1 x 25 meters backstroke + Cool down: 5 minutes of slow swimming\n\nDay 2: Warm up: 5 minutes of walking or light swimming + Swim 2 x 25 meters freestyle, resting 30 seconds between each set + Swim 1 x 25 meters breaststroke + Cool down: 5 minutes of slow swimming\n\nDay 3: Rest day or light activity such as walking or yoga\n\nDay 4: Warm up: 5 minutes of walking or light swimming + Swim 1 x 50 meters freestyle + Swim 1 x 50 meters backstroke + Cool down: 5 minutes of slow swimming\n\nDay 5: Warm up: 5 minutes of walking or light swimming + Swim 2 x 25 meters freestyle, resting 30 seconds between each set + Swim 2 x 25 meters breaststroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming\n\nDay 6:Rest day or light activity such as walking or yoga\n\nDay 7: Warm up: 5 minutes of walking or light swimming + Swim 1 x 50 meters freestyle + Swim 2 x 50 meters breaststroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              Text(
                'Weekly Plan for Intermediates:',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text(
                'Day 1: Warm up: 5 minutes of walking or light swimming + Swim 2 x 25 meters freestyle, resting 30 seconds between each set + Swim 2 x 25 meters backstroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming\n\nDay 2: Warm up: 5 minutes of walking or light swimming + Swim 4 x 25 meters freestyle, resting 30 seconds between each set + Swim 2 x 25 meters breaststroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming\n\nDay 3: Rest day or light activity such as walking or yoga\n\nDay 4: Warm up: 5 minutes of walking or light swimming + Swim 2 x 50 meters freestyle, resting 30 seconds between each set + Swim 2 x 50 meters backstroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming\n\nDay 5: Warm up: 5 minutes of walking or light swimming + Swim 4 x 25 meters freestyle, resting 30 seconds between each set + Swim 4 x 25 meters breaststroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming\n\nDay 6:Rest day or light activity such as walking or yoga\n\nDay 7: Warm up: 5 minutes of walking or light swimming + Swim 2 x 50 meters freestyle, resting 30 seconds between each set + Swim 2 x 50 meters breaststroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              Text(
                'Weekly Plan for Experts:',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text(
                'Day 1: Warm up: 5 minutes of walking or light swimming + Swim 4 x 25 meters freestyle, resting 30 seconds between each set + Swim 4 x 25 meters backstroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming\n\nDay 2: Warm up: 5 minutes of walking or light swimming + Swim 8 x 25 meters freestyle, resting 30 seconds between each set + Swim 4 x 25 meters breaststroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming\n\nDay 3: Rest day or light activity such as walking or yoga\n\nDay 4: Warm up: 5 minutes of walking or light swimming + Swim 5 x 50 meters freestyle, resting 30 seconds between each set + Swim 5 x 50 meters backstroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming\n\nDay 5: Warm up: 5 minutes of walking or light swimming + Swim 8 x 25 meters freestyle, resting 30 seconds between each set + Swim 8 x 25 meters breaststroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming\n\nDay 6: Warm up: 5 minutes of walking or light swimming + Swim 4 x 25 meters freestyle, resting 30 seconds between each set + Swim 2 x 25 meters breaststroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming \n\nDay 7: Warm up: 5 minutes of walking or light swimming + Swim 4 x 50 meters freestyle, resting 30 seconds between each set + Swim 5 x 50 meters breaststroke, resting 30 seconds between each set + Cool down: 5 minutes of slow swimming',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}