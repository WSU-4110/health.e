import 'package:flutter/material.dart';
import 'package:healthe/value/color.dart';

class Notification_e extends StatelessWidget {
  const Notification_e({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: gradientColors_1,
        title: const Text("Notifications")
      ),
    );
  }
}
