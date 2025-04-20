import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../helpers/google_fonts_test_helper.dart';
import 'svg_mock.dart';

/// Sets up all mocks and configurations needed for tests
void setupTestEnvironment() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Mock Google Fonts
  GoogleFontsTestHelper.patchGoogleFontsMontserrat();

  // Mock SVG loading
  mockSvgLoading();
}

/// Cleans up all mocks after tests
void cleanupTestEnvironment() {
  // Clean up SVG mocks
  cleanupSvgMock();
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
