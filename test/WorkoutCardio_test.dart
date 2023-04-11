import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthe/screen/Workouts/WorkoutCardio.dart';


void main() {
testWidgets("finds a text widget", (WidgetTester tester) async {
  await tester.pumpWidget(const MaterialApp(
    home: Scaffold(
      body: Text('cardio'),
    ),
  ));
expect(find.text('cardio'), findsOneWidget);
});

testWidgets("Making sure instance of Scroll works", (WidgetTester tester) async {
  const SingleChildScrollView = Padding(padding: EdgeInsets.zero);

  await tester.pumpWidget(Container(child: SingleChildScrollView,));

  expect(find.byWidget(SingleChildScrollView), findsOneWidget);
});

testWidgets("finds a specific text msg", (WidgetTester tester) async {

  await tester.pumpWidget(const MaterialApp(
    home: Scaffold(
      body: Text('Weekly Plan for Intermediates:'),
    ),
  ));
  expect(find.text('Weekly Plan for Intermediates:'), findsOneWidget);
});

}
