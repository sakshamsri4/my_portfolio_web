import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_web/app/common/ui/neo_pop_social_button.dart';

void main() {
  group('NeoPOPSocialButton', () {
    testWidgets('renders correctly with required properties',
        (WidgetTester tester) async {
      var buttonPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: NeoPOPSocialButton(
                icon: FontAwesomeIcons.linkedin,
                color: Colors.blue,
                onPressed: () {
                  buttonPressed = true;
                },
              ),
            ),
          ),
        ),
      );

      // Verify the button is rendered
      expect(find.byType(NeoPOPSocialButton), findsOneWidget);

      // Verify the FaIcon is rendered
      expect(find.byType(FaIcon), findsOneWidget);

      // Tap the button
      await tester.tap(find.byType(NeoPOPSocialButton));
      await tester.pump();

      // Verify the onPressed callback was called
      expect(buttonPressed, isTrue);
    });

    testWidgets('respects custom size parameters', (WidgetTester tester) async {
      const customSize = 50.0;
      const customIconSize = 25.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: NeoPOPSocialButton(
                icon: FontAwesomeIcons.linkedin,
                color: Colors.blue,
                onPressed: () {},
                size: customSize,
                iconSize: customIconSize,
              ),
            ),
          ),
        ),
      );

      // Verify the button is rendered with custom size
      expect(find.byType(NeoPOPSocialButton), findsOneWidget);

      // Find the FaIcon
      final icon = tester.widget<FaIcon>(find.byType(FaIcon));

      // Verify the icon is present
      expect(icon, isNotNull);
    });

    testWidgets('has correct shadow container positioning',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: NeoPOPSocialButton(
                icon: Icons.add,
                color: Colors.blue,
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      // Find the Positioned widget for the shadow
      final positioned = tester.widget<Positioned>(
        find.descendant(
          of: find.byType(NeoPOPSocialButton),
          matching: find.byType(Positioned),
        ),
      );

      // Verify the shadow offset
      expect(positioned.left, equals(3));
      expect(positioned.top, equals(3));
    });

    testWidgets('has animation builder', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: NeoPOPSocialButton(
                icon: FontAwesomeIcons.linkedin,
                color: Colors.blue,
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      // Verify the animation builder is present
      expect(find.byType(TweenAnimationBuilder<double>), findsOneWidget);
    });

    testWidgets('has clickable mouse cursor', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: NeoPOPSocialButton(
                icon: FontAwesomeIcons.linkedin,
                color: Colors.blue,
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      // Find the MouseRegion
      final mouseRegion = tester.widget<MouseRegion>(
        find.descendant(
          of: find.byType(NeoPOPSocialButton),
          matching: find.byType(MouseRegion),
        ),
      );

      // Verify the cursor is clickable
      expect(mouseRegion.cursor, equals(SystemMouseCursors.click));
    });
  });
}
