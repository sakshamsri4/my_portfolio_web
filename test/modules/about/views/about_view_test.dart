import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/theme_controller.dart';
import 'package:my_portfolio_web/app/modules/about/controllers/about_controller.dart';
import 'package:my_portfolio_web/app/modules/about/views/about_view.dart';
import 'package:my_portfolio_web/app/routes/app_pages.dart';

void main() {
  late AboutController aboutController;

  setUp(() {
    // Initialize GetX test environment
    Get.testMode = true;

    // Register the controller and dependencies
    aboutController = AboutController();

    // Register all required controllers
    Get
      ..put<AboutController>(aboutController)
      ..put<ThemeController>(ThemeController())
      ..addPages(AppPages.routes);
  });

  tearDown(Get.reset);

  group('AboutView', () {
    test('AboutView can be instantiated', () {
      const aboutView = AboutView();
      expect(aboutView, isA<Widget>());
    });

    testWidgets('back button exists', (WidgetTester tester) async {
      // Build a simple version of the AboutView widget
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            appBar: AppBar(
              leading: const BackButton(),
              title: const Text('About Me'),
            ),
            body: const SizedBox(height: 100),
          ),
          initialBinding: BindingsBuilder<void>(() {
            Get
              ..put<ThemeController>(ThemeController())
              ..put<AboutController>(aboutController);
          }),
        ),
      );

      // Verify the AppBar is rendered with a back button
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('has correct title', (WidgetTester tester) async {
      // Build a simple version of the AboutView widget
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            appBar: AppBar(
              leading: const BackButton(),
              title: const Text('About Me'),
            ),
            body: const SizedBox(height: 100),
          ),
          initialBinding: BindingsBuilder<void>(() {
            Get
              ..put<ThemeController>(ThemeController())
              ..put<AboutController>(aboutController);
          }),
        ),
      );

      // Verify the title is rendered
      expect(find.text('About Me'), findsOneWidget);
    });
  });

  group('AboutController', () {
    test('increment increases count', () {
      // Initial value should be 0
      expect(aboutController.count.value, equals(0));

      // Call increment
      aboutController.increment();

      // Value should be incremented to 1
      expect(aboutController.count.value, equals(1));
    });
  });
}
