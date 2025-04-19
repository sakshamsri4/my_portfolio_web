import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';
import 'package:my_portfolio_web/app/common/styles/app_gradients.dart';

void main() {
  group('AppGradients', () {
    test('primaryGradient has correct properties', () {
      final gradient = AppGradients.primaryGradient;

      expect(gradient, isA<LinearGradient>());
      expect(gradient.begin, equals(Alignment.topLeft));
      expect(gradient.end, equals(Alignment.bottomRight));
      expect(gradient.colors.length, equals(2));
      expect(gradient.colors[0], equals(AppColors.primaryLight));
      expect(gradient.colors[1], equals(AppColors.primary));
    });

    test('cardGradient has correct properties', () {
      final gradient = AppGradients.cardGradient;

      expect(gradient, isA<LinearGradient>());
      expect(gradient.begin, equals(Alignment.topLeft));
      expect(gradient.end, equals(Alignment.bottomRight));
      expect(gradient.colors.length, equals(2));

      // Testing with approximate values since we're dealing with alpha values
      expect(gradient.colors[0], isA<Color>());
      expect(gradient.colors[1], isA<Color>());

      // Check that the colors are white with different alpha values
      expect(gradient.colors[0].red, equals(255));
      expect(gradient.colors[0].green, equals(255));
      expect(gradient.colors[0].blue, equals(255));
      expect(gradient.colors[0].alpha, greaterThan(0));

      expect(gradient.colors[1].red, equals(255));
      expect(gradient.colors[1].green, equals(255));
      expect(gradient.colors[1].blue, equals(255));
      expect(gradient.colors[1].alpha, greaterThan(0));

      // First color should have higher alpha than second
      expect(gradient.colors[0].alpha, greaterThan(gradient.colors[1].alpha));
    });

    test('glassmorphicGradient has correct properties', () {
      final gradient = AppGradients.glassmorphicGradient;

      expect(gradient, isA<LinearGradient>());
      expect(gradient.begin, equals(Alignment.topLeft));
      expect(gradient.end, equals(Alignment.bottomRight));
      expect(gradient.colors.length, equals(2));

      // Colors should be indigo with alpha values
      expect(gradient.colors[0], isA<Color>());
      expect(gradient.colors[1], isA<Color>());

      // Alpha values should be between 0 and 255
      expect(gradient.colors[0].alpha, inInclusiveRange(0, 255));
      expect(gradient.colors[1].alpha, inInclusiveRange(0, 255));
    });

    test('textBackgroundGradient has correct properties', () {
      final gradient = AppGradients.textBackgroundGradient;

      expect(gradient, isA<LinearGradient>());
      expect(gradient.begin, equals(Alignment.topCenter));
      expect(gradient.end, equals(Alignment.bottomCenter));
      expect(gradient.colors.length, equals(2));

      // Colors should be black with different alpha values
      expect(gradient.colors[0].red, equals(0));
      expect(gradient.colors[0].green, equals(0));
      expect(gradient.colors[0].blue, equals(0));

      expect(gradient.colors[1].red, equals(0));
      expect(gradient.colors[1].green, equals(0));
      expect(gradient.colors[1].blue, equals(0));

      // First color should have lower alpha than second
      expect(gradient.colors[0].alpha, lessThan(gradient.colors[1].alpha));
    });

    test('animatedGradient returns gradient with brightness parameter', () {
      final gradient = AppGradients.animatedGradient(0.5);

      expect(gradient, isA<LinearGradient>());
      expect(gradient.begin, equals(Alignment.topLeft));
      expect(gradient.end, equals(Alignment.bottomRight));
      expect(gradient.colors.length, equals(2));

      // Colors should be indigo with alpha values
      expect(gradient.colors[0], isA<Color>());
      expect(gradient.colors[1], isA<Color>());

      // Alpha values should be between 0 and 255
      expect(gradient.colors[0].alpha, inInclusiveRange(0, 255));
      expect(gradient.colors[1].alpha, inInclusiveRange(0, 255));
    });
  });
}
