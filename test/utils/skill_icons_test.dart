import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_web/app/utils/skill_icons.dart';

void main() {
  group('SkillIcons', () {
    testWidgets('getSvgIcon returns correct icon for Flutter category',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SkillIcons.getSvgIcon('Flutter'),
            ),
          ),
        ),
      );

      final iconFinder = find.byType(FaIcon);
      expect(iconFinder, findsOneWidget);

      final icon = tester.widget<FaIcon>(iconFinder);
      expect(icon.icon, equals(FontAwesomeIcons.f));
    });

    testWidgets(
        'getSvgIcon returns correct icon for Mobile Development category',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SkillIcons.getSvgIcon('Mobile Development'),
            ),
          ),
        ),
      );

      final iconFinder = find.byType(FaIcon);
      expect(iconFinder, findsOneWidget);

      final icon = tester.widget<FaIcon>(iconFinder);
      expect(icon.icon, equals(FontAwesomeIcons.mobileScreen));
    });

    testWidgets('getSvgIcon returns correct icon for State Management category',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SkillIcons.getSvgIcon('State Management'),
            ),
          ),
        ),
      );

      final iconFinder = find.byType(FaIcon);
      expect(iconFinder, findsOneWidget);

      final icon = tester.widget<FaIcon>(iconFinder);
      expect(icon.icon, equals(FontAwesomeIcons.cubes));
    });

    testWidgets('getSvgIcon returns correct icon for Backend category',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SkillIcons.getSvgIcon('Backend'),
            ),
          ),
        ),
      );

      final iconFinder = find.byType(FaIcon);
      expect(iconFinder, findsOneWidget);

      final icon = tester.widget<FaIcon>(iconFinder);
      expect(icon.icon, equals(FontAwesomeIcons.server));
    });

    testWidgets('getSvgIcon returns correct icon for Database category',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SkillIcons.getSvgIcon('Database'),
            ),
          ),
        ),
      );

      final iconFinder = find.byType(FaIcon);
      expect(iconFinder, findsOneWidget);

      final icon = tester.widget<FaIcon>(iconFinder);
      expect(icon.icon, equals(FontAwesomeIcons.database));
    });

    testWidgets('getSvgIcon returns correct icon for UI/UX Design category',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SkillIcons.getSvgIcon('UI/UX Design'),
            ),
          ),
        ),
      );

      final iconFinder = find.byType(FaIcon);
      expect(iconFinder, findsOneWidget);

      final icon = tester.widget<FaIcon>(iconFinder);
      expect(icon.icon, equals(FontAwesomeIcons.penRuler));
    });

    testWidgets('getSvgIcon returns correct icon for AI Integration category',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SkillIcons.getSvgIcon('AI Integration'),
            ),
          ),
        ),
      );

      final iconFinder = find.byType(FaIcon);
      expect(iconFinder, findsOneWidget);

      final icon = tester.widget<FaIcon>(iconFinder);
      expect(icon.icon, equals(FontAwesomeIcons.brain));
    });

    testWidgets('getSvgIcon returns correct icon for AI Tools category',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SkillIcons.getSvgIcon('AI Tools'),
            ),
          ),
        ),
      );

      final iconFinder = find.byType(FaIcon);
      expect(iconFinder, findsOneWidget);

      final icon = tester.widget<FaIcon>(iconFinder);
      expect(icon.icon, equals(FontAwesomeIcons.robot));
    });

    testWidgets('getSvgIcon returns correct icon for DevOps category',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SkillIcons.getSvgIcon('DevOps'),
            ),
          ),
        ),
      );

      final iconFinder = find.byType(FaIcon);
      expect(iconFinder, findsOneWidget);

      final icon = tester.widget<FaIcon>(iconFinder);
      expect(icon.icon, equals(FontAwesomeIcons.gears));
    });

    testWidgets('getSvgIcon returns correct icon for Testing category',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SkillIcons.getSvgIcon('Testing'),
            ),
          ),
        ),
      );

      final iconFinder = find.byType(FaIcon);
      expect(iconFinder, findsOneWidget);

      final icon = tester.widget<FaIcon>(iconFinder);
      expect(icon.icon, equals(FontAwesomeIcons.vial));
    });

    testWidgets('getSvgIcon returns correct icon for Performance category',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SkillIcons.getSvgIcon('Performance'),
            ),
          ),
        ),
      );

      final iconFinder = find.byType(FaIcon);
      expect(iconFinder, findsOneWidget);

      final icon = tester.widget<FaIcon>(iconFinder);
      expect(icon.icon, equals(FontAwesomeIcons.gauge));
    });

    testWidgets('getSvgIcon returns correct icon for Automation category',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SkillIcons.getSvgIcon('Automation'),
            ),
          ),
        ),
      );

      final iconFinder = find.byType(FaIcon);
      expect(iconFinder, findsOneWidget);

      final icon = tester.widget<FaIcon>(iconFinder);
      expect(icon.icon, equals(FontAwesomeIcons.wandMagicSparkles));
    });

    testWidgets('getSvgIcon returns default icon for unknown category',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SkillIcons.getSvgIcon('Unknown Category'),
            ),
          ),
        ),
      );

      final iconFinder = find.byType(FaIcon);
      expect(iconFinder, findsOneWidget);

      final icon = tester.widget<FaIcon>(iconFinder);
      expect(icon.icon, equals(FontAwesomeIcons.code));
    });

    testWidgets('getSvgIcon respects custom size parameter',
        (WidgetTester tester) async {
      const customSize = 48.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SkillIcons.getSvgIcon('Flutter', size: customSize),
            ),
          ),
        ),
      );

      final iconFinder = find.byType(FaIcon);
      expect(iconFinder, findsOneWidget);

      final icon = tester.widget<FaIcon>(iconFinder);
      expect(icon.size, equals(customSize));
    });

    testWidgets('getSvgIcon respects custom color parameter',
        (WidgetTester tester) async {
      const customColor = Colors.red;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SkillIcons.getSvgIcon('Flutter', color: customColor),
            ),
          ),
        ),
      );

      final iconFinder = find.byType(FaIcon);
      expect(iconFinder, findsOneWidget);

      final icon = tester.widget<FaIcon>(iconFinder);
      expect(icon.color, equals(customColor));
    });
  });
}
