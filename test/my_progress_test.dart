import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthe/screen/notification/MyProgress.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:healthe/mtan_unittest/helper.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('MyProgress widget renders correctly', (WidgetTester tester) async {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized() as IntegrationTestWidgetsFlutterBinding;
      
  await tester.pumpWidget(MaterialApp(home: MyProgress()));

  expect(find.byType(MyProgress), findsOneWidget);
  expect(find.byType(NoteThumbnail), findsNWidgets(2));
  expect(find.byType(Switch), findsOneWidget);

  // Add this line to take a screenshot
  await takeScreenshot(tester, binding);

});


  testWidgets('Notification switch is visible and functional', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MyProgress()));

    final switchFinder = find.byType(Switch);
    expect(switchFinder, findsOneWidget);

    final switchWidget = tester.widget<Switch>(switchFinder);
    expect(switchWidget.value, false);

    await tester.tap(switchFinder);
    await tester.pumpAndSettle();

    final switchWidgetAfterTap = tester.widget<Switch>(switchFinder);
    expect(switchWidgetAfterTap.value, true);
        await takeScreenshot(tester, binding);

  });

  testWidgets('Frequency options are visible when required', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MyProgress()));

    final noteThumbnailFinder = find.byType(NoteThumbnail).first;
    final noteThumbnailWidget = tester.widget<NoteThumbnail>(noteThumbnailFinder);

    expect(noteThumbnailWidget.showFrequencySelection, true);
    await takeScreenshot(tester, binding);

  });

  testWidgets('"Add reminder" button is visible when required', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MyProgress()));

    final noteThumbnailFinder = find.byType(NoteThumbnail).last;
    final noteThumbnailWidget = tester.widget<NoteThumbnail>(noteThumbnailFinder);

    expect(noteThumbnailWidget.showAddReminderButton, true);
    await takeScreenshot(tester, binding);

  });

  testWidgets('Reminder frequency is stored and retrieved correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MyProgress()));

    final onceOptionFinder = find.text('Once');
    final dailyOptionFinder = find.text('Daily');

    expect(onceOptionFinder, findsOneWidget);
    expect(dailyOptionFinder, findsOneWidget);

    await tester.tap(dailyOptionFinder);
    await tester.pumpAndSettle();

    await tester.tap(onceOptionFinder);
    await tester.pumpAndSettle();
    await takeScreenshot(tester, binding);

  });


  testWidgets('Date and Time Picker Test', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    
    await tester.pumpWidget(MaterialApp(
      home: MyProgress(),
      ));

    // Check if the "Add reminder" button is present
    expect(find.text('Add reminder'), findsOneWidget);

    // Tap on the "Add reminder" button to open the date and time picker
    await tester.tap(find.text('Add reminder'));
    await tester.pumpAndSettle();

    // Check if the time picker dialog is displayed
    expect(find.byType(TimePickerDialog), findsOneWidget);
    await takeScreenshot(tester, binding);

    // Select a time from the time picker
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    // Verify that the time picker dialog is closed
    expect(find.byType(TimePickerDialog), findsNothing);

  });
}
