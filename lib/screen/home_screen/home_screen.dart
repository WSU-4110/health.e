import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/screen/home_screen/user_settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthe/database/auth.dart';
import 'package:healthe/screen/notification/MyProgress.dart';
import 'package:healthe/value/color.dart';
import 'package:healthe/screen/Workouts/WorkoutMain.dart';

import 'MainPage.dart';
import 'notification_page.dart';
import 'progress.dart';

class HomeScreen extends StatefulWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Firebase Auth');
  }

  Widget _userid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  List<IconData> icon = [
    Icons.home,
    Icons.fitness_center,
    Icons.bar_chart,
    Icons.person
  ];

  late final List pages = [
    const MainPage(),
    WorkoutPage(),
    const Progress(),
    UserSettings(),
    Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _userid(),
          _signOutButton(),
        ],
      ),
    ),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Health.",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: blackColors),
              ),
              Text(
                "E",
                style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: whiteColors),
              )
            ],
          ),
          backgroundColor: gradientColors_1,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20.0))),
          shadowColor: Colors.black,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const MyProgress()), // PLACEHOLDER for MINGRAN
                );
              },
            ),
          ],
        ),
        body: pages[currentIndex],
        bottomNavigationBar: Theme(
            data: ThemeData(
              splashColor: Colors.black,
              highlightColor: Colors.black,
              canvasColor: gradientColors_1,
              primaryColor: gradientColors_1, // Set your desired color here
            ),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(45),
                    topLeft: Radius.circular(45)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                ],
              ),
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.transparent,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.white,
                    currentIndex: currentIndex,
                    onTap: onTap,
                    items: const [
                      BottomNavigationBarItem(
                          label: "Home", icon: Icon(Icons.home)),
                      BottomNavigationBarItem(
                          label: "Workouts", icon: Icon(Icons.fitness_center)),
                      BottomNavigationBarItem(
                          label: "Progress", icon: Icon(Icons.bar_chart)),
                      BottomNavigationBarItem(
                          label: "Profile", icon: Icon(Icons.person)),
                    ],
                  )),
            )));
  }
}
