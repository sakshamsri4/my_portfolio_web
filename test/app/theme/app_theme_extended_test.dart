import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/theme/app_theme.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  
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
      expect(theme.colorScheme.secondary, equals(AppTheme.primarySwatch.shade300));
      expect(theme.colorScheme.onSurface, equals(AppTheme.textPrimary));
      
      // Test app bar theme
      expect(theme.appBarTheme.backgroundColor, equals(Colors.white));
      expect(theme.appBarTheme.foregroundColor, equals(AppTheme.textPrimary));
      expect(theme.appBarTheme.elevation, equals(0));
      expect(theme.appBarTheme.centerTitle, isTrue);
      
      // Test button themes
      final elevatedButtonStyle = theme.elevatedButtonTheme.style;
      expect(elevatedButtonStyle?.backgroundColor?.resolve({}), equals(AppTheme.primarySwatch));
      expect(elevatedButtonStyle?.foregroundColor?.resolve({}), equals(Colors.white));
      
      final outlinedButtonStyle = theme.outlinedButtonTheme.style;
      expect(outlinedButtonStyle?.foregroundColor?.resolve({}), equals(AppTheme.primarySwatch));
      
      // Test card theme
      expect(theme.cardTheme.color, equals(Colors.white));
      expect(theme.cardTheme.elevation, equals(4));
      expect(theme.cardTheme.shape, isA<RoundedRectangleBorder>());
      
      // Test chip theme
      expect(theme.chipTheme.backgroundColor, equals(AppTheme.primarySwatch.shade100));
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
      expect(theme.colorScheme.secondary, equals(AppTheme.primarySwatch.shade300));
      expect(theme.colorScheme.surface, equals(const Color(0xFF2C2C44)));
      
      // Test app bar theme
      expect(theme.appBarTheme.backgroundColor, equals(const Color(0xFF2C2C44)));
      expect(theme.appBarTheme.foregroundColor, equals(Colors.white));
      expect(theme.appBarTheme.elevation, equals(0));
      
      // Test button themes
      final elevatedButtonStyle = theme.elevatedButtonTheme.style;
      expect(elevatedButtonStyle?.backgroundColor?.resolve({}), equals(AppTheme.primarySwatch));
      expect(elevatedButtonStyle?.foregroundColor?.resolve({}), equals(Colors.white));
      
      final outlinedButtonStyle = theme.outlinedButtonTheme.style;
      expect(outlinedButtonStyle?.foregroundColor?.resolve({}), equals(AppTheme.primarySwatch));
      
      // Test card theme
      expect(theme.cardTheme.color, equals(const Color(0xFF2C2C44)));
      expect(theme.cardTheme.elevation, equals(2));
      expect(theme.cardTheme.shape, isA<RoundedRectangleBorder>());
      
      // Test chip theme
      expect(theme.chipTheme.backgroundColor, equals(AppTheme.primarySwatch.shade900));
      expect(theme.chipTheme.shape, isA<RoundedRectangleBorder>());
    });
    
    test('text themes have correct styles', () {
      // Light theme text styles
      final lightTextTheme = AppTheme.lightTheme.textTheme;
      expect(lightTextTheme.displayLarge?.color, equals(AppTheme.textPrimary));
      expect(lightTextTheme.bodyMedium?.color, equals(AppTheme.textPrimary));
      expect(lightTextTheme.bodySmall?.color, equals(AppTheme.textSecondary));
      
      // Dark theme text styles
      final darkTextTheme = AppTheme.darkTheme.textTheme;
      expect(darkTextTheme.displayLarge?.color, equals(Colors.white));
      expect(darkTextTheme.bodyMedium?.color, equals(Colors.white));
      expect(darkTextTheme.bodySmall?.color, equals(Colors.white70));
    });
  });
}
