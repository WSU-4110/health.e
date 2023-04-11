import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:easy_localization/easy_localization_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../database/user_data.dart';
import '../startup_screens/login_screen/login_screen.dart';
import 'progress.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';

class userSettings extends StatefulWidget {
  const userSettings({Key? key}) : super(key: key);

  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<userSettings> {
  final _auth = FirebaseAuth.instance;
  late User? _user;

  late TextEditingController usernameController;
  late TextEditingController bioController;
  late TextEditingController passwordController;
  bool? privateAccountSwitchValue;
  bool? notificationsSwitchValue;
  bool? darkModeSwitchValue;
  String? selectedLanguage;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    bioController = TextEditingController();
    _fetchUserData();
  }

  Future<void> _updateUserData() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update(UserData(
            username: usernameController.text,
            isPrivate: privateAccountSwitchValue!,
            receiveNotifications: notificationsSwitchValue!,
            isDarkModeEnabled: darkModeSwitchValue!,
            selectedLanguage: selectedLanguage!,
            bio: bioController.text,
            email: '',
            userId: '', // update the bio field
          ).toMap());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User data updated successfully'),
        ),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update user data'),
        ),
      );
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<UserData?> _fetchUserData() async {
    try {
      // get the current user
      final currentUser = FirebaseAuth.instance.currentUser;

      // get the user data from Firestore
      final userData = await UserRepository().fetchUserData(currentUser!.uid);

      // assign the user data properties to the corresponding state variables
      setState(() {
        usernameController.text = userData!.username;
        bioController.text = userData.bio!;
        privateAccountSwitchValue = userData.isPrivate!;
        notificationsSwitchValue = userData.receiveNotifications!;
        darkModeSwitchValue = userData.isDarkModeEnabled!;
        selectedLanguage = userData.selectedLanguage!;
      });

      return userData;
    } catch (error) {
      print('Error fetching user data: $error');
      rethrow;
    }
  }

  Future<bool> getDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('darkMode') ?? false;
  }

  bool _isNotificationsEnabled = true;
  bool _isAccountPrivate = true;
  bool _isDarkModeEnabled = false;

  void _toggleNotifications(bool value) async {
    setState(() {
      _isNotificationsEnabled = value;
    });
    // Update user's notification settings in database
    final currentUser = FirebaseAuth.instance.currentUser;
    final databaseReference = FirebaseDatabase.instance.ref();
    await databaseReference
        .child('users/${currentUser!.uid}/notification_settings')
        .set({
      'is_enabled': _isNotificationsEnabled,
    });
  }

  void _togglePrivateAccount(bool value) async {
    setState(() {
      _isAccountPrivate = value;
    });
    // Update user's account privacy settings in database
    final currentUser = FirebaseAuth.instance.currentUser;
    final databaseReference = FirebaseDatabase.instance.ref();
    await databaseReference
        .child('users/${currentUser!.uid}/privacy_settings')
        .set({
      'is_private': _isAccountPrivate,
    });
  }

  void _toggleDarkMode(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool darkMode = prefs.getBool('darkMode') ?? false;
    setState(() {
      darkMode = newValue;
    });
    await prefs.setBool('darkMode', darkMode);
  }

  Future<void> _changeUsername() async {
    final newUsername = usernameController.text.trim();
    if (newUsername.isNotEmpty) {
      try {
        await _user?.updateDisplayName(newUsername);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Username updated successfully.'),
            backgroundColor: Colors.green,
          ),
        );
        setState(() {
          usernameController.clear();
        });
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.toString()),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _changePassword() async {
    final newPassword = passwordController.text.trim();
    if (newPassword.isNotEmpty) {
      try {
        await _user?.updatePassword(newPassword);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password updated successfully.'),
            backgroundColor: Colors.green,
          ),
        );
        setState(() {
          passwordController.clear();
        });
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.toString()),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _deleteAccount() async {
    User? user = FirebaseAuth.instance.currentUser;
    await user!.delete();
    await FirebaseAuth.instance.signOut();
    // Navigate to login screen after signout
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchUserData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          final userData = snapshot.data as UserData;
          return Text(userData.username);
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('User Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Account Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'New Username',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'New Password',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _changeUsername(),
              child: Text('Change Username'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _changePassword(),
              child: Text('Change Password'),
            ),
            SizedBox(height: 20),
            Text(
              'Privacy Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SwitchListTile(
              title: Text('Private Account'),
              value: privateAccountSwitchValue!,
              onChanged: (value) async {
                _togglePrivateAccount(value);
                setState(() {
                  privateAccountSwitchValue = value;
                });
              },
            ),
            SizedBox(height: 10),
            SwitchListTile(
              title: Text('Notifications'),
              value: notificationsSwitchValue!,
              onChanged: (value) async {
                _toggleNotifications(value);
                setState(() {
                  notificationsSwitchValue = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Appearance Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SwitchListTile(
              title: Text('Dark Mode'),
              value: darkModeSwitchValue!,
              onChanged: (value) async {
                _toggleDarkMode(value);
                setState(() {
                  darkModeSwitchValue = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Language Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedLanguage,
              onChanged: (value) => selectedLanguage!,
              items: ['English', 'Spanish', 'French']
                  .map((language) => DropdownMenuItem(
                        value: language,
                        child: Text(language),
                      ))
                  .toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _deleteAccount(),
              child: Text('Delete Account'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
