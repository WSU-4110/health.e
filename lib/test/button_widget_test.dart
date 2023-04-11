import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthe/common_widget/button_widget.dart';

void main() {
  group('ButtonWidget', () {
    testWidgets('should display text', (WidgetTester tester) async {
      // Create a widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ButtonWidget(
              text: 'Test Button',
              backGroundColor: Colors.blue,
              textColor: Colors.white,
              borderColor: Colors.grey,
              press: () {},
            ),
          ),
        ),
      );

      // Find the text widget
      final textWidget = find.text('Test Button');

      // Expect the widget to be found
      expect(textWidget, findsOneWidget);
    });

    testWidgets('should execute callback on tap', (WidgetTester tester) async {
      // Define a boolean flag to track if the callback is called
      var isCallbackCalled = false;

      // Create a widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ButtonWidget(
              text: 'Test Button',
              backGroundColor: Colors.blue,
              textColor: Colors.white,
              borderColor: Colors.grey,
              press: () {
                isCallbackCalled = true;
              },
            ),
          ),
        ),
      );

      // Find the button widget
      final buttonWidget = find.byType(ButtonWidget);

      // Tap the button widget
      await tester.tap(buttonWidget);

      // Expect the callback to be called
      expect(isCallbackCalled, isTrue);
    });
  });
}
