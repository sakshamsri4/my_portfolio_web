import 'package:flutter/material.dart';

/// Shared shadow styles for consistent UI across the app
class AppShadows {
  /// Private constructor to prevent instantiation
  AppShadows._();

  /// Standard elevation shadow for cards
  static List<BoxShadow> get cardShadow => [
        const BoxShadow(
          color: Color.fromARGB(76, 0, 0, 0), // 0.3 opacity
          blurRadius: 8,
          spreadRadius: 2,
          offset: Offset(0, 4),
        ),
      ];

  /// Elevated shadow for hover effects
  static List<BoxShadow> elevatedShadow(double elevation) => [
        BoxShadow(
          color: const Color.fromARGB(76, 0, 0, 0), // 0.3 opacity
          blurRadius: 8 + (elevation * 2),
          spreadRadius: 2 + elevation,
          offset: Offset(0, 4 + elevation),
        ),
      ];

  /// Colored glow shadow
  static BoxShadow coloredGlow({
    required Color color,
    double opacity = 0.2,
    double blurRadius = 12,
    double spreadRadius = -2,
    Offset offset = const Offset(0, 2),
  }) {
    // Create a color with the specified opacity
    final colorWithOpacity = color.withAlpha((opacity * 255).round());

    return BoxShadow(
      color: colorWithOpacity,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
      offset: offset,
    );
  }

  /// Text shadow for better readability on images
  static List<Shadow> get textShadow => const [
        Shadow(
          color: Color.fromARGB(200, 0, 0, 0),
          offset: Offset(0, 1),
          blurRadius: 3,
        ),
      ];

  /// Stronger text shadow for headings on images
  static List<Shadow> get headingTextShadow => const [
        Shadow(
          color: Color.fromARGB(200, 0, 0, 0),
          offset: Offset(0, 1),
          blurRadius: 4,
        ),
      ];

  /// NeoPOP shadow effect for buttons
  static BoxShadow neoPOPShadow({
    Color color = Colors.black,
    Offset offset = const Offset(4, 4),
  }) {
    return BoxShadow(
      color: color,
      offset: offset,
    );
  }
}
