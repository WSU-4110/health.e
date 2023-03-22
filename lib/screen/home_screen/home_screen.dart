
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:healthe/screen/home_screen/user_settings.dart';
import 'package:healthe/screen/home_screen/workouts.dart';
import 'package:healthe/value/color.dart';
import 'package:healthe/widgets/Calendar.dart';

import 'MainPage.dart';
import 'progress.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<IconData> icons =
  [
    Icons.home,
    Icons.fitness_center,
    Icons.bar_chart,
    Icons.person,
  ];

  List pages =
  [
    const MainPage(),
    const Workouts(),
    const Calendar(),
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
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: gradientColors_1,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(label:"Home" , icon: Icon(Icons.home)),
            BottomNavigationBarItem(label:"Workouts" , icon: Icon(Icons.fitness_center)),
            BottomNavigationBarItem(label:"Progress" , icon: Icon(Icons.bar_chart)),
            BottomNavigationBarItem(label:"Profile" , icon: Icon(Icons.person)),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: gradientColors_1,
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,

        ),
      ),


    );
  }
}

