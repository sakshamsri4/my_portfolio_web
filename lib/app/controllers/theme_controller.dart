import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/base_controller.dart';

class ThemeController extends BaseController {
  // Observable for theme mode
  final Rx<ThemeMode> themeMode = ThemeMode.dark.obs;

  // Toggle theme mode
  void toggleTheme() {
    themeMode.value =
        themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }

  // Get current theme mode
  bool get isDarkMode => themeMode.value == ThemeMode.dark;

  @override
  void initializeController() {
    // Initialize theme settings
  }

  @override
  void cleanupResources() {
    // Clean up any resources
  }
}
