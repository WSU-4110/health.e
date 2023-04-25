import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthe/database/signup_controller.dart';



void main() {
  setUp(() {
    Get.put(SignUpController());
  });

  tearDown(() {
    Get.reset();
  });

  test('registerUser sets email, password, and fullName', () {
    final controller = Get.find<SignUpController>();
    controller.email.text = 'test@example.com';
    controller.password.text = 'password'; // Set the password field
    controller.fullName.text = 'Test User';

    controller.registerUser(
        controller.email.text, controller.password.text, controller.fullName.text);

    expect(controller.email.text, 'test@example.com');
    expect(controller.password.text, 'password');
    expect(controller.fullName.text, 'Test User');
  });
}