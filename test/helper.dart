import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart' show kIsWeb;

int screenshotCounter = 0;
takeScreenshot(tester, binding) async {
  if (kIsWeb) {
    await binding.takeScreenshot('test-screenshot');
    return;
  } else if (Platform.isAndroid) {
    await binding.convertFlutterSurfaceToImage();
    await tester.pumpAndSettle();
  }
  await binding.takeScreenshot('test-screenshot-${screenshotCounter++}');
}
