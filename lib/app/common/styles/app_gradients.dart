import 'package:flutter/material.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';

/// Shared gradient styles for consistent UI across the app
class AppGradients {
  /// Private constructor to prevent instantiation
  AppGradients._();

  /// Primary gradient for backgrounds
  static LinearGradient get primaryGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppColors.primaryLight,
          AppColors.primary,
        ],
      );

  /// Subtle gradient for cards
  static LinearGradient get cardGradient => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withAlpha(13), // 0.05 opacity (255 * 0.05 = 12.75)
          Colors.white.withAlpha(5), // 0.02 opacity (255 * 0.02 = 5.1)
        ],
      );

  /// Glassmorphic overlay gradient
  static LinearGradient get glassmorphicGradient => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: const [0.0, 1.0],
        colors: [
          Colors.indigo.shade900.withAlpha(40),
          Colors.indigo.shade800.withAlpha(60),
        ],
      );

  /// Text background gradient for better readability
  static LinearGradient get textBackgroundGradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.black.withAlpha(0),
          Colors.black.withAlpha(150),
        ],
      );

  /// Animated gradient for hover effects
  static LinearGradient animatedGradient(double brightness) => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: const [0.0, 1.0],
        colors: [
          Colors.indigo.shade900.withAlpha(40 - (brightness * 40).toInt()),
          Colors.indigo.shade800.withAlpha(60 - (brightness * 60).toInt()),
        ],
      );
}
