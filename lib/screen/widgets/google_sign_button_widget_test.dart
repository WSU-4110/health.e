import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthe/provider/google_sign_in.dart';

import 'package:mockito/mockito.dart';

import 'google_signup_button_widget.dart';

class MockGoogleSignInProvider extends Mock implements GoogleSignInProvider {}

void main() {
  group('GoogleSignupButtonWidget', () {
    testWidgets('should call login method when pressed', (tester) async {
      final mockProvider = MockGoogleSignInProvider();
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: GoogleSignupButtonWidget(),
        ),
      ));
      final buttonFinder = find.widgetWithText(OutlinedButton, 'Sign In With Google');
      expect(buttonFinder, findsOneWidget);
      await tester.tap(buttonFinder);
      verify(mockProvider.login()).called(1);
    });
  });
}
