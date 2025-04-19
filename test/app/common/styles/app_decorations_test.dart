import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';
import 'package:my_portfolio_web/app/common/styles/app_decorations.dart';
import 'package:my_portfolio_web/app/common/styles/app_gradients.dart';
import 'package:my_portfolio_web/app/common/styles/app_shadows.dart';

void main() {
  group('AppDecorations', () {
    test('card decoration has correct properties', () {
      final decoration = AppDecorations.card;

      expect(decoration, isA<BoxDecoration>());
      expect(decoration.color, equals(Colors.white));
      expect(decoration.borderRadius, isA<BorderRadius>());
      expect(
        (decoration.borderRadius! as BorderRadius).topLeft,
        equals(const Radius.circular(16)),
      );
      expect(decoration.boxShadow, equals(AppShadows.cardShadow));
    });

    test('glassmorphicCard decoration has correct properties', () {
      final decoration = AppDecorations.glassmorphicCard;

      expect(decoration, isA<BoxDecoration>());
      expect(decoration.gradient, equals(AppGradients.glassmorphicGradient));
      expect(decoration.borderRadius, isA<BorderRadius>());
      expect(
        (decoration.borderRadius! as BorderRadius).topLeft,
        equals(const Radius.circular(20)),
      );
      expect(decoration.border, isA<Border>());

      // Check border properties
      final border = decoration.border! as Border;
      expect(border.top.width, equals(1.5));
      expect(border.top.color.alpha, lessThan(255)); // Semi-transparent
      expect(border.top.color.red, equals(255)); // White with alpha
      expect(border.top.color.green, equals(255));
      expect(border.top.color.blue, equals(255));
    });

    test('elevatedCard decoration has correct properties', () {
      final decoration = AppDecorations.elevatedCard(2);

      expect(decoration, isA<BoxDecoration>());
      expect(decoration.borderRadius, isA<BorderRadius>());
      expect(decoration.boxShadow, isNotNull);
      expect(decoration.boxShadow!.length, greaterThan(0));
    });

    test('chip decoration has correct properties', () {
      final decoration = AppDecorations.chip;

      expect(decoration, isA<BoxDecoration>());
      expect(decoration.color, isA<Color>());
      expect(decoration.borderRadius, isA<BorderRadius>());
      expect(
        (decoration.borderRadius! as BorderRadius).topLeft,
        equals(const Radius.circular(12)),
      );
    });

    test('button decoration has correct properties', () {
      final decoration = AppDecorations.button;

      expect(decoration, isA<BoxDecoration>());
      expect(decoration.color, equals(AppColors.primary));
      expect(decoration.borderRadius, isA<BorderRadius>());
      expect(decoration.boxShadow, isNotNull);
    });

    test('ghostButton decoration has correct properties', () {
      final decoration = AppDecorations.ghostButton;

      expect(decoration, isA<BoxDecoration>());
      expect(decoration.color, equals(Colors.transparent));
      expect(decoration.borderRadius, isA<BorderRadius>());
      expect(decoration.border, isA<Border>());

      // Check border properties
      final border = decoration.border! as Border;
      expect(border.top.width, equals(1.5));
      expect(border.top.color, equals(AppColors.primary));
    });

    test('sectionUnderline decoration has correct properties', () {
      final decoration = AppDecorations.sectionUnderline;

      expect(decoration, isA<BoxDecoration>());
      expect(decoration.color, equals(AppColors.primary));
      expect(decoration.borderRadius, isA<BorderRadius>());
    });

    test('neoPOPButton decoration has correct properties', () {
      final decoration = AppDecorations.neoPOPButton;

      expect(decoration, isA<BoxDecoration>());
      expect(decoration.color, equals(Colors.white));
      expect(decoration.borderRadius, isA<BorderRadius>());
      expect(decoration.border, isA<Border>());

      // Check border properties
      final border = decoration.border! as Border;
      expect(border.top.width, equals(2.0));
      expect(border.top.color, equals(AppColors.primary));
    });
  });
}
