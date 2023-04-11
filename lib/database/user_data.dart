import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String userId;
  final String username;
  final String email;
  final bool isPrivate;
  final bool receiveNotifications;
  final bool isDarkModeEnabled;
  final String selectedLanguage;
  String? bio;

  UserData({
    required this.username,
     required this.userId,
    required this.email,
    required this.isPrivate,
    required this.receiveNotifications,
    required this.isDarkModeEnabled,
    required this.selectedLanguage,
    required this.bio
  });
  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      userId: map['id'],
      username: map['username'],
      isPrivate: map['isPrivate'],
      receiveNotifications: map['receiveNotifications'],
      isDarkModeEnabled: map['darkModeEnabled'],
      selectedLanguage: map['selectedLanguage'],
       email: map['email'],
       bio: map['bio']
    );
  }



  static UserData fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return UserData(
      userId: snapshot.id,
      username: data['username'] ?? '',
      isPrivate: data['isPrivate'] ?? false,
      receiveNotifications: data['receiveNotifications'] ?? true,
      isDarkModeEnabled: data['isDarkModeEnabled'] ?? false,
      selectedLanguage: data['language'] ?? 'en', email: data['email'], 
      bio: data['bio'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'isPrivate': isPrivate,
      'receiveNotifications': receiveNotifications,
      'isDarkModeEnabled': isDarkModeEnabled,
      'selectedLanguage': selectedLanguage,
    };
  }
}
class Users {
  final String uid;
  final String email;

  Users({required this.uid, required this.email});
}

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Returns the current user if signed in, otherwise returns null
  Users? getCurrentUser() {
    final user = _auth.currentUser;
    if (user == null) {
      return null;
    } else {
      return Users(uid: user.uid, email: '');
    }
  }

  // Updates the username for the currently signed in user
  Future<void> updateUsername(String newUsername) async {
    final user = _auth.currentUser;
    if (user != null) {
      final uid = user.uid;
      final docRef = _db.collection('users').doc(uid);
      await docRef.update({'username': newUsername});
    }
  }

  // Updates the password for the currently signed in user
  Future<void> updatePassword(String newPassword) async {
    final user = _auth.currentUser;
    if (user != null) {
      await user.updatePassword(newPassword);
    }
  }

  // Deletes the account for the currently signed in user
  Future<void> deleteAccount() async {
    final user = _auth.currentUser;
    if (user != null) {
      final uid = user.uid;
      final docRef = _db.collection('users').doc(uid);
      await docRef.delete();
      await user.delete();
    }
  }

  // Fetches the UserData object for the currently signed in user
  Future<UserData?> fetchUserData(String uid) async {
    final user = _auth.currentUser;
    if (user != null) {
      final uid = user.uid;
      final docSnapshot = await _db.collection('users').doc(uid).get();
      if (docSnapshot.exists) {
        final userData = docSnapshot.data() as Map<String, dynamic>;
        return UserData.fromMap(userData);
      }
    }
    return null;
  }

  // Updates the UserData object for the currently signed in user
  Future<void> updateUserData(UserData userData) async {
    final user = _auth.currentUser;
    if (user != null) {
      final uid = user.uid;
      final docRef = _db.collection('users').doc(uid);
      await docRef.set(userData.toMap(), SetOptions(merge: true));
    }
  }
}
