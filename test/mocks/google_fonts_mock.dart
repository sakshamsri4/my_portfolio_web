import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

/// Sets up mocks for Google Fonts to prevent network requests and font loading issues in tests.
void mockGoogleFonts() {
  // Disable runtime fetching to prevent network requests during tests
  GoogleFonts.config.allowRuntimeFetching = false;

  // Mock the asset bundle to return an empty asset manifest
  // This prevents Google Fonts from trying to load fonts from assets
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
    const MethodChannel('flutter/assets'),
    (MethodCall methodCall) async {
      if (methodCall.method == 'getAssetBundlePath') {
        return '';
      }

      if (methodCall.method == 'loadString') {
        final path = methodCall.arguments as String;
        if (path == 'AssetManifest.json' || path == 'FontManifest.json') {
          return '{}';
        }
      }

      return null;
    },
  );
}

/// Extension method to create test-safe Google Fonts text styles
extension GoogleFontsTestExtension on TextTheme {
  /// Creates a test-safe version of a TextTheme with Google Fonts
  TextTheme withMockGoogleFonts() {
    return copyWith(
      displayLarge: const TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      displayMedium: const TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
      displaySmall: const TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headlineMedium: const TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      headlineSmall: const TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      titleLarge: const TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      bodyLarge: const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 16,
      ),
      bodyMedium: const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 14,
      ),
      bodySmall: const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12,
      ),
    );
  }
}

/// Helper function to create a mock Google Font TextStyle
TextStyle mockGoogleFontTextStyle({
  String fontFamily = 'Montserrat',
  FontWeight fontWeight = FontWeight.normal,
  double fontSize = 14.0,
  FontStyle fontStyle = FontStyle.normal,
  TextStyle? textStyle,
  Color? color,
}) {
  return TextStyle(
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    fontSize: fontSize,
    fontStyle: fontStyle,
    color: color,
  ).merge(textStyle);
}

/// Patch for GoogleFonts.montserrat to use in tests
TextStyle mockMontserrat({
  TextStyle? textStyle,
  Color? color,
  Color? backgroundColor,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  double? letterSpacing,
  double? wordSpacing,
  TextBaseline? textBaseline,
  double? height,
  Locale? locale,
  Paint? foreground,
  Paint? background,
  List<Shadow>? shadows,
  List<FontFeature>? fontFeatures,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  double? decorationThickness,
}) {
  return TextStyle(
    fontFamily: 'Montserrat',
    color: color,
    backgroundColor: backgroundColor,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    height: height,
    locale: locale,
    foreground: foreground,
    background: background,
    shadows: shadows,
    fontFeatures: fontFeatures,
    decoration: decoration,
    decorationColor: decorationColor,
    decorationStyle: decorationStyle,
    decorationThickness: decorationThickness,
  ).merge(textStyle);
}
