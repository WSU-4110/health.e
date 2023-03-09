import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'NotificationService.dart';

class MyProgress extends StatefulWidget {
  const MyProgress({Key? key}) : super(key: key);

  @override
  _MyProgressState createState() => _MyProgressState();
}

class _MyProgressState extends State<MyProgress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mtan Fitness App Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(
                    child: NoteThumbnail(
                        id: 1,
                        color: Color.fromARGB(255, 153, 255, 250),
                        title: "Your progress",
                        content: "Set a reminder for a healthy lifestyle"))
              ],
            ),
            //#############version#1 code below####################################
          Container(alignment: Alignment.topLeft,
      
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
        Container( 
          child: Column(children: [Image.asset("assets/images/logo.png"),
      ],
      )
        ),
        //#################### upto here ############################
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

  const NoteThumbnail(
      {Key? key,
      required this.id,
      required this.color,
      required this.title,
      required this.content})
      : super(key: key);

  @override
  _NoteThumbnailState createState() => _NoteThumbnailState();
}

class _NoteThumbnailState extends State<NoteThumbnail> {
  DateTime selectedDate = DateTime.now();
  DateTime fullDate = DateTime.now();
  

  Future<DateTime> _selectDate(BuildContext context) async {
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        initialDate: selectedDate,
        lastDate: DateTime(2100));
    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDate),
      );
      if (time != null) {
        setState(() {
          fullDate = DateTimeField.combine(date, time);
        });
        //schedule a notification
        final NotificationService _notificationService = NotificationService();
        await _notificationService.scheduleNotifications(
        id: widget.id,
        title: "Fitness Time!",
        body: " ${time.format(context)} It's time for fitness! Take a break from your busy schedule and prioritize your health",
        time: fullDate);
      }
      return DateTimeField.combine(date, time);
    } else {
      return selectedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
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
          ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text("Add reminder"))
        ],
      ),
    );
  }
}