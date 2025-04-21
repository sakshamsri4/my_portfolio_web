import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/utils/svg_icon_helper.dart';
import '../mocks/test_setup.dart';

void main() {
  // Set up test environment with all necessary mocks
  setupTestEnvironment();

  group('SvgIconHelper', () {
    test('SvgIconHelper class exists and has expected methods', () {
      // Verify that the class has the expected methods
      expect(SvgIconHelper.loadSvgIcon, isA<Function>());
      expect(SvgIconHelper.getSvgIcon, isA<Function>());
    });

    testWidgets('loadSvgIcon loads SVG correctly', (WidgetTester tester) async {
      // Add a fixed delay to allow asset loading time
      await tester.pump(const Duration(milliseconds: 50));

      try {
        // Load an SVG icon using our mock
        final svgPicture = await SvgIconHelper.loadSvgIcon('flutter');

        // Verify it's an SvgPicture
        expect(svgPicture, isA<SvgPicture>());
      } catch (e) {
        // If an exception occurs, fail with more context
        fail('Failed to load SVG: $e');
      }
    });

    testWidgets('loadSvgIcon handles non-existent SVG files',
        (WidgetTester tester) async {
      // Load a non-existent SVG icon
      try {
        await SvgIconHelper.loadSvgIcon('nonexistent');
        fail('Should have thrown an exception');
      } on Exception catch (e) {
        // Verify that an exception was thrown
        expect(e, isNotNull);
      }
    });

    testWidgets('getSvgIcon returns a widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => SvgIconHelper.getSvgIcon('flutter'),
            ),
          ),
        ),
      );

      // The widget should exist and contain a SizedBox (which is part of the loading indicator)
      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('getSvgIcon accepts custom size and color parameters',
        (WidgetTester tester) async {
      const double customSize = 48;
      const Color customColor = Colors.red;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => SvgIconHelper.getSvgIcon(
                'flutter',
                size: customSize,
                color: customColor,
              ),
            ),
          ),
        ),
      );

      // Verify a SizedBox is present (which should contain our custom size)
      expect(find.byType(SizedBox), findsWidgets);

      // We can't directly test the size and color parameters in this test environment,
      // but we can verify that the method accepts these parameters without errors
    });
  });

  // Clean up the test environment
  tearDownAll(() {
    cleanupTestEnvironment();
  });
}
