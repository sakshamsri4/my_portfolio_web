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
                icon: FontAwesomeIcons.github,
                color: Colors.black,
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

      // Verify the icon is displayed
      expect(find.byType(FaIcon), findsOneWidget);

      // Verify the button has the correct color
      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(Stack),
          matching: find.byType(Container).at(1), // Main container
        ),
      );
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.color, equals(Colors.black));

      // Tap the button and verify the callback is called
      await tester.tap(find.byType(GestureDetector));
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
                icon: FontAwesomeIcons.github,
                color: Colors.black,
                onPressed: () {},
                size: customSize,
                iconSize: customIconSize,
              ),
            ),
          ),
        ),
      );

      // Verify the button is rendered
      expect(find.byType(NeoPOPSocialButton), findsOneWidget);

      // Verify the container has the custom size
      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(Stack),
          matching: find.byType(Container).at(1), // Main container
        ),
      );
      expect(container.constraints?.maxWidth, equals(customSize));
      expect(container.constraints?.maxHeight, equals(customSize));

      // Verify the icon has the custom size
      final icon = tester.widget<FaIcon>(find.byType(FaIcon));
      expect(icon.size, equals(customIconSize));
    });

    testWidgets('has correct shadow container positioning',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: NeoPOPSocialButton(
                icon: FontAwesomeIcons.github,
                color: Colors.black,
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      // Verify the shadow container is positioned correctly
      final positioned = tester.widget<Positioned>(find.byType(Positioned));
      expect(positioned.left, equals(3));
      expect(positioned.top, equals(3));
    });

    testWidgets('has animation builder', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: NeoPOPSocialButton(
                icon: FontAwesomeIcons.github,
                color: Colors.black,
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      // Verify the animation builder is present
      expect(find.byType(TweenAnimationBuilder<double>), findsOneWidget);

      // Verify at least one transform is present for animation
      expect(find.byType(Transform), findsWidgets);
    });

    testWidgets('has clickable mouse cursor', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: NeoPOPSocialButton(
                icon: FontAwesomeIcons.github,
                color: Colors.black,
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      // Verify at least one mouse region has a clickable cursor
      final mouseRegions =
          tester.widgetList<MouseRegion>(find.byType(MouseRegion));
      expect(
        mouseRegions.any((region) => region.cursor == SystemMouseCursors.click),
        isTrue,
      );
    });
  });
}
