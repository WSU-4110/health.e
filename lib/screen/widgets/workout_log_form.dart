import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkoutLogForm extends StatefulWidget {
  final Function(String, DateTime) onSubmit;

  WorkoutLogForm({required this.onSubmit});

  @override
  _WorkoutLogFormState createState() => _WorkoutLogFormState();
}

class _WorkoutLogFormState extends State<WorkoutLogForm> {
  final _formKey = GlobalKey<FormState>();
  final _workoutController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  void _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(_workoutController.text, DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day, _selectedTime.hour, _selectedTime.minute));
      _workoutController.clear();
      setState(() {
        _selectedDate = DateTime.now();
        _selectedTime = TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _workoutController,
            decoration: InputDecoration(
              labelText: 'Enter workout',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a workout';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Date',
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      controller: TextEditingController(
                          text: DateFormat.yMd().format(_selectedDate)),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectTime(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Time',
                        suffixIcon: Icon(Icons.access_time),
                      ),
                      controller: TextEditingController(
                          text: _selectedTime.format(context)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
