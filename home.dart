import 'package:flutter/material.dart';
import 'package:health_e/pages/main_page.dart';
import 'package:health_e/pages/progress.dart';
import 'package:health_e/pages/user_settings.dart';
import 'package:health_e/pages/workouts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List pages =
  [
    MainPage(),
    Workouts(),
    Progress(),
    userSettings()
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
          BottomNavigationBarItem(label:"Home" , icon: Icon(Icons.home)),
          BottomNavigationBarItem(label:"Workouts" , icon: Icon(Icons.fitness_center)),
          BottomNavigationBarItem(label:"Progress" , icon: Icon(Icons.bar_chart)),
          BottomNavigationBarItem(label:"Profile" , icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
