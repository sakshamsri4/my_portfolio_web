import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const MaterialColor primarySwatch = MaterialColor(
    0xFF10B981,
    <int, Color>{
      50: Color(0xFFE6FFF5),
      100: Color(0xFFC5FDE6),
      200: Color(0xFF92F9D0),
      300: Color(0xFF5EF3B6),
      400: Color(0xFF34E89A),
      500: Color(0xFF10B981),
      600: Color(0xFF0DA36F),
      700: Color(0xFF0A8B5C),
      800: Color(0xFF0A744E),
      900: Color(0xFF0B5E40),
    },
  );

  static const Color backgroundColor = Color(0xFFF8FAFC);
  static const Color textPrimary = Color(0xFF0B1221);
  static const Color textSecondary = Color(0xFF475569);

  static final TextTheme _darkTextTheme = GoogleFonts.interTextTheme().copyWith(
    displayLarge: GoogleFonts.spaceGrotesk(
      fontWeight: FontWeight.w800,
      fontSize: 34,
      color: Colors.white,
    ),
    displayMedium: GoogleFonts.spaceGrotesk(
      fontWeight: FontWeight.w800,
      fontSize: 30,
      color: Colors.white,
    ),
    displaySmall: GoogleFonts.spaceGrotesk(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.white,
    ),
    headlineMedium: GoogleFonts.spaceGrotesk(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: Colors.white,
    ),
    headlineSmall: GoogleFonts.spaceGrotesk(
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: Colors.white,
    ),
    titleLarge: GoogleFonts.spaceGrotesk(
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: Colors.white,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 16,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14,
      color: Colors.white,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 12,
      color: Colors.white70,
    ),
  );

  static final TextTheme _lightTextTheme =
      GoogleFonts.interTextTheme().copyWith(
    displayLarge: GoogleFonts.spaceGrotesk(
      fontWeight: FontWeight.w800,
      fontSize: 32,
      color: textPrimary,
    ),
    displayMedium: GoogleFonts.spaceGrotesk(
      fontWeight: FontWeight.w800,
      fontSize: 28,
      color: textPrimary,
    ),
    displaySmall: GoogleFonts.spaceGrotesk(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: textPrimary,
    ),
    headlineMedium: GoogleFonts.spaceGrotesk(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: textPrimary,
    ),
    headlineSmall: GoogleFonts.spaceGrotesk(
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: textPrimary,
    ),
    titleLarge: GoogleFonts.spaceGrotesk(
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: textPrimary,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 16,
      color: textPrimary,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14,
      color: textPrimary,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 12,
      color: textSecondary,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primarySwatch: primarySwatch,
    primaryColor: primarySwatch,
    scaffoldBackgroundColor: const Color(0xFF0B1221),
    colorScheme: ColorScheme.dark(
      primary: primarySwatch,
      secondary: primarySwatch.shade200,
      surface: const Color(0xFF0F172A),
      background: const Color(0xFF0B1221),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: GoogleFonts.spaceGrotesk(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: Colors.white,
      ),
    ),
    textTheme: _darkTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primarySwatch,
        foregroundColor: Colors.black,
        textStyle: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.w700),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: BorderSide(color: Colors.white.withAlpha(80)),
        textStyle: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.w700),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    cardTheme: CardThemeData(
      color: const Color(0xFF111827),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: primarySwatch.shade900,
      labelStyle: GoogleFonts.inter(color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: Color(0xFF334155),
      thickness: 1,
      space: 24,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primarySwatch: primarySwatch,
    primaryColor: primarySwatch,
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: ColorScheme.light(
      primary: primarySwatch,
      secondary: primarySwatch.shade200,
      onSurface: textPrimary,
      onSecondary: Colors.white,
      background: backgroundColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: textPrimary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.spaceGrotesk(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: textPrimary,
      ),
      iconTheme: const IconThemeData(color: primarySwatch),
    ),
    textTheme: _lightTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primarySwatch,
        foregroundColor: Colors.black,
        textStyle: GoogleFonts.spaceGrotesk(
          fontWeight: FontWeight.w700,
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
        textStyle: GoogleFonts.spaceGrotesk(
          fontWeight: FontWeight.w700,
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
      shadowColor: primarySwatch.withAlpha(51),
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: primarySwatch.shade100,
      labelStyle: GoogleFonts.inter(color: primarySwatch.shade800),
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
