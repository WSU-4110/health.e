import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserSettings extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> _deleteAccount(BuildContext context) async {
    bool deleteConfirmed = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Are you sure?"),
          content: Text("This action will permanently delete your account."),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text("Delete"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
    if (deleteConfirmed == true) {
      try {
        await _firebaseAuth.currentUser!.delete();
        Navigator.pushReplacementNamed(context, '/login');
      } catch (e) {
        // Handle any errors here
        print('Error deleting account: $e');
      }
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
                await _deleteAccount(context);
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
