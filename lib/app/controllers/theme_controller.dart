import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  // Observable for theme mode
  final Rx<ThemeMode> themeMode = ThemeMode.light.obs;

  // Toggle theme mode
  void toggleTheme() {
    themeMode.value = themeMode.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    
    // Show a snackbar to indicate theme change
    Get.snackbar(
      'Theme Changed',
      'App theme is now ${themeMode.value == ThemeMode.light ? 'Light' : 'Dark'}',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      backgroundColor: Get.theme.colorScheme.surface,
      colorText: Get.theme.colorScheme.onSurface,
    );
  }

  // Get current theme mode
  bool get isDarkMode => themeMode.value == ThemeMode.dark;
}
