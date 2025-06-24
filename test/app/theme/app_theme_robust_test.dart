import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio_web/app/theme/app_theme.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Mock Google Fonts to avoid issues in tests
  GoogleFonts.config.allowRuntimeFetching = false;

  group('AppTheme', () {
    test('lightTheme has correct properties', () {
      final theme = AppTheme.lightTheme;

      // Test basic theme properties
      expect(theme.primaryColor, equals(AppTheme.primarySwatch));
      expect(theme.scaffoldBackgroundColor, equals(AppTheme.backgroundColor));
      expect(theme.brightness, equals(Brightness.light));
      expect(theme.useMaterial3, isTrue);

      // Test color scheme
      expect(theme.colorScheme.primary, equals(AppTheme.primarySwatch));
      expect(theme.colorScheme.secondary, isNotNull);

      // Test app bar theme
      expect(theme.appBarTheme, isNotNull);
      expect(theme.appBarTheme.elevation, isNotNull);

      // Test button themes
      final elevatedButtonStyle = theme.elevatedButtonTheme.style;
      expect(elevatedButtonStyle, isNotNull);

      final outlinedButtonStyle = theme.outlinedButtonTheme.style;
      expect(outlinedButtonStyle, isNotNull);

      // Test card theme
      expect(theme.cardTheme, isNotNull);
      expect(theme.cardTheme.shape, isA<RoundedRectangleBorder>());

      // Test chip theme
      expect(theme.chipTheme, isNotNull);
      expect(theme.chipTheme.shape, isA<RoundedRectangleBorder>());
    });

    test('darkTheme has correct properties', () {
      final theme = AppTheme.darkTheme;

      // Test basic theme properties
      expect(theme.primaryColor, equals(AppTheme.primarySwatch));
      expect(theme.scaffoldBackgroundColor, equals(const Color(0xFF1A1A2E)));
      expect(theme.brightness, equals(Brightness.dark));
      expect(theme.useMaterial3, isTrue);

      // Test color scheme
      expect(theme.colorScheme.primary, equals(AppTheme.primarySwatch));

      // Test app bar theme
      expect(theme.appBarTheme.foregroundColor, equals(Colors.white));
      expect(theme.appBarTheme.elevation, equals(0));

      // Test button themes
      final elevatedButtonStyle = theme.elevatedButtonTheme.style;
      expect(elevatedButtonStyle, isNotNull);

      final outlinedButtonStyle = theme.outlinedButtonTheme.style;
      expect(outlinedButtonStyle, isNotNull);

      // Test card theme
      expect(theme.cardTheme.shape, isA<RoundedRectangleBorder>());

      // Test chip theme
      expect(theme.chipTheme.shape, isA<RoundedRectangleBorder>());
    });

    test('text themes have correct styles', () {
      // Light theme text styles
      final lightTextTheme = AppTheme.lightTheme.textTheme;
      expect(lightTextTheme.displayLarge, isNotNull);
      expect(lightTextTheme.bodyMedium, isNotNull);
      expect(lightTextTheme.bodySmall, isNotNull);

      // Verify font family is system font stack
      expect(lightTextTheme.displayLarge?.fontFamily, contains('.SF Pro Text'));
      expect(lightTextTheme.bodyMedium?.fontFamily, contains('.SF Pro Text'));

      // Verify font weights
      expect(lightTextTheme.displayLarge?.fontWeight, equals(FontWeight.bold));

      // Dark theme text styles
      final darkTextTheme = AppTheme.darkTheme.textTheme;
      expect(darkTextTheme.displayLarge, isNotNull);
      expect(darkTextTheme.bodyMedium, isNotNull);
      expect(darkTextTheme.bodySmall, isNotNull);

      // Verify font family is system font stack
      expect(darkTextTheme.displayLarge?.fontFamily, contains('.SF Pro Text'));
      expect(darkTextTheme.bodyMedium?.fontFamily, contains('.SF Pro Text'));

      // Verify font weights
      expect(darkTextTheme.displayLarge?.fontWeight, equals(FontWeight.bold));
    });
  });
}
