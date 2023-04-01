import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'NotificationService.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ReminderFrequency { None, Daily, Weekly }

class MyProgress extends StatefulWidget {
  const MyProgress({Key? key}) : super(key: key);

  @override
  _MyProgressState createState() => _MyProgressState();
}

class _MyProgressState extends State<MyProgress> {

  bool _switchValue = false; // for the switch button
  late NotificationService _notificationService;

  @override
  void initState() {
  super.initState();
  _getSwitchValue();
  _initializeNotificationService();
  
}
Future<void> _getSwitchValue() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    _switchValue = prefs.getBool('switchValue') ?? false;
  });
}
Future<void> _initializeNotificationService() async {
    _notificationService = NotificationService(); // Add this line
    await _notificationService.init(); // Add this line
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification Settings')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children:  [
                Expanded(
                    child: NoteThumbnail(
                        id: 1,
                        color: Color.fromARGB(255, 255, 255, 255),
                        title: "Your progress",
                        content: "Set a reminder for a healthy lifestyle",
                        switchValue: _switchValue,    // version # 3 
                        )
                        )
              ],
            ),
        //###################### version#3 ########################
                Container(
                  height: 50,
                  child: Row(
                    children: [
                      Text('Workout Reminder',style: TextStyle(fontSize: 16),),
                      Spacer(),
                      Switch(
              value: _switchValue,
              onChanged: (value) async {
                setState(() {
                  _switchValue = value;
                });
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('switchValue', value);
              },
            )
                    ],
                  ),
                  ),
      //###################### Switch button ########################    
              Container(alignment: Alignment.center,
      
            child: ElevatedButton(
          // ignore: prefer_const_constructors
          child: Text('Check notification'),
          onPressed: () async {
            final NotificationService _notificationService = NotificationService();
            await _notificationService.showNotifications(
            id: 3,
            title: "Notification test",
            body: "Notification is worrking for this app");
          },
        ),
        ), 
          ],
        ),
      ),  
    );
  }
}

class NoteThumbnail extends StatefulWidget {
  final int id;
  final Color color;
  final String title;
  final String content;
  final bool switchValue; //switch (version#3)

  const NoteThumbnail(
      {Key? key,
      required this.id,
      required this.color,
      required this.title,
      required this.content,
      required this.switchValue}) // this a parameter that access _switchValue from _NoteThumbnailState (version#3) 
      : super(key: key);

  @override
  _NoteThumbnailState createState() => _NoteThumbnailState();
}

class _NoteThumbnailState extends State<NoteThumbnail> {
  DateTime selectedDate = DateTime.now();
  DateTime fullDate = DateTime.now();
  ReminderFrequency _selectedFrequency = ReminderFrequency.None;
// version#3 starts


@override
  void initState() {
    super.initState();
    _getReminderFrequency(); // Call the method here
  }

  // Add the method here
  Future<void> _getReminderFrequency() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      int storedValue = prefs.getInt('reminderFrequency') ?? 0;
      _selectedFrequency = ReminderFrequency.values[storedValue];
    });
  }
// version#3 ends here

  Future<void> _selectDate(BuildContext context) async {
  
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDate),
      );
  if (time != null) {
    setState(() {
      selectedDate = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        time.hour,
        time.minute,
      );
    });
        // Schedule or cancel the notification based on the switch state and the selected frequency
      final NotificationService _notificationService = NotificationService();
      if (widget.switchValue) {
        if (_selectedFrequency == ReminderFrequency.Daily) {
          await _notificationService.scheduleDailyNotification(
            id: widget.id,
            title: "Fitness Time!",
            body: "It's time for fitness! Take a break from your busy schedule and prioritize your health",
            time: selectedDate,
          );
        } else if (_selectedFrequency == ReminderFrequency.Weekly) {
          await _notificationService.scheduleWeeklyNotification(
            id: widget.id,
            title: "Fitness Time!",
            body: "It's time for fitness! Take a break from your busy schedule and prioritize your health",
            time: selectedDate,
          );
        }
      } else {
        await _notificationService.flutterLocalNotificationsPlugin.cancel(widget.id);
      }
  } 
}
  Widget _buildFrequencySelection() {
  return Column(
    children: [
      ListTile(
        title: const Text('None'),
        leading: Radio<ReminderFrequency>(
          value: ReminderFrequency.None,
          groupValue: _selectedFrequency,
          onChanged: (ReminderFrequency? value) async{
            if (value != null) {
              setState(() {
                _selectedFrequency = value;
              });
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setInt('reminderFrequency', value.index); }
          },
        ),
      ),
      ListTile(
        title: const Text('Daily'),
        leading: Radio<ReminderFrequency>(
          value: ReminderFrequency.Daily,
          groupValue: _selectedFrequency,
          onChanged: (ReminderFrequency? value) async{
          if (value != null) {
              setState(() {
                _selectedFrequency = value;
              });
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setInt('reminderFrequency', value.index);}
          },
        ),
      ),
      ListTile(
        title: const Text('Weekly'),
        leading: Radio<ReminderFrequency>(
          value: ReminderFrequency.Weekly,
          groupValue: _selectedFrequency,
          onChanged: (ReminderFrequency? value) async{
            if (value != null) {
              setState(() {
                _selectedFrequency = value;
              });
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setInt('reminderFrequency', value.index);}
          },
        ),
      ),
    ],
  );
}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(widget.content),
          const SizedBox(
            height: 5,
          ),
          //Text(fullDate.toString()),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(   // 
              onPressed: () => _selectDate(context),
              child: const Text("Add reminder"),),
              _buildFrequencySelection(), // Add this line to display the radio buttons
          
        ],
      ),
    );
    
  }
}