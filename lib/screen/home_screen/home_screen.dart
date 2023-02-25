
import 'package:flutter/material.dart';
import 'package:healthe/screen/home_screen/user_settings.dart';
import 'package:healthe/screen/home_screen/workouts.dart';

import 'MainPage.dart';
import 'progress.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List pages =
  [
    const MainPage(),
    const Workouts(),
    const Progress(),
    const userSettings()
  ];
  int currentIndex = 0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          const BottomNavigationBarItem(label:"Home" , icon: Icon(Icons.home)),
          const BottomNavigationBarItem(label:"Workouts" , icon: Icon(Icons.fitness_center)),
          const BottomNavigationBarItem(label:"Progress" , icon: Icon(Icons.bar_chart)),
          const BottomNavigationBarItem(label:"Profile" , icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}

