import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'NotificationService.dart';
import 'MyProgress.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init(); //version#2
  await NotificationService().requestIOSPermissions(); //version#2
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mtan Fitness App Demo",
      home: MyProgress(),
    );
  }
}
