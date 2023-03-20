import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  get email => null;

  Future<User?> register(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      await _firestore.collection('users').doc(user?.uid).set({
        'email': user?.email,
        'uid': user?.uid,
        'username': 'user' + Random().nextInt(1000).toString()
      });
      return user;
    } catch (error) {
      throw error;
    }
  }

  Future<User?> login(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (error) {
      throw error;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<User?> getCurrentUser() async {
    try {
      User? user = _auth.currentUser;
      return user;
    } catch (error) {
      throw error;
    }
  }

  Future<void> updateUsername(String newUsername) async {
    try {
      User? user = _auth.currentUser;
      await _firestore.collection('users').doc(user?.uid).update({
        'username': newUsername,
      });
    } catch (error) {
      throw error;
    }
  }

  Future<void> updatePassword(String newPassword) async {
    try {
      User? user = _auth.currentUser;
      await user?.updatePassword(newPassword);
    } catch (error) {
      throw error;
    }
  }

  Future<void> deleteAccount(String password) async {
    try {
      User? user = _auth.currentUser;
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await user!.reauthenticateWithCredential(credential);
      await _firestore.collection('users').doc(user.uid).delete();
      await user.delete();
    } catch (error) {
      throw error;
    }
  }
}
