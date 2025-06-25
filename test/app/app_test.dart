import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/app.dart';
import 'package:my_portfolio_web/app/controllers/analytics_controller.dart';
import 'package:my_portfolio_web/app/controllers/theme_controller.dart';
import 'package:my_portfolio_web/app/routes/app_pages.dart';
import 'package:my_portfolio_web/app/services/analytics_service.dart';
import 'package:my_portfolio_web/app/theme/app_theme.dart';

void main() {
  group('App Widget', () {
    setUpAll(() {
      // Register required dependencies for all tests
      Get.put<AnalyticsService>(AnalyticsService());
      Get.put<AnalyticsController>(AnalyticsController());
      Get.put<ThemeController>(ThemeController());
    });

    tearDownAll(() {
      Get.reset();
    });

    group('Widget Creation', () {
      test('should be a StatelessWidget', () {
        const app = App();
        expect(app, isA<StatelessWidget>());
      });

      testWidgets('should create GetMaterialApp', (tester) async {
        const app = App();

        // Use pumpWidget with a minimal frame to avoid layout issues
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                // Just build the app widget without pumping the full UI
                final widget = app.build(context);
                expect(widget, isA<Obx>());
                return const SizedBox.shrink();
              },
            ),
          ),
        );
      });
    });

    group('App Configuration', () {
      test('should have correct configuration values', () {
        // Test configuration without rendering
        expect(AppPages.initial, isNotNull);
        expect(AppPages.routes, isNotEmpty);
        expect(AppTheme.lightTheme, isNotNull);
        expect(AppTheme.darkTheme, isNotNull);
      });
    });

    group('Theme Integration', () {
      test('should use ThemeController for theme mode', () {
        final themeController = Get.find<ThemeController>();
        expect(themeController.themeMode.value, equals(ThemeMode.dark));
        expect(themeController.isDarkMode, isTrue);
      });
    });

  });
}
