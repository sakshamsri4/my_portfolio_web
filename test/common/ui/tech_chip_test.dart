import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/common/ui/tech_chip.dart';

void main() {
  group('TechChip', () {
    testWidgets('renders correctly with default properties',
        (WidgetTester tester) async {
      const label = 'Flutter';

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue,
            ),
          ),
          home: const Scaffold(
            body: Center(
              child: TechChip(label: label),
            ),
          ),
        ),
      );

      // Verify the chip is rendered
      expect(find.byType(TechChip), findsOneWidget);

      // Verify the label is displayed
      expect(find.text(label), findsOneWidget);

      // Verify the container has a border in light mode
      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.border, isNotNull);
    });

    testWidgets('renders correctly in dark mode', (WidgetTester tester) async {
      const label = 'Flutter';

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.blue,
            ),
          ),
          home: const Scaffold(
            body: Center(
              child: TechChip(
                label: label,
                isDarkMode: true,
              ),
            ),
          ),
        ),
      );

      // Verify the chip is rendered
      expect(find.byType(TechChip), findsOneWidget);

      // Verify the label is displayed
      expect(find.text(label), findsOneWidget);

      // Verify the container has no border in dark mode
      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.border, isNull);
    });

    testWidgets('uses custom color when provided', (WidgetTester tester) async {
      const label = 'Flutter';
      const customColor = Colors.red;

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue,
            ),
          ),
          home: const Scaffold(
            body: Center(
              child: TechChip(
                label: label,
                customColor: customColor,
              ),
            ),
          ),
        ),
      );

      // Verify the chip is rendered
      expect(find.byType(TechChip), findsOneWidget);

      // Verify the custom color is used
      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.color, equals(customColor));
    });

    testWidgets('handles long text with ellipsis', (WidgetTester tester) async {
      const longLabel =
          'This is a very long technology name that should be truncated with ellipsis';

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue,
            ),
          ),
          home: const Scaffold(
            body: Center(
              child: SizedBox(
                width: 100, // Constrain width to force ellipsis
                child: TechChip(label: longLabel),
              ),
            ),
          ),
        ),
      );

      // Verify the chip is rendered
      expect(find.byType(TechChip), findsOneWidget);

      // Verify the text widget has ellipsis overflow
      final text = tester.widget<Text>(find.byType(Text));
      expect(text.overflow, equals(TextOverflow.ellipsis));
      expect(text.maxLines, equals(1));
    });
  });
}
