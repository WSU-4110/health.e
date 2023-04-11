import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthe/provider/google_sign_in.dart';
import 'package:healthe/screen/widgets/google_signup_button_widget.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockGoogleSignInProvider extends Mock implements GoogleSignInProvider {}

void main() {
  late GoogleSignInProvider mockGoogleSignInProvider;

  setUp(() {
    mockGoogleSignInProvider = MockGoogleSignInProvider();
  });

  testWidgets('GoogleSignupButtonWidget should call login method on button press',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChangeNotifierProvider.value(
            value: mockGoogleSignInProvider,
            child: GoogleSignupButtonWidget(),
          ),
        ),
      ),
    );

    final buttonFinder = find.byType(OutlinedButton);

    expect(buttonFinder, findsOneWidget);

    await tester.tap(buttonFinder);
    verify(mockGoogleSignInProvider.login()).called(1);
  });
}
