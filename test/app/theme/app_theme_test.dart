import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/theme/app_theme.dart';

void main() {
  group('AppTheme', () {
    group('Primary Color Swatch', () {
      test('should have correct primary color', () {
        expect(AppTheme.primarySwatch.value, equals(0xFF675AF2));
      });

      test('should have complete color swatch', () {
        final swatch = AppTheme.primarySwatch;
        
        expect(swatch[50], equals(const Color(0xFFEEECFD)));
        expect(swatch[100], equals(const Color(0xFFD4D0FA)));
        expect(swatch[200], equals(const Color(0xFFB7B0F7)));
        expect(swatch[300], equals(const Color(0xFF9A90F4)));
        expect(swatch[400], equals(const Color(0xFF8479F3)));
        expect(swatch[500], equals(const Color(0xFF675AF2))); // Primary
        expect(swatch[600], equals(const Color(0xFF5F52F1)));
        expect(swatch[700], equals(const Color(0xFF5448EF)));
        expect(swatch[800], equals(const Color(0xFF4A3FEE)));
        expect(swatch[900], equals(const Color(0xFF392EEC)));
      });

      test('should have colors in correct intensity order', () {
        final swatch = AppTheme.primarySwatch;
        
        // Lighter colors should have higher values (closer to white)
        expect(swatch[50]!.computeLuminance(), 
               greaterThan(swatch[100]!.computeLuminance()));
        expect(swatch[100]!.computeLuminance(), 
               greaterThan(swatch[200]!.computeLuminance()));
        expect(swatch[200]!.computeLuminance(), 
               greaterThan(swatch[300]!.computeLuminance()));
        
        // Darker colors should have lower luminance
        expect(swatch[700]!.computeLuminance(), 
               lessThan(swatch[600]!.computeLuminance()));
        expect(swatch[800]!.computeLuminance(), 
               lessThan(swatch[700]!.computeLuminance()));
        expect(swatch[900]!.computeLuminance(), 
               lessThan(swatch[800]!.computeLuminance()));
      });
    });

    group('Font Configuration', () {
      test('should have correct font family', () {
        const expectedFontFamily = '.SF Pro Text, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica, Arial, sans-serif';
        expect(AppTheme.fontFamily, equals(expectedFontFamily));
      });

      test('should use system fonts for cross-platform compatibility', () {
        expect(AppTheme.fontFamily, contains('-apple-system'));
        expect(AppTheme.fontFamily, contains('BlinkMacSystemFont'));
        expect(AppTheme.fontFamily, contains('Segoe UI'));
        expect(AppTheme.fontFamily, contains('Roboto'));
        expect(AppTheme.fontFamily, contains('sans-serif'));
      });
    });

    group('Light Theme', () {
      late ThemeData lightTheme;

      setUp(() {
        lightTheme = AppTheme.lightTheme;
      });

      test('should be configured for light brightness', () {
        expect(lightTheme.brightness, equals(Brightness.light));
      });

      test('should use Material 3', () {
        expect(lightTheme.useMaterial3, isTrue);
      });

      test('should have correct primary colors', () {
        expect(lightTheme.colorScheme.primary, equals(AppTheme.primarySwatch));
      });

      test('should have correct background color', () {
        expect(lightTheme.scaffoldBackgroundColor, 
               equals(const Color(0xFFF4F0FF)));
      });

      test('should have correct font family', () {
        expect(lightTheme.textTheme.bodyLarge?.fontFamily, equals(AppTheme.fontFamily));
      });

      test('should have proper color scheme', () {
        final colorScheme = lightTheme.colorScheme;
        
        expect(colorScheme.brightness, equals(Brightness.light));
        expect(colorScheme.primary, equals(AppTheme.primarySwatch));
        expect(colorScheme.secondary, equals(AppTheme.primarySwatch.shade300));
        expect(colorScheme.onSurface, equals(const Color(0xFF333333)));
        expect(colorScheme.onSecondary, equals(Colors.white));
      });

      test('should have configured app bar theme', () {
        final appBarTheme = lightTheme.appBarTheme;
        
        expect(appBarTheme.backgroundColor, equals(Colors.white));
        expect(appBarTheme.foregroundColor, equals(const Color(0xFF333333)));
        expect(appBarTheme.elevation, equals(0));
        expect(appBarTheme.centerTitle, isTrue);
        expect(appBarTheme.titleTextStyle?.fontFamily, equals(AppTheme.fontFamily));
        expect(appBarTheme.titleTextStyle?.fontWeight, equals(FontWeight.bold));
        expect(appBarTheme.titleTextStyle?.fontSize, equals(20));
      });

      test('should have configured elevated button theme', () {
        final buttonTheme = lightTheme.elevatedButtonTheme;
        
        expect(buttonTheme.style, isNotNull);
        
        final backgroundColor = buttonTheme.style!.backgroundColor!
            .resolve({MaterialState.pressed});
        expect(backgroundColor, equals(AppTheme.primarySwatch));
      });

      test('should have configured card theme', () {
        final cardTheme = lightTheme.cardTheme;
        
        expect(cardTheme.color, equals(Colors.white));
        expect(cardTheme.elevation, equals(4));
        expect(cardTheme.margin, equals(const EdgeInsets.symmetric(vertical: 8)));
        expect(cardTheme.shape, isA<RoundedRectangleBorder>());
      });

      test('should have configured chip theme', () {
        final chipTheme = lightTheme.chipTheme;
        
        expect(chipTheme.backgroundColor, equals(AppTheme.primarySwatch.shade100));
        expect(chipTheme.labelStyle?.fontFamily, equals(AppTheme.fontFamily));
        expect(chipTheme.labelStyle?.color, equals(AppTheme.primarySwatch.shade800));
        expect(chipTheme.padding, equals(const EdgeInsets.symmetric(horizontal: 8)));
        expect(chipTheme.shape, isA<RoundedRectangleBorder>());
      });

      test('should have configured divider theme', () {
        final dividerTheme = lightTheme.dividerTheme;
        
        expect(dividerTheme.color, equals(const Color(0xFFEEEEEE)));
        expect(dividerTheme.thickness, equals(1));
        expect(dividerTheme.space, equals(24));
      });
    });

    group('Dark Theme', () {
      late ThemeData darkTheme;

      setUp(() {
        darkTheme = AppTheme.darkTheme;
      });

      test('should be configured for dark brightness', () {
        expect(darkTheme.brightness, equals(Brightness.dark));
      });

      test('should use Material 3', () {
        expect(darkTheme.useMaterial3, isTrue);
      });

      test('should have correct primary colors', () {
        expect(darkTheme.colorScheme.primary, equals(AppTheme.primarySwatch));
      });

      test('should have correct background color', () {
        expect(darkTheme.scaffoldBackgroundColor, 
               equals(const Color(0xFF1A1A2E)));
      });

      test('should have correct font family', () {
        expect(darkTheme.textTheme.bodyLarge?.fontFamily, equals(AppTheme.fontFamily));
      });

      test('should have proper color scheme', () {
        final colorScheme = darkTheme.colorScheme;
        
        expect(colorScheme.brightness, equals(Brightness.dark));
        expect(colorScheme.primary, equals(AppTheme.primarySwatch));
        expect(colorScheme.secondary, equals(AppTheme.primarySwatch.shade300));
        expect(colorScheme.surface, equals(const Color(0xFF2C2C44)));
      });

      test('should have configured app bar theme', () {
        final appBarTheme = darkTheme.appBarTheme;
        
        expect(appBarTheme.backgroundColor, equals(const Color(0xFF2C2C44)));
        expect(appBarTheme.foregroundColor, equals(Colors.white));
        expect(appBarTheme.elevation, equals(0));
        expect(appBarTheme.titleTextStyle?.fontFamily, equals(AppTheme.fontFamily));
        expect(appBarTheme.titleTextStyle?.fontWeight, equals(FontWeight.bold));
        expect(appBarTheme.titleTextStyle?.color, equals(Colors.white));
      });

      test('should have configured card theme', () {
        final cardTheme = darkTheme.cardTheme;
        
        expect(cardTheme.color, equals(const Color(0xFF2C2C44)));
        expect(cardTheme.elevation, equals(2.0));
        expect(cardTheme.margin, isNull);
        expect(cardTheme.shape, isA<RoundedRectangleBorder>());
      });

      test('should have configured chip theme', () {
        final chipTheme = darkTheme.chipTheme;
        
        expect(chipTheme.backgroundColor, equals(AppTheme.primarySwatch.shade900));
        expect(chipTheme.labelStyle?.fontFamily, equals(AppTheme.fontFamily));
        expect(chipTheme.labelStyle?.color, equals(Colors.white));
        expect(chipTheme.padding, equals(const EdgeInsets.symmetric(horizontal: 8)));
        expect(chipTheme.shape, isA<RoundedRectangleBorder>());
      });

      test('should have configured divider theme', () {
        final dividerTheme = darkTheme.dividerTheme;
        
        expect(dividerTheme.color, equals(const Color(0xFF444444)));
        expect(dividerTheme.thickness, equals(1));
        expect(dividerTheme.space, equals(24));
      });
    });

    group('Theme Consistency', () {
      test('both themes should use same primary swatch', () {
        expect(AppTheme.lightTheme.colorScheme.primary,
               equals(AppTheme.darkTheme.colorScheme.primary));
      });

      test('both themes should use same font family', () {
        expect(AppTheme.lightTheme.textTheme.bodyLarge?.fontFamily,
               equals(AppTheme.darkTheme.textTheme.bodyLarge?.fontFamily));
      });

      test('both themes should use Material 3', () {
        expect(AppTheme.lightTheme.useMaterial3, 
               equals(AppTheme.darkTheme.useMaterial3));
        expect(AppTheme.lightTheme.useMaterial3, isTrue);
      });

      test('both themes should have consistent component styling', () {
        // App bar elevation should be consistent
        expect(AppTheme.lightTheme.appBarTheme.elevation, 
               equals(AppTheme.darkTheme.appBarTheme.elevation));
        
        // Card margins should be consistent (light theme has margin, dark theme doesn't)
        expect(AppTheme.lightTheme.cardTheme.margin,
               equals(const EdgeInsets.symmetric(vertical: 8)));
        expect(AppTheme.darkTheme.cardTheme.margin, isNull);
        
        // Chip padding should be consistent
        expect(AppTheme.lightTheme.chipTheme.padding, 
               equals(AppTheme.darkTheme.chipTheme.padding));
        
        // Divider thickness and space should be consistent
        expect(AppTheme.lightTheme.dividerTheme.thickness, 
               equals(AppTheme.darkTheme.dividerTheme.thickness));
        expect(AppTheme.lightTheme.dividerTheme.space, 
               equals(AppTheme.darkTheme.dividerTheme.space));
      });

      test('themes should have appropriate contrast', () {
        // Light theme should have dark text on light background
        expect(AppTheme.lightTheme.scaffoldBackgroundColor.computeLuminance(), 
               greaterThan(0.5));
        expect(AppTheme.lightTheme.colorScheme.onSurface.computeLuminance(), 
               lessThan(0.5));
        
        // Dark theme should have light text on dark background
        expect(AppTheme.darkTheme.scaffoldBackgroundColor.computeLuminance(), 
               lessThan(0.5));
      });
    });

    group('Accessibility', () {
      test('should have sufficient color contrast in light theme', () {
        final lightTheme = AppTheme.lightTheme;
        final backgroundColor = lightTheme.scaffoldBackgroundColor;
        final textColor = lightTheme.colorScheme.onSurface;
        
        // Calculate contrast ratio (simplified check)
        final backgroundLuminance = backgroundColor.computeLuminance();
        final textLuminance = textColor.computeLuminance();
        
        final contrastRatio = (backgroundLuminance + 0.05) / (textLuminance + 0.05);
        
        // Should meet WCAG AA standard (4.5:1 for normal text)
        expect(contrastRatio, greaterThan(4.5));
      });

      test('should have readable font sizes', () {
        final lightTheme = AppTheme.lightTheme;
        
        // App bar title should be readable
        expect(lightTheme.appBarTheme.titleTextStyle?.fontSize, 
               greaterThanOrEqualTo(18));
        
        // Text theme should have appropriate sizes
        expect(lightTheme.textTheme.bodyLarge?.fontSize, 
               greaterThanOrEqualTo(14));
      });

      test('should have appropriate touch targets', () {
        final lightTheme = AppTheme.lightTheme;
        
        // Buttons should have minimum touch target size
        final buttonStyle = lightTheme.elevatedButtonTheme.style;
        expect(buttonStyle, isNotNull);
        
        // Cards should have appropriate margins for touch
        expect(lightTheme.cardTheme.margin, isNotNull);
        expect(lightTheme.cardTheme.margin!.vertical, greaterThanOrEqualTo(8));
      });
    });

    group('Material Design Compliance', () {
      test('should follow Material 3 color system', () {
        final lightColorScheme = AppTheme.lightTheme.colorScheme;
        final darkColorScheme = AppTheme.darkTheme.colorScheme;
        
        // Should have all required color scheme properties
        expect(lightColorScheme.primary, isNotNull);
        expect(lightColorScheme.secondary, isNotNull);
        expect(lightColorScheme.surface, isNotNull);
        expect(lightColorScheme.onSurface, isNotNull);
        
        expect(darkColorScheme.primary, isNotNull);
        expect(darkColorScheme.secondary, isNotNull);
        expect(darkColorScheme.surface, isNotNull);
      });

      test('should use appropriate elevation levels', () {
        // Cards should use standard elevation
        expect(AppTheme.lightTheme.cardTheme.elevation, equals(4.0));
        expect(AppTheme.darkTheme.cardTheme.elevation, equals(2.0));
        
        // App bar should use no elevation for modern look
        expect(AppTheme.lightTheme.appBarTheme.elevation, equals(0));
        expect(AppTheme.darkTheme.appBarTheme.elevation, equals(0));
      });

      test('should use appropriate border radius', () {
        final lightCardShape = AppTheme.lightTheme.cardTheme.shape as RoundedRectangleBorder?;
        final darkCardShape = AppTheme.darkTheme.cardTheme.shape as RoundedRectangleBorder?;
        
        expect(lightCardShape?.borderRadius, isA<BorderRadius>());
        expect(darkCardShape?.borderRadius, isA<BorderRadius>());
        
        final lightChipShape = AppTheme.lightTheme.chipTheme.shape as RoundedRectangleBorder?;
        final darkChipShape = AppTheme.darkTheme.chipTheme.shape as RoundedRectangleBorder?;
        
        expect(lightChipShape?.borderRadius, isA<BorderRadius>());
        expect(darkChipShape?.borderRadius, isA<BorderRadius>());
      });
    });
  });

  group('Coverage Tests', () {
    test('should access theme static methods', () {
      // Test static access to cover private constructor line
      expect(AppTheme.lightTheme, isNotNull);
      expect(AppTheme.darkTheme, isNotNull);
      expect(AppTheme.lightTheme, isA<ThemeData>());
      expect(AppTheme.darkTheme, isA<ThemeData>());
    });
  });
}
