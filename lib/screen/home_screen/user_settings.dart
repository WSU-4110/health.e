import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserSettings extends StatelessWidget {
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

Future<void> _deleteAccount() async {
try {
await _firebaseAuth.currentUser!.delete();
} catch (e) {
// Handle any errors here
print('Error deleting account: $e');
}
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('User Settings'),
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
ElevatedButton(
onPressed: () async {
await _deleteAccount();
Navigator.pushReplacementNamed(context, '/login');
},
child: Text('Delete Account'),
),
SizedBox(height: 16),
ElevatedButton(
onPressed: () async {
await _firebaseAuth.signOut();
Navigator.pushReplacementNamed(context, '/login');
},
child: Text('Sign out'),
),
],
),
),
);
}
}