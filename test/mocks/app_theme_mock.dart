import 'package:flutter/material.dart';
import 'package:my_portfolio_web/app/theme/app_theme.dart';
import '../mocks/google_fonts_mock.dart';

/// A mock version of AppTheme for testing
class AppThemeMock {
  // Private constructor to prevent instantiation
  AppThemeMock._();

  // Light theme with mock Google Fonts
  static ThemeData get lightTheme {
    final originalTheme = AppTheme.lightTheme;

    return ThemeData(
      useMaterial3: originalTheme.useMaterial3,
      primarySwatch: AppTheme.primarySwatch,
      primaryColor: AppTheme.primarySwatch,
      scaffoldBackgroundColor: AppTheme.backgroundColor,
      colorScheme: originalTheme.colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: mockMontserrat(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: AppTheme.textPrimary,
        ),
        iconTheme: const IconThemeData(color: AppTheme.primarySwatch),
      ),
      textTheme: TextTheme(
        displayLarge: mockMontserrat(
          fontWeight: FontWeight.bold,
          fontSize: 32,
          color: AppTheme.textPrimary,
        ),
        displayMedium: mockMontserrat(
          fontWeight: FontWeight.bold,
          fontSize: 28,
          color: AppTheme.textPrimary,
        ),
        displaySmall: mockMontserrat(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: AppTheme.textPrimary,
        ),
        headlineMedium: mockMontserrat(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: AppTheme.textPrimary,
        ),
        headlineSmall: mockMontserrat(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: AppTheme.textPrimary,
        ),
        titleLarge: mockMontserrat(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: AppTheme.textPrimary,
        ),
        bodyLarge: mockMontserrat(
          fontSize: 16,
          color: AppTheme.textPrimary,
        ),
        bodyMedium: mockMontserrat(
          fontSize: 14,
          color: AppTheme.textPrimary,
        ),
        bodySmall: mockMontserrat(
          fontSize: 12,
          color: AppTheme.textSecondary,
        ),
      ),
      elevatedButtonTheme: originalTheme.elevatedButtonTheme,
      outlinedButtonTheme: originalTheme.outlinedButtonTheme,
      iconButtonTheme: originalTheme.iconButtonTheme,
      cardTheme: originalTheme.cardTheme,
      chipTheme: ChipThemeData(
        backgroundColor: AppTheme.primarySwatch.shade100,
        labelStyle: mockMontserrat(
          color: AppTheme.primarySwatch.shade800,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      dividerTheme: originalTheme.dividerTheme,
    );
  }

  // Dark theme with mock Google Fonts
  static ThemeData get darkTheme {
    final originalTheme = AppTheme.darkTheme;

    return ThemeData(
      useMaterial3: originalTheme.useMaterial3,
      brightness: Brightness.dark,
      primarySwatch: AppTheme.primarySwatch,
      primaryColor: AppTheme.primarySwatch,
      scaffoldBackgroundColor: const Color(0xFF1A1A2E),
      colorScheme: originalTheme.colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF2C2C44),
        foregroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: mockMontserrat(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: mockMontserrat(
          fontWeight: FontWeight.bold,
          fontSize: 32,
          color: Colors.white,
        ),
        displayMedium: mockMontserrat(
          fontWeight: FontWeight.bold,
          fontSize: 28,
          color: Colors.white,
        ),
        displaySmall: mockMontserrat(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.white,
        ),
        headlineMedium: mockMontserrat(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
        headlineSmall: mockMontserrat(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.white,
        ),
        titleLarge: mockMontserrat(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.white,
        ),
        bodyLarge: mockMontserrat(
          fontSize: 16,
          color: Colors.white,
        ),
        bodyMedium: mockMontserrat(
          fontSize: 14,
          color: Colors.white,
        ),
        bodySmall: mockMontserrat(
          fontSize: 12,
          color: Colors.white70,
        ),
      ),
      elevatedButtonTheme: originalTheme.elevatedButtonTheme,
      outlinedButtonTheme: originalTheme.outlinedButtonTheme,
      cardTheme: originalTheme.cardTheme,
      chipTheme: ChipThemeData(
        backgroundColor: AppTheme.primarySwatch.shade900,
        labelStyle: mockMontserrat(
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      dividerTheme: originalTheme.dividerTheme,
    );
  }
}
