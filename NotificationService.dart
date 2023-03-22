import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class NotificationService {

  //instance of FlutterLocalNotificationsPlugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> init() async {

    //Initialization Settings for Android
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    //Initialization Settings for iOS
    const IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    //Initializing settings for both platforms (Android & iOS)
    const InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS);

    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onSelectNotification: onSelectNotification
    );
  }

   onSelectNotification(String? payload) async {
    //Navigate to wherever you want
  }


   requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }


  Future<void> showNotifications({id, title, body, payload}) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails('your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
    id, title, body, platformChannelSpecifics,
        payload: payload);
  }
 // version#3 additon starts here
  Future<void> scheduleDailyNotification({id, title, body, time}) async {
    await flutterLocalNotificationsPlugin.periodicallyShow(
      id,
      title,
      body,
      RepeatInterval.daily,
      NotificationDetails(
        android: AndroidNotificationDetails(
          'your channel id',
          'your channel name',
          channelDescription: 'your channel description',
        ),
      ),
      androidAllowWhileIdle: true,
    );
  }
  
  Future<void> scheduleWeeklyNotification({id, title, body, time}) async {
  Time notificationTime = Time(time.hour, time.minute, 0);
  int weekday = time.weekday;

  await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
    id,
    title,
    body,
  Day.values[weekday - 1], // Use DayOfWeek from the package
    notificationTime,
    NotificationDetails(
      android: AndroidNotificationDetails(
        'your channel id',
        'your channel name',
        channelDescription: 'your channel description',
      ),
    ),
  );
}



 // Version 3 additon end here


  Future<void> scheduleNotifications({id, title, body, time}) async {
    try{
      await flutterLocalNotificationsPlugin.zonedSchedule(
          id,
          title,
          body,
          tz.TZDateTime.from(time, tz.local),
          const NotificationDetails(
              android: AndroidNotificationDetails(
                  'your channel id', 'your channel name',
                  channelDescription: 'your channel description')),
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime);
    }catch(e){
      print(e);
    }
  }
}