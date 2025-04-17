import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  // Observable for theme mode
  final Rx<ThemeMode> themeMode = ThemeMode.light.obs;

  // Toggle theme mode
  void toggleTheme() {
    themeMode.value =
        themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }

  // Get current theme mode
  bool get isDarkMode => themeMode.value == ThemeMode.dark;
}
