import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/modules/home/widgets/custom_drawer.dart';
import 'package:my_portfolio_web/app/routes/app_pages.dart';

void main() {
  setUp(() {
    // Initialize GetX
    Get.testMode = true;
    Get.reset();
  });

  tearDown(Get.reset);

  group('CustomDrawer', () {
    test('drawer contains expected elements', () {
      // Create a drawer
      const drawer = CustomDrawer();

      // Verify it's a widget
      expect(drawer, isA<Widget>());

      // Verify it's a Drawer
      expect(drawer, isA<CustomDrawer>());
    });

    test('navigation routes are correctly defined', () {
      // Set up routes for navigation testing
      Get.addPages(AppPages.routes);

      // Verify the routes are correctly defined
      expect(Routes.home, equals('/home'));
      expect(Routes.about, equals('/about'));
      expect(Routes.projects, equals('/projects'));
      expect(Routes.contact, equals('/contact'));
    });
  });
}
