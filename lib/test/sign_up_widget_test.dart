import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthe/screen/widgets/sign_up_widget.dart';

import '../screen/widgets/google_signup_button_widget.dart';

void main() {
  group('SignUpWidget', () {
    testWidgets('displays welcome message', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SignUpWidget()));

      final welcomeMessageFinder = find.text('Welcome Back To HealthE');

      expect(welcomeMessageFinder, findsOneWidget);
    });

    testWidgets('displays login message', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SignUpWidget()));

      final loginMessageFinder = find.text('Login to continue');

      expect(loginMessageFinder, findsOneWidget);
    });

    testWidgets('contains GoogleSignUpButtonWidget', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SignUpWidget()));

      final googleSignUpButtonFinder = find.byType(GoogleSignupButtonWidget);

      expect(googleSignUpButtonFinder, findsOneWidget);
    });
  });
}
