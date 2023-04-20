import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddWorkoutScreen extends StatefulWidget {
  const AddWorkoutScreen({Key? key}) : super(key: key);

  @override
  _AddWorkoutScreenState createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  final _workoutTextController = TextEditingController();
  DateTime _selectedDateTime = DateTime.now();

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
    if (_selectedDateTime.isBefore(now)) {
      // The selected date and time is before the current date and time,
      // so we don't add the workout.
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text(
              'The selected date and time cannot be before the current date and time.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    final workoutData = {
      'log_date': Timestamp.fromDate(_selectedDateTime),
      'username': user.displayName ?? user.email,
      'workout_log': workout,
    };

    await FirebaseFirestore.instance.collection('workout_log').add(workoutData);

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
              onPressed: () async {
                final now = DateTime.now();
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: now,
                  firstDate: now,
                  lastDate: DateTime(now.year + 1),
                );
                if (selectedDate == null) {
                  return;
                }
                final selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(now),
                );
                if (selectedTime == null) {
                  return;
                }
                final selectedDateTime = DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                    selectedTime.hour,
                    selectedTime.minute);
                if (selectedDateTime.isBefore(now)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please select a future date and time'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                  return;
                }
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
                final workoutData = {
                  'log_date': Timestamp.fromDate(selectedDateTime),
                  'username': user.displayName ?? user.email,
                  'workout_log': workout,
                };
                await FirebaseFirestore.instance
                    .collection('workout_log')
                    .add(workoutData);
                Navigator.pop(context);
              },
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
