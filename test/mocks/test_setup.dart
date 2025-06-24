import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/analytics_controller.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository.dart';
import 'package:my_portfolio_web/app/services/analytics_service.dart';

import '../helpers/google_fonts_test_helper.dart';
import 'analytics_mock.dart';
import 'svg_mock.dart';

/// Sets up all mocks and configurations needed for tests
void setupTestEnvironment() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Mock Google Fonts
  setupGoogleFontsMock();

  // Mock SVG loading
  SvgMock.setupSvgMocking();
}

/// Sets up analytics dependencies for tests
void setupAnalyticsDependencies() {
  // Register mock analytics service first
  final mockAnalyticsService = MockAnalyticsService();
  Get.put<AnalyticsService>(mockAnalyticsService);

  // Register analytics controller
  Get.put<AnalyticsController>(AnalyticsController());
}

/// Sets up all dependencies including analytics
void setupFullTestDependencies() {
  setupTestEnvironment();
  setupAnalyticsDependencies();

  // Register portfolio repository
  Get.put<PortfolioRepository>(PortfolioRepository());
}

/// Cleans up all mocks after tests
void cleanupTestEnvironment() {
  // Clean up SVG mocks
  SvgMock.cleanupSvgMocking();

  // Clean up GetX dependencies
  Get.reset();
}

/// Builds a test widget with the proper theme and context
Widget buildTestWidget({
  required Widget child,
  ThemeMode themeMode = ThemeMode.light,
}) {
  return MaterialApp(
    themeMode: themeMode,
    home: Scaffold(
      body: child,
    ),
  );
}

/// Sets the screen size for tests
void setScreenSize(
  WidgetTester tester, {
  double width = 1080,
  double height = 1920,
}) {
  tester.binding.window.physicalSizeTestValue = Size(width, height);
  tester.binding.window.devicePixelRatioTestValue = 1.0;
}
