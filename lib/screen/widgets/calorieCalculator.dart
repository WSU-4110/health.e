import 'package:flutter/material.dart';

class CalorieCalculator extends StatefulWidget {
  @override
  _CalorieCalculatorState createState() => _CalorieCalculatorState();
}
class _CalorieCalculatorState extends State<CalorieCalculator> {
  final _formKey = GlobalKey<FormState>();
  int _age = 0;
  double _height = 0;
  double _weight = 0;
  int _activityLevel = 0;
  String _gender = 'male';
  String _goal = 'maintain';
  double _bmr = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calorie Calculator'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Form fields
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.calculate),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            _calculateCalorieIntake();
          }
        },
      ),
    );
  }

  void _calculateBmr() {
    // Calculate BMR based on user input
    // Set the result to a class variable named _bmr
    // ...
  }

  void _calculateCalorieIntake() {
    _calculateBmr();

    // Convert activityLevel from a string to an integer
    int activityLevelInt = int.parse(_activityLevel as String);

    // Use the result of _calculateBmr to calculate calorie intake
    double calorieIntake = _bmr * activityLevelInt;

    // Display the calorie intake to the user
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Calorie Intake'),
          content: Text('Your recommended calorie intake is $calorieIntake calories per day.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
