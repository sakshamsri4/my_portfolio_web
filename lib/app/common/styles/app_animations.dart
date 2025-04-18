import 'package:flutter/material.dart';

/// Shared animation configurations for consistent animations across the app
class AppAnimations {
  /// Private constructor to prevent instantiation
  AppAnimations._();
  
  /// Standard duration for most animations
  static const Duration standardDuration = Duration(milliseconds: 300);
  
  /// Longer duration for more elaborate animations
  static const Duration longDuration = Duration(milliseconds: 500);
  
  /// Short duration for quick feedback animations
  static const Duration shortDuration = Duration(milliseconds: 150);
  
  /// Standard curve for most animations
  static const Curve standardCurve = Curves.easeInOut;
  
  /// Bounce curve for playful animations
  static const Curve bounceCurve = Curves.elasticOut;
  
  /// Fast out, slow in curve for natural motion
  static const Curve fastOutSlowIn = Curves.fastOutSlowIn;
  
  /// Create a hover animation controller
  static AnimationController createHoverController(TickerProvider vsync) {
    return AnimationController(
      duration: standardDuration,
      vsync: vsync,
    );
  }
  
  /// Create an elevation animation for hover effects
  static Animation<double> createElevationAnimation(
    AnimationController controller, {
    double begin = 0,
    double end = 8,
  }) {
    return Tween<double>(
      begin: begin,
      end: end,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: standardCurve,
      ),
    );
  }
  
  /// Create a brightness animation for hover effects
  static Animation<double> createBrightnessAnimation(
    AnimationController controller, {
    double begin = 0,
    double end = 0.5,
  }) {
    return Tween<double>(
      begin: begin,
      end: end,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: standardCurve,
      ),
    );
  }
  
  /// Create a slide animation
  static Animation<Offset> createSlideAnimation(
    AnimationController controller, {
    Offset begin = Offset.zero,
    Offset end = const Offset(0, -1),
  }) {
    return Tween<Offset>(
      begin: begin,
      end: end,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: standardCurve,
      ),
    );
  }
  
  /// Create a scale animation
  static Animation<double> createScaleAnimation(
    AnimationController controller, {
    double begin = 1.0,
    double end = 1.1,
  }) {
    return Tween<double>(
      begin: begin,
      end: end,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: standardCurve,
      ),
    );
  }
}
