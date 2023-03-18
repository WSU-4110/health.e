import 'package:flutter/material.dart';
import 'package:healthe/screen/home_screen/user_settings.dart';
import 'package:healthe/screen/home_screen/workouts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthe/auth.dart';
import 'MainPage.dart';
import 'progress.dart';

class HomeScreen extends StatefulWidget {
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

  late final List pages = [
    const MainPage(),
    const Workouts(),
    const Progress(),
    const userSettings(),
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
        title: _title(),
      ),
      body:
      
      
       
      pages[currentIndex],
      
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
          const BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          const BottomNavigationBarItem(
              label: "Workouts", icon: Icon(Icons.fitness_center)),
          const BottomNavigationBarItem(
              label: "Progress", icon: Icon(Icons.bar_chart)),
          const BottomNavigationBarItem(
              label: "Profile", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
