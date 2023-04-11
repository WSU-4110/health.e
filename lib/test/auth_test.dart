import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../database/auth.dart';

// Create a mock FirebaseAuth instance using Mockito.
class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUser extends Mock implements User {}

void main() {
  late Auth auth;
  late MockFirebaseAuth mockFirebaseAuth;
  // Initialize Firebase before running the tests.
setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    mockFirebaseAuth = MockFirebaseAuth();
    auth = Auth();
    // Replace the FirebaseAuth.instance with the mock instance.
    when(mockFirebaseAuth.authStateChanges()).thenAnswer((_) => Stream.empty());
    when(mockFirebaseAuth.signInWithEmailAndPassword(
      email: anyNamed('email') ?? 'example@test.com',
      password: anyNamed('password') ?? 'password123',
    )).thenAnswer((_) => Future.value());

    when(mockFirebaseAuth.createUserWithEmailAndPassword(
      email: anyNamed('email') ?? 'example@test.com',
      password: anyNamed('password') ?? 'password123',
    )).thenAnswer((_) => Future.value());
  });

  test(
      'signInwithEmailAndPassword should call signInWithEmailAndPassword on FirebaseAuth',
      () async {
    await auth.signInwithEmailAndPassword(
        email: 'test@example.com', password: 'password');
    verify(mockFirebaseAuth.signInWithEmailAndPassword(
        email: 'test@example.com', password: 'password'));
  });

  test(
      'updateUsername should update the display name of the current user on FirebaseAuth',
      () async {
    final currentUser = MockUser();
    when(mockFirebaseAuth.currentUser).thenReturn(currentUser);
    await auth.updateUsername('newUsername');
    verify(currentUser.updateDisplayName('newUsername'));
  });

  test(
      'createUserWithEmailAndPassword should call createUserWithEmailAndPassword on FirebaseAuth',
      () async {
    await auth.createUserWithEmailAndPassword(
        email: 'test@example.com', password: 'password');
    verify(mockFirebaseAuth.createUserWithEmailAndPassword(
        email: 'test@example.com', password: 'password'));
  });

  test('signOut should call signOut on FirebaseAuth', () async {
    await auth.signOut();
    verify(mockFirebaseAuth.signOut());
  });
}
