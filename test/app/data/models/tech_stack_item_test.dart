import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_web/app/data/models/tech_stack_item.dart';

void main() {
  group('TechStackItem', () {
    group('Constructor', () {
      test('should create TechStackItem with FontAwesome icon', () {
        const item = TechStackItem(
          name: 'Flutter',
          color: Colors.blue,
          icon: FontAwesomeIcons.flutter,
          iconType: IconType.fontAwesome,
        );

        expect(item.name, equals('Flutter'));
        expect(item.color, equals(Colors.blue));
        expect(item.icon, equals(FontAwesomeIcons.flutter));
        expect(item.iconType, equals(IconType.fontAwesome));
        expect(item.svgName, isNull);
      });

      test('should create TechStackItem with SVG icon', () {
        const item = TechStackItem(
          name: 'React',
          color: Colors.cyan,
          svgName: 'react',
          iconType: IconType.svg,
        );

        expect(item.name, equals('React'));
        expect(item.color, equals(Colors.cyan));
        expect(item.svgName, equals('react'));
        expect(item.iconType, equals(IconType.svg));
        expect(item.icon, isNull);
      });

      test('should create TechStackItem with default FontAwesome iconType', () {
        const item = TechStackItem(
          name: 'Default',
          color: Colors.red,
          icon: FontAwesomeIcons.code,
        );

        expect(item.iconType, equals(IconType.fontAwesome));
        expect(item.icon, equals(FontAwesomeIcons.code));
        expect(item.svgName, isNull);
      });
    });

    group('Validation', () {
      test('should throw assertion error when FontAwesome iconType has no icon', () {
        expect(
          () => TechStackItem(
            name: 'Invalid',
            color: Colors.red,
            iconType: IconType.fontAwesome,
            // Missing icon parameter
          ),
          throwsA(isA<AssertionError>()),
        );
      });

      test('should throw assertion error when SVG iconType has no svgName', () {
        expect(
          () => TechStackItem(
            name: 'Invalid',
            color: Colors.red,
            iconType: IconType.svg,
            // Missing svgName parameter
          ),
          throwsA(isA<AssertionError>()),
        );
      });

      test('should throw assertion error when FontAwesome iconType has svgName but no icon', () {
        expect(
          () => TechStackItem(
            name: 'Invalid',
            color: Colors.red,
            iconType: IconType.fontAwesome,
            svgName: 'some-svg',
            // Missing icon parameter
          ),
          throwsA(isA<AssertionError>()),
        );
      });

      test('should throw assertion error when SVG iconType has icon but no svgName', () {
        expect(
          () => TechStackItem(
            name: 'Invalid',
            color: Colors.red,
            iconType: IconType.svg,
            icon: FontAwesomeIcons.code,
            // Missing svgName parameter
          ),
          throwsA(isA<AssertionError>()),
        );
      });
    });

    group('Properties', () {
      test('should have immutable properties', () {
        const item = TechStackItem(
          name: 'Test',
          color: Colors.green,
          icon: FontAwesomeIcons.android,
        );

        // Properties should be final and not changeable
        expect(item.name, equals('Test'));
        expect(item.color, equals(Colors.green));
        expect(item.icon, equals(FontAwesomeIcons.android));
        expect(item.iconType, equals(IconType.fontAwesome));
      });

      test('should handle different color types', () {
        const item1 = TechStackItem(
          name: 'Primary',
          color: Color(0xFF2196F3),
          icon: FontAwesomeIcons.flutter,
        );

        const item2 = TechStackItem(
          name: 'Material',
          color: Colors.amber,
          icon: FontAwesomeIcons.android,
        );

        expect(item1.color, equals(const Color(0xFF2196F3)));
        expect(item2.color, equals(Colors.amber));
      });

      test('should handle different icon types', () {
        const fontAwesomeItem = TechStackItem(
          name: 'FontAwesome',
          color: Colors.blue,
          icon: FontAwesomeIcons.react,
        );

        const svgItem = TechStackItem(
          name: 'SVG',
          color: Colors.red,
          svgName: 'custom-icon',
          iconType: IconType.svg,
        );

        expect(fontAwesomeItem.iconType, equals(IconType.fontAwesome));
        expect(fontAwesomeItem.icon, isNotNull);
        expect(fontAwesomeItem.svgName, isNull);

        expect(svgItem.iconType, equals(IconType.svg));
        expect(svgItem.svgName, isNotNull);
        expect(svgItem.icon, isNull);
      });
    });

    group('Edge Cases', () {
      test('should handle empty name', () {
        const item = TechStackItem(
          name: '',
          color: Colors.blue,
          icon: FontAwesomeIcons.code,
        );

        expect(item.name, equals(''));
        expect(item.name.isEmpty, isTrue);
      });

      test('should handle very long names', () {
        const longName = 'Very Long Technology Name That Exceeds Normal Length';
        const item = TechStackItem(
          name: longName,
          color: Colors.purple,
          icon: FontAwesomeIcons.code,
        );

        expect(item.name, equals(longName));
        expect(item.name.length, greaterThan(20));
      });

      test('should handle special characters in name', () {
        const item = TechStackItem(
          name: 'C++/C#/.NET',
          color: Colors.orange,
          icon: FontAwesomeIcons.code,
        );

        expect(item.name, equals('C++/C#/.NET'));
        expect(item.name, contains('+'));
        expect(item.name, contains('#'));
        expect(item.name, contains('.'));
      });

      test('should handle empty svgName', () {
        const item = TechStackItem(
          name: 'Empty SVG',
          color: Colors.teal,
          svgName: '',
          iconType: IconType.svg,
        );

        expect(item.svgName, equals(''));
        expect(item.svgName!.isEmpty, isTrue);
      });

      test('should handle svgName with special characters', () {
        const item = TechStackItem(
          name: 'Special SVG',
          color: Colors.indigo,
          svgName: 'icon-name_with-special.chars',
          iconType: IconType.svg,
        );

        expect(item.svgName, equals('icon-name_with-special.chars'));
        expect(item.svgName, contains('-'));
        expect(item.svgName, contains('_'));
        expect(item.svgName, contains('.'));
      });
    });

    group('Equality and Comparison', () {
      test('should be equal when all properties match', () {
        const item1 = TechStackItem(
          name: 'Flutter',
          color: Colors.blue,
          icon: FontAwesomeIcons.flutter,
        );

        const item2 = TechStackItem(
          name: 'Flutter',
          color: Colors.blue,
          icon: FontAwesomeIcons.flutter,
        );

        // Note: Dart objects don't have automatic equality unless overridden
        // This test documents the current behavior
        expect(item1.name, equals(item2.name));
        expect(item1.color, equals(item2.color));
        expect(item1.icon, equals(item2.icon));
        expect(item1.iconType, equals(item2.iconType));
      });

      test('should have different properties when created differently', () {
        const item1 = TechStackItem(
          name: 'Flutter',
          color: Colors.blue,
          icon: FontAwesomeIcons.flutter,
        );

        const item2 = TechStackItem(
          name: 'React',
          color: Colors.cyan,
          svgName: 'react',
          iconType: IconType.svg,
        );

        expect(item1.name, isNot(equals(item2.name)));
        expect(item1.color, isNot(equals(item2.color)));
        expect(item1.iconType, isNot(equals(item2.iconType)));
      });
    });
  });

  group('IconType', () {
    test('should have correct enum values', () {
      expect(IconType.fontAwesome, isA<IconType>());
      expect(IconType.svg, isA<IconType>());
    });

    test('should have different values', () {
      expect(IconType.fontAwesome, isNot(equals(IconType.svg)));
    });

    test('should be usable in switch statements', () {
      String getIconTypeString(IconType type) {
        switch (type) {
          case IconType.fontAwesome:
            return 'FontAwesome';
          case IconType.svg:
            return 'SVG';
        }
      }

      expect(getIconTypeString(IconType.fontAwesome), equals('FontAwesome'));
      expect(getIconTypeString(IconType.svg), equals('SVG'));
    });
  });
}
