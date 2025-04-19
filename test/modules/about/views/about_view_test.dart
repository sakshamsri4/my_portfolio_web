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
    testWidgets('renders correctly with all components',
        (WidgetTester tester) async {
      // Build the AboutView widget
      await tester.pumpWidget(
        GetMaterialApp(
          home: const AboutView(),
          initialBinding: BindingsBuilder<void>(() {
            Get
              ..put<ThemeController>(ThemeController())
              ..put<AboutController>(aboutController);
          }),
        ),
      );

      // Verify the AppBar is rendered with the correct title
      expect(
        find.text('About Me'),
        findsNWidgets(2), // Once in AppBar, once in body
      );
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);

      // Verify the main content sections are rendered
      expect(find.text('Education'), findsOneWidget);
      expect(find.text('Experience'), findsOneWidget);

      // Verify education card content
      expect(
        find.text('Bachelor of Technology in Computer Science'),
        findsOneWidget,
      );
      expect(find.text('University Name, 2018-2022'), findsOneWidget);

      // Verify experience card content
      expect(find.text('Flutter Developer'), findsOneWidget);
      expect(find.text('Company Name, 2022-Present'), findsOneWidget);
      expect(
        find.textContaining(
          'Developed and maintained multiple Flutter applications',
        ),
        findsOneWidget,
      );

      // Verify navigation buttons
      expect(find.byType(ElevatedButton), findsNWidgets(3));
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Projects'), findsOneWidget);
      expect(find.text('Contact'), findsOneWidget);
    });

    testWidgets('back button navigates back', (WidgetTester tester) async {
      // Set up a navigation stack to test back button
      await tester.pumpWidget(
        GetMaterialApp(
          initialRoute: Routes.home,
          getPages: AppPages.routes,
          initialBinding: BindingsBuilder<void>(() {
            Get
              ..put<ThemeController>(ThemeController())
              ..put<AboutController>(aboutController);
          }),
        ),
      );

      // Navigate to about page
      await Get.toNamed<void>(Routes.about);
      await tester.pumpAndSettle();

      // Verify we're on the about page
      expect(find.byType(AboutView), findsOneWidget);

      // Tap the back button
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // Verify we've navigated back
      expect(find.byType(AboutView), findsNothing);
    });

    testWidgets('navigation buttons navigate to correct routes',
        (WidgetTester tester) async {
      // Build the AboutView widget
      await tester.pumpWidget(
        GetMaterialApp(
          initialRoute: Routes.about,
          getPages: AppPages.routes,
          initialBinding: BindingsBuilder<void>(() {
            Get
              ..put<ThemeController>(ThemeController())
              ..put<AboutController>(aboutController);
          }),
        ),
      );

      await tester.pumpAndSettle();

      // Verify we're on the about page
      expect(find.byType(AboutView), findsOneWidget);

      // Test Home button navigation
      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();
      expect(Get.currentRoute, equals(Routes.home));

      // Navigate back to about page for next test
      await Get.toNamed<void>(Routes.about);
      await tester.pumpAndSettle();

      // Test Projects button navigation
      await tester.tap(find.text('Projects'));
      await tester.pumpAndSettle();
      expect(Get.currentRoute, equals(Routes.projects));

      // Navigate back to about page for next test
      await Get.toNamed<void>(Routes.about);
      await tester.pumpAndSettle();

      // Test Contact button navigation
      await tester.tap(find.text('Contact'));
      await tester.pumpAndSettle();
      expect(Get.currentRoute, equals(Routes.contact));
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
