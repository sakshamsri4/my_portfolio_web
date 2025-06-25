import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/analytics_controller.dart';
import 'package:my_portfolio_web/app/controllers/base_controller.dart';
import 'package:my_portfolio_web/app/theme/app_theme.dart';

class ThemeController extends BaseController {
  // Observable for theme mode
  final Rx<ThemeMode> themeMode = ThemeMode.dark.obs;

  // Analytics controller for tracking theme changes
  AnalyticsController? _analyticsController;

  // Toggle theme mode
  void toggleTheme() {
    final newTheme =
        themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    themeMode.value = newTheme;

    // Track theme change
    _analyticsController?.trackThemeChange(newTheme.name);
  }

  // Get current theme mode
  bool get isDarkMode => themeMode.value == ThemeMode.dark;

  // Get current theme data
  ThemeData get currentTheme => isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;

  @override
  void initializeController() {
    // Initialize analytics controller only if not already initialized
    _analyticsController ??= Get.find<AnalyticsController>();

    // Initialize theme settings
  }

  @override
  void cleanupResources() {
    // Clean up any resources
  }
}
