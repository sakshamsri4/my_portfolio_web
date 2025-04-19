import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/modules/projects/controllers/projects_controller.dart';
import 'package:my_portfolio_web/app/routes/app_pages.dart';

void main() {
  setUp(() {
    Get.testMode = true;
    Get
      ..put<ProjectsController>(ProjectsController())
      ..addPages(AppPages.routes);
  });

  tearDown(Get.reset);

  testWidgets('ProjectsView renders correctly', (WidgetTester tester) async {
    // Set a larger screen size to avoid overflow
    tester.binding.window.physicalSizeTestValue = const Size(1024, 1600);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

    await tester.pumpWidget(
      GetMaterialApp(
        initialRoute: Routes.projects,
        getPages: AppPages.routes,
      ),
    );

    // Verify AppBar is rendered with correct title
    expect(
      find.byType(AppBar),
      findsOneWidget,
    );
    expect(
      find.text('My Projects'),
      findsAtLeastNWidgets(1),
    );

    // Verify back button
    expect(
      find.byType(IconButton),
      findsOneWidget,
    );
    expect(
      find.byIcon(Icons.arrow_back),
      findsOneWidget,
    );

    // Verify project cards
    expect(
      find.byType(Card),
      findsNWidgets(3),
    ); // Three project cards

    // Verify first project card content
    expect(
      find.text('Portfolio Website'),
      findsOneWidget,
    );
    expect(
      find.text('A personal portfolio website built with Flutter and GetX.'),
      findsOneWidget,
    );

    // Verify second project card content
    expect(
      find.text('E-Commerce App'),
      findsOneWidget,
    );
    expect(
      find.text('A mobile application for online shopping.'),
      findsOneWidget,
    );

    // Verify third project card content
    expect(
      find.text('Task Management App'),
      findsOneWidget,
    );
    expect(
      find.text('A productivity app for managing tasks and projects.'),
      findsOneWidget,
    );

    // Verify technology chips
    expect(
      find.byType(Chip),
      findsNWidgets(9),
    ); // 3 chips in each of 3 cards
    expect(
      find.text('Flutter'),
      findsNWidgets(3),
    ); // In all 3 cards
    expect(
      find.text('GetX'),
      findsOneWidget,
    );
    expect(
      find.text('Web'),
      findsOneWidget,
    );
    expect(
      find.text('Firebase'),
      findsOneWidget,
    );
    expect(
      find.text('Stripe'),
      findsOneWidget,
    );
    expect(
      find.text('Hive'),
      findsOneWidget,
    );
    expect(
      find.text('Provider'),
      findsOneWidget,
    );
  });

  testWidgets('Project card renders correctly', (WidgetTester tester) async {
    // Build a simple card widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Card(
            elevation: 3,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Portfolio Website',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'A personal portfolio website built with Flutter and GetX.',
                  ),
                  SizedBox(height: 8),
                  Text(
                    'This website showcases my skills and projects in a clean, responsive interface.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 4,
                    children: [
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
    expect(
      find.byType(Card),
      findsOneWidget,
    );

    // Verify card structure
    final card = tester.widget<Card>(find.byType(Card));
    expect(
      card.elevation,
      equals(3),
    );

    // Verify title text style
    final titleFinder = find.text('Portfolio Website');
    final titleWidget = tester.widget<Text>(titleFinder);
    expect(
      titleWidget.style!.fontSize,
      equals(18),
    );
    expect(
      titleWidget.style!.fontWeight,
      equals(FontWeight.bold),
    );

    // Verify description text
    expect(
      find.text('A personal portfolio website built with Flutter and GetX.'),
      findsOneWidget,
    );

    // Verify details text
    final detailsFinder = find.text(
      'This website showcases my skills and projects in a clean, responsive interface.',
    );
    expect(
      detailsFinder,
      findsOneWidget,
    );
    final detailsWidget = tester.widget<Text>(detailsFinder);
    expect(
      detailsWidget.style!.fontSize,
      equals(14),
    );

    // Verify technology chips
    expect(
      find.byType(Chip),
      findsNWidgets(3),
    );
    expect(
      find.text('Flutter'),
      findsOneWidget,
    );
    expect(
      find.text('GetX'),
      findsOneWidget,
    );
    expect(
      find.text('Web'),
      findsOneWidget,
    );

    // Verify chip padding
    final chipFinder = find.byType(Chip).first;
    final chip = tester.widget<Chip>(chipFinder);
    expect(
      chip.padding,
      equals(const EdgeInsets.all(4)),
    );

    // Verify chip text style
    final chipTextFinder = find.descendant(
      of: chipFinder,
      matching: find.byType(Text),
    );
    final chipText = tester.widget<Text>(chipTextFinder);
    expect(
      chipText.style!.fontSize,
      equals(12),
    );
  });
}
