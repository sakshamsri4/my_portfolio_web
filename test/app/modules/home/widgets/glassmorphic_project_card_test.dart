import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:my_portfolio_web/app/modules/home/widgets/glassmorphic_project_card.dart';

class MockHomeController extends GetxController {
  void launchProjectUrl(String url) {
    // Mock implementation
  }
}

class MockPortfolioRepository extends Mock implements PortfolioRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    Get.testMode = true;
    Get.put<HomeController>(
      HomeController(repository: MockPortfolioRepository()),
    );
  });

  tearDown(Get.reset);

  // Helper function to build the widget under test
  Widget buildTestWidget() {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 300,
            height: 400,
            child: GlassmorphicProjectCard(
              title: 'Test Project',
              description: 'This is a test project description',
              imageUrl: 'assets/images/project1.jpg',
              tileImageUrl: 'assets/tile_images/project1.jpg',
              externalUrl: 'https://example.com',
            ),
          ),
        ),
      ),
    );
  }

  group('GlassmorphicProjectCard Widget', () {
    testWidgets('renders correctly with all components',
        (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(buildTestWidget());

      // Verify that key elements are present
      expect(find.text('Test Project'), findsOneWidget);
      expect(find.text('View Project'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);

      // Verify that the card has the correct structure
      expect(find.byType(ClipRRect), findsOneWidget);
      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('has MouseRegion for hover animations',
        (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(buildTestWidget());

      // Verify that the MouseRegion is present for hover animations
      expect(find.byType(MouseRegion), findsWidgets);

      // Verify that the Transform is present for animation
      expect(find.byType(Transform), findsWidgets);

      // Verify that the AnimatedBuilder is present for animation
      expect(find.byType(AnimatedBuilder), findsWidgets);
    });

    testWidgets('handles tap on card', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(buildTestWidget());

      // Tap the card
      await tester.tap(find.byType(InkWell));
      await tester.pump();

      // We can't directly verify that the URL was launched in a widget test
      // But we can verify that the tap doesn't cause an error
    });

    testWidgets('handles image loading errors gracefully',
        (WidgetTester tester) async {
      // Build the widget with an invalid image path
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                height: 400,
                child: GlassmorphicProjectCard(
                  title: 'Test Project',
                  description: 'This is a test project description',
                  imageUrl: 'invalid_path.jpg',
                  tileImageUrl: 'invalid_path.jpg',
                  externalUrl: 'https://example.com',
                ),
              ),
            ),
          ),
        ),
      );

      // Pump a frame to trigger image loading
      await tester.pump();

      // Verify that the card still renders without crashing
      expect(find.text('Test Project'), findsOneWidget);
      expect(find.text('View Project'), findsOneWidget);
    });
  });
}
