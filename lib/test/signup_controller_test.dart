import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthe/database/signup_controller.dart';

void main() {
  group('SignUpController', () {
    late SignUpController controller;

    setUp(() {
      controller = SignUpController();
    });

    test('registerUser should set email and password', () {
      const email = 'test@example.com';
      const password = 'password';
      const fullName = 'fullName';
      controller.registerUser(email, password, fullName);

      expect(controller.email.text, equals(email));
      expect(controller.password.text, equals(password));
    });

    test('registerUser should set fullName', () {
      const fullName = 'fullname';

      controller.registerUser('test@example.com', 'password', 'fullName');

      expect(controller.fullName.text, equals(fullName));
    });

    tearDown(() {
      controller.dispose();
    });
  });
}
