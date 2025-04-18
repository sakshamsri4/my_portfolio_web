import 'package:flutter/material.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';
import 'package:my_portfolio_web/app/common/styles/app_shadows.dart';

/// Shared text styles for consistent typography across the app
class AppTextStyles {
  /// Private constructor to prevent instantiation
  AppTextStyles._();

  /// Heading 1 style
  static TextStyle get h1 => const TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        letterSpacing: -1,
        color: AppColors.textPrimary,
      );

  /// Heading 2 style
  static TextStyle get h2 => const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
        color: AppColors.textPrimary,
      );

  /// Heading 3 style
  static TextStyle get h3 => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.3,
        color: AppColors.textPrimary,
      );

  /// Body text style
  static TextStyle get body => const TextStyle(
        fontSize: 16,
        height: 1.5,
        color: AppColors.textSecondary,
      );

  /// Caption text style
  static TextStyle get caption => const TextStyle(
        fontSize: 14,
        height: 1.4,
        color: AppColors.textTertiary,
      );

  /// Button text style
  static TextStyle get button => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        color: Colors.white,
      );

  /// Card title style
  static TextStyle get cardTitle => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: -0.2,
      );

  /// Card title with shadow for better readability on images
  static TextStyle get cardTitleWithShadow => cardTitle.copyWith(
        shadows: AppShadows.headingTextShadow,
      );

  /// Card description style
  static TextStyle get cardDescription => const TextStyle(
        fontSize: 14,
        color: Colors.white,
        height: 1.4,
        letterSpacing: 0.1,
      );

  /// Card description with shadow for better readability on images
  static TextStyle get cardDescriptionWithShadow => cardDescription.copyWith(
        shadows: AppShadows.textShadow,
      );

  /// Section title style
  static TextStyle get sectionTitle => const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
        color: AppColors.textPrimary,
      );

  /// Section subtitle style
  static TextStyle get sectionSubtitle => const TextStyle(
        fontSize: 18,
        height: 1.5,
        color: AppColors.textSecondary,
      );
}
