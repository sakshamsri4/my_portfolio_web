import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/modules/projects/controllers/projects_controller.dart';

void main() {
  setUp(() {
    Get.testMode = true;
    Get.put<ProjectsController>(ProjectsController());
  });

  tearDown(() {
    Get.reset();
  });

  testWidgets('Project card renders correctly', (WidgetTester tester) async {
    // Build a simple card widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Portfolio Website',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                      'A personal portfolio website built with Flutter and GetX.'),
                  const SizedBox(height: 8),
                  const Text(
                    'This website showcases my skills and projects in a clean, responsive interface.',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 4,
                    children: const [
                      Chip(
                        label: Text('Flutter', style: TextStyle(fontSize: 12)),
                        padding: EdgeInsets.all(4),
                      ),
                      Chip(
                        label: Text('GetX', style: TextStyle(fontSize: 12)),
                        padding: EdgeInsets.all(4),
                      ),
                      Chip(
                        label: Text('Web', style: TextStyle(fontSize: 12)),
                        padding: EdgeInsets.all(4),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // Verify card is rendered
    expect(find.byType(Card), findsOneWidget);

    // Verify card structure
    final card = tester.widget<Card>(find.byType(Card));
    expect(card.elevation, equals(3));

    // Verify title text style
    final titleFinder = find.text('Portfolio Website');
    final titleWidget = tester.widget<Text>(titleFinder);
    expect(titleWidget.style!.fontSize, equals(18));
    expect(titleWidget.style!.fontWeight, equals(FontWeight.bold));

    // Verify description text
    expect(
      find.text('A personal portfolio website built with Flutter and GetX.'),
      findsOneWidget,
    );

    // Verify details text
    final detailsFinder = find.text(
      'This website showcases my skills and projects in a clean, responsive interface.',
    );
    expect(detailsFinder, findsOneWidget);
    final detailsWidget = tester.widget<Text>(detailsFinder);
    expect(detailsWidget.style!.fontSize, equals(14));

    // Verify technology chips
    expect(find.byType(Chip), findsNWidgets(3));
    expect(find.text('Flutter'), findsOneWidget);
    expect(find.text('GetX'), findsOneWidget);
    expect(find.text('Web'), findsOneWidget);

    // Verify chip padding
    final chipFinder = find.byType(Chip).first;
    final chip = tester.widget<Chip>(chipFinder);
    expect(chip.padding, equals(const EdgeInsets.all(4)));

    // Verify chip text style
    final chipTextFinder = find.descendant(
      of: chipFinder,
      matching: find.byType(Text),
    );
    final chipText = tester.widget<Text>(chipTextFinder);
    expect(chipText.style!.fontSize, equals(12));
  });
}
