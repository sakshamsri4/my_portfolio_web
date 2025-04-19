import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/controllers/theme_controller.dart';

void main() {
  group('ThemeController', () {
    late ThemeController controller;

    setUp(() {
      controller = ThemeController();
    });

    test('initial theme mode should be dark', () {
      expect(controller.themeMode.value, equals(ThemeMode.dark));
      expect(controller.isDarkMode, isTrue);
    });

    test('toggleTheme should switch between light and dark mode', () {
      // Initially dark mode
      expect(controller.themeMode.value, equals(ThemeMode.dark));
      expect(controller.isDarkMode, isTrue);

      // Toggle to light mode
      controller.toggleTheme();
      expect(controller.themeMode.value, equals(ThemeMode.light));
      expect(controller.isDarkMode, isFalse);

      // Toggle back to dark mode
      controller.toggleTheme();
      expect(controller.themeMode.value, equals(ThemeMode.dark));
      expect(controller.isDarkMode, isTrue);
    });

    test('initializeController should not throw', () {
      expect(() => controller.initializeController(), returnsNormally);
    });

    test('cleanupResources should not throw', () {
      expect(() => controller.cleanupResources(), returnsNormally);
    });
  });
}
