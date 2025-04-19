import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/data/models/tech_stack_item.dart';

void main() {
  group('TechStackItem', () {
    test('can be instantiated with FontAwesome icon', () {
      const item = TechStackItem(
        name: 'Flutter',
        color: Colors.blue,
        icon: Icons.flutter_dash,
      );

      expect(item.name, equals('Flutter'));
      expect(item.color, equals(Colors.blue));
      expect(item.icon, equals(Icons.flutter_dash));
      expect(item.iconType, equals(IconType.fontAwesome));
      expect(item.svgName, isNull);
    });

    test('can be instantiated with SVG icon', () {
      const item = TechStackItem(
        name: 'Flutter',
        color: Colors.blue,
        svgName: 'flutter',
        iconType: IconType.svg,
      );

      expect(item.name, equals('Flutter'));
      expect(item.color, equals(Colors.blue));
      expect(item.icon, isNull);
      expect(item.iconType, equals(IconType.svg));
      expect(item.svgName, equals('flutter'));
    });

    test('throws assertion error when FontAwesome icon is missing', () {
      expect(
        () => TechStackItem(
          name: 'Flutter',
          color: Colors.blue,
        ),
        throwsAssertionError,
      );
    });

    test('throws assertion error when SVG name is missing', () {
      expect(
        () => TechStackItem(
          name: 'Flutter',
          color: Colors.blue,
          iconType: IconType.svg,
        ),
        throwsAssertionError,
      );
    });

    test('IconType enum has correct values', () {
      expect(IconType.values.length, equals(2));
      expect(IconType.fontAwesome.index, equals(0));
      expect(IconType.svg.index, equals(1));
    });
  });
}
