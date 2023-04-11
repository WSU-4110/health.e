import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthe/screen/home_screen/home_screen.dart';
import 'package:healthe/screen/startup_screens/login_screen/login_screen.dart';
import 'package:healthe/screen/startup_screens/splash_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user logged in
          if (snapshot.hasData) {
            return HomeScreen();
          }
          //user is not logged in
          else {
            return const SplashScreen();
          }
        },
      ),
    );
  }
}
