import '../lib/Calculator/CalculatorClass.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CalculatorClass', () {
    CalculatorClass? calculator;

    setUp(() {
      calculator = CalculatorClass(180, 70, 24, true);
    });

    tearDown(() {
      calculator = null;
    });

    test('TDEE should not be null', () {
      expect(calculator?.TDEE, isNotNull);
    });

    test('getSex should return the correct value', () {
      expect(calculator?.getSex(), equals(true));
    });

    test('getAge should return the correct value', () {
      expect(calculator?.getAge(), equals(24));
    });

    test('getHeight should return the correct value', () {
      expect(calculator?.getHeight(), equals(70));
    });

    test('getWeight should return the correct value', () {
      expect(calculator?.getWeight(), equals(180));
    });

    test('getTDEE should return an integer', () {
      expect(calculator?.getTDEE(), isA<int>);
    });
  });
}
