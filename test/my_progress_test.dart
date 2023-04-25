import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthe/screen/notification/MyProgress.dart'; // Import your MyProgress.dart file here
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  group('MyProgress Widget', () {
    testWidgets('Renders correctly with proper elements',
            (WidgetTester tester) async {
          await tester.pumpWidget(MaterialApp(home: MyProgress()));
          expect(find.text('Notification Settings'), findsOneWidget);
          expect(find.byType(Switch), findsOneWidget);
          expect(find.byType(NoteThumbnail), findsNWidgets(2));
        });

    testWidgets('Switch toggles notifications state',
            (WidgetTester tester) async {
          await tester.pumpWidget(MaterialApp(home: MyProgress()));
          Switch switchWidget = tester.widget(find.byType(Switch));
          expect(switchWidget.value, false);
          await tester.tap(find.byType(Switch));
          await tester.pump();
          switchWidget = tester.widget(find.byType(Switch));
          expect(switchWidget.value, true);
        });
  });

  group('NoteThumbnail Widget', () {
    testWidgets('Renders correctly with proper elements',
            (WidgetTester tester) async {
          await tester.pumpWidget(MaterialApp(
            home: Scaffold(
              body: NoteThumbnail(
                id: '1',
                color: Colors.white,
                title: 'Test Note',
                content: 'Test Content',
                switchValue: false,
              ),
            ),
          ));

          expect(find.text('Test Note'), findsOneWidget);
          expect(find.text('Test Content'), findsOneWidget);
          expect(find.byType(ElevatedButton), findsOneWidget);
        });

    testWidgets('Does not show "Add reminder" button when specified',
            (WidgetTester tester) async {
          await tester.pumpWidget(MaterialApp(
            home: Scaffold(
              body: NoteThumbnail(
                id: '1',
                color: Colors.white,
                title: 'Test Note',
                content: 'Test Content',
                switchValue: false,
                showAddReminderButton: false,
              ),
            ),
          ));

          expect(find.byType(ElevatedButton), findsNothing);
        });
  });


  testWidgets('Clicking "Add reminder" button shows time picker dialog',
          (WidgetTester tester) async {
        // Create a test app with localization delegates
        Widget testApp = MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', 'US'),
          ],
          home: MyProgress(),
        );

        await tester.pumpWidget(testApp);

        // Find the "Add reminder" button
        Finder addReminderButtonFinder =
        find.widgetWithText(ElevatedButton, "Add reminder");

        // Expect that the button exists
        expect(addReminderButtonFinder, findsOneWidget);

        // Tap the "Add reminder" button
        await tester.tap(addReminderButtonFinder);
        await tester.pumpAndSettle();

        // Verify that the time picker dialog is displayed
        expect(find.byType(Dialog), findsOneWidget);
      });



  testWidgets('Reminder frequency radio buttons can be selected and deselected', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: NoteThumbnail(
          id: '1',
          color: Colors.white,
          title: 'Test Note',
          content: 'Test Content',
          switchValue: false,
          showFrequencySelection: true,
        ),
      ),
    ));

    // Find the Radio widgets directly
    Finder radioSingle = find.byWidgetPredicate((widget) => widget is Radio<ReminderFrequency> && widget.value == ReminderFrequency.Once);
    Finder radioDaily = find.byWidgetPredicate((widget) => widget is Radio<ReminderFrequency> && widget.value == ReminderFrequency.Daily);
    Finder radioWeekly = find.byWidgetPredicate((widget) => widget is Radio<ReminderFrequency> && widget.value == ReminderFrequency.Weekly);

    // Tap on the radio buttons
    await tester.tap(radioSingle);
    await tester.pump();

    await tester.tap(radioDaily);
    await tester.pump();

    await tester.tap(radioWeekly);
    await tester.pump();
  });

}