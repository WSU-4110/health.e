import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../database/auth.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized(); // add this line
  setUpAll(() async {
    await Firebase.initializeApp();
  });

  test('auth test', () async {
    Auth auth = Auth();

    // test sign in
    await auth.signInwithEmailAndPassword(
        email: 'test@example.com', password: 'password');

    expect(auth.currentUser, isNotNull);

    // test update username
    await auth.updateUsername('newUsername');

    expect(auth.currentUser!.displayName, equals('newUsername'));

    // test sign out
    await auth.signOut();

    expect(auth.currentUser, isNull);
  });
}