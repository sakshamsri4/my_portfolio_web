import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import '../mocks/google_fonts_mock.dart';

/// A helper class to patch GoogleFonts methods for testing
class GoogleFontsTestHelper {
  /// Patches the GoogleFonts.montserrat method for testing
  static void patchGoogleFontsMontserrat() {
    // Create a test binding if not already created
    TestWidgetsFlutterBinding.ensureInitialized();
    
    // Mock the GoogleFonts configuration
    mockGoogleFonts();
  }
  
  /// Creates a mock TextTheme with Montserrat font
  static TextTheme createMockMontserratTextTheme(TextTheme baseTheme) {
    return TextTheme(
      displayLarge: mockMontserrat(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: baseTheme.displayLarge?.color,
      ),
      displayMedium: mockMontserrat(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: baseTheme.displayMedium?.color,
      ),
      displaySmall: mockMontserrat(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: baseTheme.displaySmall?.color,
      ),
      headlineMedium: mockMontserrat(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: baseTheme.headlineMedium?.color,
      ),
      headlineSmall: mockMontserrat(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: baseTheme.headlineSmall?.color,
      ),
      titleLarge: mockMontserrat(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: baseTheme.titleLarge?.color,
      ),
      bodyLarge: mockMontserrat(
        fontSize: 16,
        color: baseTheme.bodyLarge?.color,
      ),
      bodyMedium: mockMontserrat(
        fontSize: 14,
        color: baseTheme.bodyMedium?.color,
      ),
      bodySmall: mockMontserrat(
        fontSize: 12,
        color: baseTheme.bodySmall?.color,
      ),
    );
  }
}
