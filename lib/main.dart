import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healthe/database/auth_page.dart';
import 'package:healthe/firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  options: DefaultFirebaseOptions.currentPlatform;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
