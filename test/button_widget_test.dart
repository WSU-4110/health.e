import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthe/common_widget/button_widget.dart';



void main() {
  testWidgets('ButtonWidget displays text and calls press callback when tapped',
      (WidgetTester tester) async {
    bool wasPressed = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ButtonWidget(
            text: 'Button',
            backGroundColor: Colors.blue,
            textColor: Colors.white,
            borderColor: Colors.blue,
            press: () {
              wasPressed = true;
            },
          ),
        ),
      ),
    );
    final buttonFinder = find.byType(InkWell);
    final buttonTextFinder = find.text('Button');
    expect(buttonFinder, findsOneWidget);
    expect(buttonTextFinder, findsOneWidget);
    expect(wasPressed, isFalse);
    await tester.tap(buttonFinder);
    await tester.pump();
    expect(wasPressed, isTrue);
  });
}