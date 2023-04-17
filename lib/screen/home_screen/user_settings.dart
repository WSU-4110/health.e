import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserSettings extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Settings'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _firebaseAuth.signOut();
            Navigator.pushReplacementNamed(context, '/login'); // navigate to login page
          },
          child: Text('Sign out'),
        ),
      ),
    );
  }
}
