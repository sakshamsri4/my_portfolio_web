import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/common/styles/app_animations.dart';

void main() {
  group('AppAnimations', () {
    test('duration constants have correct values', () {
      expect(
        AppAnimations.standardDuration,
        equals(const Duration(milliseconds: 300)),
      );
      expect(
        AppAnimations.longDuration,
        equals(const Duration(milliseconds: 500)),
      );
      expect(
        AppAnimations.shortDuration,
        equals(const Duration(milliseconds: 150)),
      );
    });

    test('curve constants have correct values', () {
      expect(AppAnimations.standardCurve, equals(Curves.easeInOut));
      expect(AppAnimations.bounceCurve, equals(Curves.elasticOut));
      expect(AppAnimations.fastOutSlowIn, equals(Curves.fastOutSlowIn));
    });

    test('createHoverController returns AnimationController', () {
      final mockVsync = _MockTickerProvider();
      final controller = AppAnimations.createHoverController(mockVsync);

      expect(controller, isA<AnimationController>());
      expect(controller.duration, equals(AppAnimations.standardDuration));

      controller.dispose();
    });

    test('createElevationAnimation returns Animation<double>', () {
      final mockVsync = _MockTickerProvider();
      final controller = AnimationController(
        vsync: mockVsync,
        duration: AppAnimations.standardDuration,
      );

      final animation = AppAnimations.createElevationAnimation(controller);

      expect(animation, isA<Animation<double>>());

      controller.dispose();
    });

    test('createBrightnessAnimation returns Animation<double>', () {
      final mockVsync = _MockTickerProvider();
      final controller = AnimationController(
        vsync: mockVsync,
        duration: AppAnimations.standardDuration,
      );

      final animation = AppAnimations.createBrightnessAnimation(controller);

      expect(animation, isA<Animation<double>>());

      controller.dispose();
    });

    test('createSlideAnimation returns Animation<Offset>', () {
      final mockVsync = _MockTickerProvider();
      final controller = AnimationController(
        vsync: mockVsync,
        duration: AppAnimations.standardDuration,
      );

      final animation = AppAnimations.createSlideAnimation(controller);

      expect(animation, isA<Animation<Offset>>());

      controller.dispose();
    });

    test('createScaleAnimation returns Animation<double>', () {
      final mockVsync = _MockTickerProvider();
      final controller = AnimationController(
        vsync: mockVsync,
        duration: AppAnimations.standardDuration,
      );

      final animation = AppAnimations.createScaleAnimation(controller);

      expect(animation, isA<Animation<double>>());

      controller.dispose();
    });
  });
}

// Mock TickerProvider for testing
class _MockTickerProvider extends TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}
