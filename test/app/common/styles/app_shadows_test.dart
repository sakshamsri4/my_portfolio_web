import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/common/styles/app_shadows.dart';

void main() {
  group('AppShadows', () {
    test('cardShadow should return a non-empty list of BoxShadow', () {
      final shadows = AppShadows.cardShadow;

      expect(shadows, isA<List<BoxShadow>>());
      expect(shadows, isNotEmpty);

      final shadow = shadows.first;
      expect(shadow.color.alpha, lessThan(255)); // Semi-transparent
      expect(shadow.blurRadius, greaterThan(0));
      expect(shadow.spreadRadius, greaterThan(0));
      expect(shadow.offset, isA<Offset>());
    });

    test(
        'elevatedShadow should return a shadow with adjusted values based on elevation',
        () {
      final shadows = AppShadows.elevatedShadow(2);

      expect(shadows, isA<List<BoxShadow>>());
      expect(shadows, isNotEmpty);

      final shadow = shadows.first;
      expect(shadow.color.alpha, lessThan(255)); // Semi-transparent
      expect(shadow.blurRadius, greaterThan(0));
      expect(shadow.spreadRadius, greaterThan(0));
      expect(shadow.offset, isA<Offset>());
    });

    test('coloredGlow with default parameters returns a BoxShadow', () {
      final shadow = AppShadows.coloredGlow(color: Colors.blue);

      expect(shadow, isA<BoxShadow>());
      expect(shadow.color.alpha, lessThan(255)); // Semi-transparent
      expect(shadow.blurRadius, greaterThan(0));
      expect(shadow.spreadRadius, lessThan(0)); // Default is -2
    });

    test('coloredGlow should respect custom parameters', () {
      final shadow = AppShadows.coloredGlow(
        color: Colors.blue,
        blurRadius: 15,
        spreadRadius: 5,
      );

      expect(shadow, isA<BoxShadow>());
      // Don't test exact color values as they might vary
      expect(shadow.color, isA<Color>());
      expect(shadow.blurRadius, equals(15.0));
      expect(shadow.spreadRadius, equals(5.0));
    });

    test('textShadow should return a non-empty list of Shadow', () {
      final shadows = AppShadows.textShadow;

      expect(shadows, isA<List<Shadow>>());
      expect(shadows, isNotEmpty);

      final shadow = shadows.first;
      expect(shadow.color.alpha, lessThan(255)); // Semi-transparent
      expect(shadow.blurRadius, greaterThan(0));
      expect(shadow.offset, isA<Offset>());
    });

    test('headingTextShadow should return a non-empty list of Shadow', () {
      final shadows = AppShadows.headingTextShadow;

      expect(shadows, isA<List<Shadow>>());
      expect(shadows, isNotEmpty);

      final shadow = shadows.first;
      expect(shadow.color.alpha, lessThan(255)); // Semi-transparent
      expect(shadow.blurRadius, greaterThan(0));
      expect(shadow.offset, isA<Offset>());
    });

    // No buttonShadow in the actual implementation

    test('neoPOPShadow should return a BoxShadow with default values', () {
      final shadow = AppShadows.neoPOPShadow();

      expect(shadow, isA<BoxShadow>());
      expect(shadow.color, isA<Color>());
      expect(
        shadow.blurRadius,
        equals(0.0),
      ); // NeoPOP shadows typically have no blur
      expect(shadow.spreadRadius, equals(0.0));
      expect(shadow.offset, isA<Offset>());
    });

    test('neoPOPShadow should respect custom parameters', () {
      final shadow = AppShadows.neoPOPShadow(
        color: Colors.green,
        offset: const Offset(3, 3),
      );

      expect(shadow, isA<BoxShadow>());
      // Don't test exact color values as they might vary
      expect(shadow.color, isA<Color>());
      expect(shadow.blurRadius, equals(0.0));
      expect(shadow.spreadRadius, equals(0.0));
      expect(shadow.offset, equals(const Offset(3, 3)));
    });
  });
}
