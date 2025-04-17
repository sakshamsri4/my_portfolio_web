import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  // Primary color swatch
  static const MaterialColor primarySwatch = MaterialColor(
    0xFF675AF2, // Primary color
    <int, Color>{
      50: Color(0xFFEEECFD),
      100: Color(0xFFD4D0FA),
      200: Color(0xFFB7B0F7),
      300: Color(0xFF9A90F4),
      400: Color(0xFF8479F3),
      500: Color(0xFF675AF2), // Primary color
      600: Color(0xFF5F52F1),
      700: Color(0xFF5448EF),
      800: Color(0xFF4A3FEE),
      900: Color(0xFF392EEC),
    },
  );

  // Background color
  static const Color backgroundColor = Color(0xFFF4F0FF);

  // Text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textLight = Color(0xFF999999);

  // Dark theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primarySwatch: primarySwatch,
    primaryColor: primarySwatch,
    scaffoldBackgroundColor: const Color(0xFF1A1A2E),
    colorScheme: ColorScheme.dark(
      primary: primarySwatch,
      secondary: primarySwatch.shade300,
      background: const Color(0xFF1A1A2E),
      surface: const Color(0xFF2C2C44),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF2C2C44),
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 32,
        color: Colors.white,
      ),
      displayMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: Colors.white,
      ),
      displaySmall: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Colors.white,
      ),
      headlineMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
      headlineSmall: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.white,
      ),
      titleLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 16,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 14,
        color: Colors.white,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: 12,
        color: Colors.white70,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primarySwatch,
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.montserrat(
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
        side: BorderSide(color: primarySwatch),
        textStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: const Color(0xFF2C2C44),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: primarySwatch.shade900,
      labelStyle: GoogleFonts.montserrat(
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
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
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: ColorScheme.light(
      primary: primarySwatch,
      secondary: primarySwatch.shade300,
      background: backgroundColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primarySwatch,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 32,
        color: textPrimary,
      ),
      displayMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: textPrimary,
      ),
      displaySmall: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: textPrimary,
      ),
      headlineMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: textPrimary,
      ),
      headlineSmall: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: textPrimary,
      ),
      titleLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: textPrimary,
      ),
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 16,
        color: textPrimary,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 14,
        color: textPrimary,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: 12,
        color: textSecondary,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primarySwatch,
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.montserrat(
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
        side: BorderSide(color: primarySwatch),
        textStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: primarySwatch.shade100,
      labelStyle: GoogleFonts.montserrat(
        color: primarySwatch.shade800,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
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
