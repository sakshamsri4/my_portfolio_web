import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';
import 'package:my_portfolio_web/app/common/styles/app_text_styles.dart';

void main() {
  group('AppTextStyles', () {
    test('h1 has correct properties', () {
      final style = AppTextStyles.h1;

      expect(style, isA<TextStyle>());
      expect(style.fontSize, equals(48));
      expect(style.fontWeight, equals(FontWeight.bold));
      expect(style.color, equals(AppColors.textPrimary));
    });

    test('h2 has correct properties', () {
      final style = AppTextStyles.h2;

      expect(style, isA<TextStyle>());
      expect(style.fontSize, equals(36));
      expect(style.fontWeight, equals(FontWeight.bold));
      expect(style.color, equals(AppColors.textPrimary));
    });

    test('h3 has correct properties', () {
      final style = AppTextStyles.h3;

      expect(style, isA<TextStyle>());
      expect(style.fontSize, equals(24));
      expect(style.fontWeight, equals(FontWeight.bold));
      expect(style.color, equals(AppColors.textPrimary));
    });

    test('body has correct properties', () {
      final style = AppTextStyles.body;

      expect(style, isA<TextStyle>());
      expect(style.fontSize, equals(16));
      expect(style.height, equals(1.5));
      expect(style.color, equals(AppColors.textSecondary));
    });

    test('caption has correct properties', () {
      final style = AppTextStyles.caption;

      expect(style, isA<TextStyle>());
      expect(style.fontSize, equals(14));
      expect(style.height, equals(1.4));
      expect(style.color, equals(AppColors.textTertiary));
    });

    test('button has correct properties', () {
      final style = AppTextStyles.button;

      expect(style, isA<TextStyle>());
      expect(style.fontSize, equals(16));
      expect(style.fontWeight, equals(FontWeight.w600));
      expect(style.letterSpacing, equals(0.5));
      expect(style.color, equals(Colors.white));
    });

    test('cardTitle has correct properties', () {
      final style = AppTextStyles.cardTitle;

      expect(style, isA<TextStyle>());
      expect(style.fontSize, equals(20));
      expect(style.fontWeight, equals(FontWeight.w600));
      expect(style.color, equals(Colors.white));
      expect(style.letterSpacing, equals(-0.2));
    });

    test('cardTitleWithShadow has shadows', () {
      final style = AppTextStyles.cardTitleWithShadow;

      expect(style, isA<TextStyle>());
      expect(style.shadows, isNotNull);
      expect(style.shadows, isNotEmpty);
    });

    test('cardDescription has correct properties', () {
      final style = AppTextStyles.cardDescription;

      expect(style, isA<TextStyle>());
      expect(style.fontSize, equals(14));
      expect(style.color, equals(Colors.white));
      expect(style.height, equals(1.4));
      expect(style.letterSpacing, equals(0.1));
    });

    test('cardDescriptionWithShadow has shadows', () {
      final style = AppTextStyles.cardDescriptionWithShadow;

      expect(style, isA<TextStyle>());
      expect(style.shadows, isNotNull);
      expect(style.shadows, isNotEmpty);
    });

    test('sectionTitle has correct properties', () {
      final style = AppTextStyles.sectionTitle;

      expect(style, isA<TextStyle>());
      expect(style.fontSize, equals(32));
      expect(style.fontWeight, equals(FontWeight.bold));
      expect(style.letterSpacing, equals(-0.5));
      expect(style.color, equals(AppColors.textPrimary));
    });

    test('sectionSubtitle has correct properties', () {
      final style = AppTextStyles.sectionSubtitle;

      expect(style, isA<TextStyle>());
      expect(style.fontSize, equals(18));
      expect(style.height, equals(1.5));
      expect(style.color, equals(AppColors.textSecondary));
    });
  });
}
