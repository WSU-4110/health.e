import 'package:healthe/database/auth.dart';
import 'package:healthe/screen/home_screen/home_screen.dart';
import 'package:healthe/screen/startup_screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return  LoginScreen();
        }
      },
    );
  }
}