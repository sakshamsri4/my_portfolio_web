import 'package:flutter/material.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';
import 'package:my_portfolio_web/app/common/styles/app_gradients.dart';
import 'package:my_portfolio_web/app/common/styles/app_shadows.dart';

/// Shared box decorations for consistent UI across the app
class AppDecorations {
  /// Private constructor to prevent instantiation
  AppDecorations._();

  /// Standard card decoration
  static BoxDecoration get card => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.cardShadow,
      );

  /// Glassmorphic card decoration
  static BoxDecoration get glassmorphicCard => BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: AppGradients.glassmorphicGradient,
        border: Border.all(
          color: Colors.white.withAlpha(51), // 0.2 opacity
          width: 1.5,
        ),
      );

  /// Elevated card decoration with dynamic elevation
  static BoxDecoration elevatedCard(
    double elevation, {
    Color? accentColor,
  }) =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          ...AppShadows.elevatedShadow(elevation),
          if (accentColor != null)
            AppShadows.coloredGlow(
              color: accentColor,
              opacity: 0.2 + (elevation * 0.1),
              blurRadius: 12 + (elevation * 3),
            ),
        ],
      );

  /// Chip decoration
  static BoxDecoration get chip => BoxDecoration(
        color: Colors.white.withAlpha(38), // 0.15 opacity
        borderRadius: BorderRadius.circular(12),
      );

  /// Button decoration
  static BoxDecoration get button => BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8),
        boxShadow: AppShadows.cardShadow,
      );

  /// Ghost button decoration
  static BoxDecoration get ghostButton => BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.primary,
          width: 1.5,
        ),
      );

  /// Section underline decoration
  static BoxDecoration get sectionUnderline => BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(1),
      );

  /// NeoPOP button decoration
  static BoxDecoration get neoPOPButton => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.primary,
          width: 2,
        ),
      );
}
