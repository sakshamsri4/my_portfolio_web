import 'package:flutter/material.dart';

class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  // Define a system font stack that works across all platforms
  static const String fontFamily =
      '.SF Pro Text, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica, Arial, sans-serif';

  // Primary color swatch
  static const MaterialColor primarySwatch = MaterialColor(
    0xFF1D4ED8, // Deep blue for a more timeless palette
    <int, Color>{
      50: Color(0xFFEFF6FF),
      100: Color(0xFFDBEAFE),
      200: Color(0xFFBFDBFE),
      300: Color(0xFF93C5FD),
      400: Color(0xFF60A5FA),
      500: Color(0xFF3B82F6),
      600: Color(0xFF2563EB),
      700: Color(0xFF1D4ED8), // Primary color
      800: Color(0xFF1E40AF),
      900: Color(0xFF1E3A8A),
    },
  );

  // Background color
  static const Color backgroundColor = Color(0xFFF9FAFB);

  // Text colors
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF4B5563);
  static const Color textLight = Color(0xFF6B7280);

  // Dark theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primarySwatch: primarySwatch,
    primaryColor: primarySwatch,
    fontFamily: fontFamily, // Set the global font family
    scaffoldBackgroundColor: const Color(0xFF0F172A),
    colorScheme: ColorScheme.dark(
      primary: primarySwatch,
      secondary: primarySwatch.shade300,
      surface: const Color(0xFF111827),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF111827),
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 32,
        color: Colors.white,
      ),
      displayMedium: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: Colors.white,
      ),
      displaySmall: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Colors.white,
      ),
      headlineMedium: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
      headlineSmall: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.white,
      ),
      titleLarge: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Colors.white,
      ),
      bodyLarge: const TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        color: Colors.white,
      ),
      bodyMedium: const TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        color: Colors.white,
      ),
      bodySmall: const TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        color: Colors.white70,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primarySwatch,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.bold,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primarySwatch,
        side: const BorderSide(color: primarySwatch),
        textStyle: const TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.bold,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    cardTheme: CardThemeData(
      color: const Color(0xFF2C2C44),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: primarySwatch.shade900,
      labelStyle: TextStyle(
        // Removed const here since we use non-constant values
        fontFamily: fontFamily,
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: Color(0xFF444444),
      thickness: 1,
      space: 24,
    ),
  );

  // Light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primarySwatch: primarySwatch,
    primaryColor: primarySwatch,
    fontFamily: fontFamily, // Set the global font family
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: ColorScheme.light(
      primary: primarySwatch,
      secondary: primarySwatch.shade300,
      onSurface: textPrimary,
      onSecondary: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: textPrimary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: textPrimary,
      ),
      iconTheme: const IconThemeData(color: primarySwatch),
    ),
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 32,
        color: textPrimary,
      ),
      displayMedium: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: textPrimary,
      ),
      displaySmall: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: textPrimary,
      ),
      headlineMedium: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: textPrimary,
      ),
      headlineSmall: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: textPrimary,
      ),
      titleLarge: const TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: textPrimary,
      ),
      bodyLarge: const TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        color: textPrimary,
      ),
      bodyMedium: const TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        color: textPrimary,
      ),
      bodySmall: const TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        color: textSecondary,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primarySwatch,
        foregroundColor: Colors.white,
        elevation: 4,
        shadowColor: primarySwatch.withAlpha(51),
        textStyle: const TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          letterSpacing: 0.5,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primarySwatch,
        side: const BorderSide(color: primarySwatch, width: 2),
        textStyle: const TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          letterSpacing: 0.5,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: primarySwatch,
        backgroundColor: primarySwatch.shade50,
        padding: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 4,
      shadowColor: primarySwatch.withAlpha(51), // 20% opacity (51/255)
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: primarySwatch.shade100,
      labelStyle: TextStyle(
        // Removed const here since we're using non-constant values
        fontFamily: fontFamily,
        color: primarySwatch.shade800,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: Color(0xFFEEEEEE),
      thickness: 1,
      space: 24,
    ),
  );
}
