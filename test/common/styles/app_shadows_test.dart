import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/common/styles/app_shadows.dart';

void main() {
  group('AppShadows', () {
    test('cardShadow should return a non-empty list of BoxShadow', () {
      final shadows = AppShadows.cardShadow;
      expect(shadows, isA<List<BoxShadow>>());
      expect(shadows, isNotEmpty);
      expect(shadows.length, equals(1));

      final shadow = shadows.first;
      expect(shadow.color, equals(const Color.fromARGB(76, 0, 0, 0)));
      expect(shadow.blurRadius, equals(8));
      expect(shadow.spreadRadius, equals(2));
      expect(shadow.offset, equals(const Offset(0, 4)));
    });

    test(
        'elevatedShadow should return a shadow with adjusted values based on elevation',
        () {
      const elevation = 2.0;
      final shadows = AppShadows.elevatedShadow(elevation);

      expect(shadows, isA<List<BoxShadow>>());
      expect(shadows, isNotEmpty);
      expect(shadows.length, equals(1));

      final shadow = shadows.first;
      expect(shadow.color, equals(const Color.fromARGB(76, 0, 0, 0)));
      expect(shadow.blurRadius, equals(8 + (elevation * 2)));
      expect(shadow.spreadRadius, equals(2 + elevation));
      expect(shadow.offset, equals(const Offset(0, 4 + elevation)));
    });

    test(
        'coloredGlow should return a BoxShadow with the specified color and properties',
        () {
      const color = Colors.blue;
      final shadow = AppShadows.coloredGlow(color: color);

      expect(shadow, isA<BoxShadow>());
      expect(
        shadow.color.value,
        equals(color.withAlpha((0.2 * 255).round()).value),
      );
      expect(shadow.blurRadius, equals(12));
      expect(shadow.spreadRadius, equals(-2));
      expect(shadow.offset, equals(const Offset(0, 2)));
    });

    test('coloredGlow should respect custom parameters', () {
      const color = Colors.red;
      const opacity = 0.5;
      const blurRadius = 20.0;
      const spreadRadius = 5.0;
      const offset = Offset(3, 3);

      final shadow = AppShadows.coloredGlow(
        color: color,
        opacity: opacity,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
        offset: offset,
      );

      expect(shadow, isA<BoxShadow>());
      expect(
        shadow.color.value,
        equals(color.withAlpha((opacity * 255).round()).value),
      );
      expect(shadow.blurRadius, equals(blurRadius));
      expect(shadow.spreadRadius, equals(spreadRadius));
      expect(shadow.offset, equals(offset));
    });

    test('textShadow should return a non-empty list of Shadow', () {
      final shadows = AppShadows.textShadow;

      expect(shadows, isA<List<Shadow>>());
      expect(shadows, isNotEmpty);
      expect(shadows.length, equals(1));

      final shadow = shadows.first;
      expect(shadow.color, equals(const Color.fromARGB(200, 0, 0, 0)));
      expect(shadow.blurRadius, equals(3));
      expect(shadow.offset, equals(const Offset(0, 1)));
    });

    test('headingTextShadow should return a non-empty list of Shadow', () {
      final shadows = AppShadows.headingTextShadow;

      expect(shadows, isA<List<Shadow>>());
      expect(shadows, isNotEmpty);
      expect(shadows.length, equals(1));

      final shadow = shadows.first;
      expect(shadow.color, equals(const Color.fromARGB(200, 0, 0, 0)));
      expect(shadow.blurRadius, equals(4));
      expect(shadow.offset, equals(const Offset(0, 1)));
    });

    test('neoPOPShadow should return a BoxShadow with default values', () {
      final shadow = AppShadows.neoPOPShadow();

      expect(shadow, isA<BoxShadow>());
      expect(shadow.color, equals(Colors.black));
      expect(shadow.offset, equals(const Offset(4, 4)));
      expect(shadow.blurRadius, equals(0));
      expect(shadow.spreadRadius, equals(0));
    });

    test('neoPOPShadow should respect custom parameters', () {
      const color = Colors.green;
      const offset = Offset(6, 6);

      final shadow = AppShadows.neoPOPShadow(
        color: color,
        offset: offset,
      );

      expect(shadow, isA<BoxShadow>());
      expect(shadow.color, equals(color));
      expect(shadow.offset, equals(offset));
    });
  });
}
