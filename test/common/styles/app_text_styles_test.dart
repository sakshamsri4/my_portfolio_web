import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';
import 'package:my_portfolio_web/app/common/styles/app_shadows.dart';
import 'package:my_portfolio_web/app/common/styles/app_text_styles.dart';

void main() {
  group('AppTextStyles', () {
    test('h1 should have correct properties', () {
      final style = AppTextStyles.h1;

      expect(style.fontSize, equals(48));
      expect(style.fontWeight, equals(FontWeight.bold));
      expect(style.letterSpacing, equals(-1));
      expect(style.color, equals(AppColors.textPrimary));
    });

    test('h2 should have correct properties', () {
      final style = AppTextStyles.h2;

      expect(style.fontSize, equals(36));
      expect(style.fontWeight, equals(FontWeight.bold));
      expect(style.letterSpacing, equals(-0.5));
      expect(style.color, equals(AppColors.textPrimary));
    });

    test('h3 should have correct properties', () {
      final style = AppTextStyles.h3;

      expect(style.fontSize, equals(24));
      expect(style.fontWeight, equals(FontWeight.bold));
      expect(style.letterSpacing, equals(-0.3));
      expect(style.color, equals(AppColors.textPrimary));
    });

    test('body should have correct properties', () {
      final style = AppTextStyles.body;

      expect(style.fontSize, equals(16));
      expect(style.height, equals(1.5));
      expect(style.color, equals(AppColors.textSecondary));
    });

    test('caption should have correct properties', () {
      final style = AppTextStyles.caption;

      expect(style.fontSize, equals(14));
      expect(style.height, equals(1.4));
      expect(style.color, equals(AppColors.textTertiary));
    });

    test('button should have correct properties', () {
      final style = AppTextStyles.button;

      expect(style.fontSize, equals(16));
      expect(style.fontWeight, equals(FontWeight.w600));
      expect(style.letterSpacing, equals(0.5));
      expect(style.color, equals(Colors.white));
    });

    test('cardTitle should have correct properties', () {
      final style = AppTextStyles.cardTitle;

      expect(style.fontSize, equals(20));
      expect(style.fontWeight, equals(FontWeight.w600));
      expect(style.color, equals(Colors.white));
      expect(style.letterSpacing, equals(-0.2));
    });

    test('cardTitleWithShadow should have correct properties', () {
      final style = AppTextStyles.cardTitleWithShadow;
      final baseStyle = AppTextStyles.cardTitle;

      expect(style.fontSize, equals(baseStyle.fontSize));
      expect(style.fontWeight, equals(baseStyle.fontWeight));
      expect(style.color, equals(baseStyle.color));
      expect(style.letterSpacing, equals(baseStyle.letterSpacing));
      expect(style.shadows, equals(AppShadows.headingTextShadow));
    });

    test('cardDescription should have correct properties', () {
      final style = AppTextStyles.cardDescription;

      expect(style.fontSize, equals(14));
      expect(style.color, equals(Colors.white));
      expect(style.height, equals(1.4));
      expect(style.letterSpacing, equals(0.1));
    });

    test('cardDescriptionWithShadow should have correct properties', () {
      final style = AppTextStyles.cardDescriptionWithShadow;
      final baseStyle = AppTextStyles.cardDescription;

      expect(style.fontSize, equals(baseStyle.fontSize));
      expect(style.color, equals(baseStyle.color));
      expect(style.height, equals(baseStyle.height));
      expect(style.letterSpacing, equals(baseStyle.letterSpacing));
      expect(style.shadows, equals(AppShadows.textShadow));
    });

    test('sectionTitle should have correct properties', () {
      final style = AppTextStyles.sectionTitle;

      expect(style.fontSize, equals(32));
      expect(style.fontWeight, equals(FontWeight.bold));
      expect(style.letterSpacing, equals(-0.5));
      expect(style.color, equals(AppColors.textPrimary));
    });

    test('sectionSubtitle should have correct properties', () {
      final style = AppTextStyles.sectionSubtitle;

      expect(style.fontSize, equals(18));
      expect(style.height, equals(1.5));
      expect(style.color, equals(AppColors.textSecondary));
    });
  });
}
