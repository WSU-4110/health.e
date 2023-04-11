import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mockito/mockito.dart';

import '../screen/widgets/error_message_widget.dart';


class MockRxString extends Mock implements RxString {}
class MockRxBool extends Mock implements RxBool {}

void main() {
  void main() {
  testWidgets('ErrorMessageWidget displays message when checker is true',
      (WidgetTester tester) async {
    final message = 'Test error message';
    final checker = true.obs;
    await tester.pumpWidget(
      GetMaterialApp(
        home: ErrorMessageWidget(
          message: message.obs,
          checker: checker,
        ),
      ),
    );

    expect(find.text(message), findsOneWidget);
    expect(find.byIcon(Icons.error), findsOneWidget);
    expect(find.text('error'), findsOneWidget);
  });

  testWidgets('ErrorMessageWidget does not display message when checker is false',
      (WidgetTester tester) async {
    final message = 'Test error message';
    final checker = false.obs;
    await tester.pumpWidget(
      GetMaterialApp(
        home: ErrorMessageWidget(
          message: message.obs,
          checker: checker,
        ),
      ),
    );

    expect(find.text(message), findsNothing);
    expect(find.byIcon(Icons.error), findsNothing);
    expect(find.text('error'), findsNothing);
  });
}




}
