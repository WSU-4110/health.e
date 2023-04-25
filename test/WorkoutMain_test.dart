import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthe/screen/Workouts/WorkoutSwim.dart';


void main() {
  testWidgets("finds a button with text widget", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Text('Swim'),
      ),
    ));
    expect(find.text('Swim'), findsOneWidget);
  });

  testWidgets("Finding specific text in workoutmain", (WidgetTester tester) async {

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Text('Fitness Programs:'),
      ),
    ));
    expect(find.text('Fitness Programs:'), findsOneWidget);
  });

  testWidgets("Making sure elevated-button works", (WidgetTester tester) async {
    const ElevatedButton = Padding(padding: EdgeInsets.zero);

    await tester.pumpWidget(Container(child: ElevatedButton,));

    expect(find.byWidget(ElevatedButton), findsOneWidget);
  });

}