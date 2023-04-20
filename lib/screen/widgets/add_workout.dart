import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddWorkoutScreen extends StatefulWidget {
  const AddWorkoutScreen({Key? key}) : super(key: key);

  @override
  _AddWorkoutScreenState createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  final _workoutTextController = TextEditingController();

  @override
  void dispose() {
    _workoutTextController.dispose();
    super.dispose();
  }

  Future<void> _addWorkout() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // The user is not signed in, so we can't add a workout.
      return;
    }

    final workout = _workoutTextController.text.trim();
    if (workout.isEmpty) {
      // The workout text field is empty, so we don't add anything.
      return;
    }

    final now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day);
    final workoutData = {
      'log_date': Timestamp.fromDate(date),
      'username': user.displayName ?? user.email,
      'workout_log': workout,
    };

    await FirebaseFirestore.instance
        .collection('workout_log')
        .add(workoutData);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _workoutTextController,
              decoration: InputDecoration(
                labelText: 'Workout',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addWorkout,
              child: Text('Submit'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}