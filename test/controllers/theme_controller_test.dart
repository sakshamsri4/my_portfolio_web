import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/analytics_controller.dart';
import 'package:my_portfolio_web/app/controllers/theme_controller.dart';
import 'package:my_portfolio_web/app/services/analytics_service.dart';

import '../mocks/analytics_mock.dart';

void main() {
  group('ThemeController', () {
    late ThemeController themeController;
    late MockAnalyticsService mockAnalyticsService;

    setUp(() {
      // Set up mock analytics service
      mockAnalyticsService = MockAnalyticsService();
      Get.put<AnalyticsService>(mockAnalyticsService);

      // Set up analytics controller
      Get.put(AnalyticsController());

      // Set up theme controller
      themeController = ThemeController();
      themeController.initializeController();
    });

    tearDown(Get.reset);

    test('initial theme mode should be dark', () {
      expect(themeController.themeMode.value, equals(ThemeMode.dark));
      expect(themeController.isDarkMode, isTrue);
    });

    test('toggleTheme should switch between light and dark mode', () {
      // Initially dark mode
      expect(themeController.themeMode.value, equals(ThemeMode.dark));

      // Toggle to light mode
      themeController.toggleTheme();
      expect(themeController.themeMode.value, equals(ThemeMode.light));
      expect(themeController.isDarkMode, isFalse);

      // Toggle back to dark mode
      themeController.toggleTheme();
      expect(themeController.themeMode.value, equals(ThemeMode.dark));
      expect(themeController.isDarkMode, isTrue);
    });
  });
}
