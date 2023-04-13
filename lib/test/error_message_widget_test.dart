import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common_widget/error_message_widget.dart';


void main() {
  group('ErrorMessageWidget', () {
    testWidgets('shows error message when checker is true', (WidgetTester tester) async {
      // Arrange
      final message = RxString('Error message');
      final checker = RxBool(true);
      final widget = MaterialApp(
        home: Scaffold(
          body: ErrorMessageWidget(
            message: message,
            checker: checker,
          ),
        ),
      );

      // Act
      await tester.pumpWidget(widget);

      // Assert
      expect(find.byType(ErrorMessageWidget), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);
      expect(find.text('Error message'), findsOneWidget);
      expect(find.text('Error message'), findsOneWidget);
      expect((tester.firstWidget(find.text('Error message')) as Text).style!.color, equals(Colors.red));
      expect((tester.firstWidget(find.text('Error message')) as Text).style!.fontSize, equals(12));
      expect((tester.firstWidget(find.text('Error message')) as Text).style!.fontWeight, equals(FontWeight.normal));
      expect((tester.firstWidget(find.text('Error message')) as Text).style!.fontStyle, equals(FontStyle.normal));
    });

    testWidgets('does not show error message when checker is false', (WidgetTester tester) async {
      // Arrange
      final message = RxString('Error message');
      final checker = RxBool(false);
      final widget = MaterialApp(
        home: Scaffold(
          body: ErrorMessageWidget(
            message: message,
            checker: checker,
          ),
        ),
      );

      // Act
      await tester.pumpWidget(widget);

      // Assert
      expect(find.byType(ErrorMessageWidget), findsOneWidget);
      expect(find.byType(Row), findsNothing);
      expect(find.byType(Icon), findsNothing);
      expect(find.text('Error message'), findsNothing);
    });
  });
}
