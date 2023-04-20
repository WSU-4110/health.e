import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healthe/screen/home_screen/MainPage.dart';
import 'package:healthe/screen/home_screen/home_screen.dart';
import 'package:healthe/screen/startup_screens/login_screen/login_screen.dart';
import 'package:healthe/screen/startup_screens/sign_up/sign_up_screen.dart';
import 'database/auth.dart';
import 'package:healthe/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        '/login': (context) => LoginScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        //check if user is already logged in
        stream: Auth().firebaseAuth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return  HomeScreen();
          }
          return const SignUpScreen();
        },
      ),
    );
  }
}