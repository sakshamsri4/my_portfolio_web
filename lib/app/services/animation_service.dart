import 'package:flutter/material.dart';
import 'package:my_portfolio_web/app/common/styles/app_animations.dart';

/// Service for managing animations across the app
class AnimationService {
  /// Private constructor to prevent instantiation
  AnimationService._();
  
  /// Create a standard hover animation controller
  static AnimationController createHoverController(TickerProvider vsync) {
    return AnimationController(
      duration: AppAnimations.standardDuration,
      vsync: vsync,
    );
  }
  
  /// Create a standard animation controller with custom duration
  static AnimationController createController(
    TickerProvider vsync, {
    Duration? duration,
  }) {
    return AnimationController(
      duration: duration ?? AppAnimations.standardDuration,
      vsync: vsync,
    );
  }
  
  /// Create a hover animation set for cards
  static HoverAnimationSet createCardHoverAnimations(
    AnimationController controller, {
    double baseElevation = 2,
    double hoverElevation = 8,
  }) {
    return HoverAnimationSet(
      elevation: AppAnimations.createElevationAnimation(
        controller,
        begin: baseElevation,
        end: hoverElevation,
      ),
      brightness: AppAnimations.createBrightnessAnimation(controller),
      scale: AppAnimations.createScaleAnimation(
        controller,
        begin: 1.0,
        end: 1.03,
      ),
    );
  }
  
  /// Create a hover animation set for buttons
  static HoverAnimationSet createButtonHoverAnimations(
    AnimationController controller,
  ) {
    return HoverAnimationSet(
      elevation: AppAnimations.createElevationAnimation(
        controller,
        begin: 0,
        end: 4,
      ),
      brightness: AppAnimations.createBrightnessAnimation(
        controller,
        begin: 0,
        end: 0.2,
      ),
      scale: AppAnimations.createScaleAnimation(
        controller,
        begin: 1.0,
        end: 1.05,
      ),
    );
  }
  
  /// Create a hover animation set for icons
  static HoverAnimationSet createIconHoverAnimations(
    AnimationController controller,
  ) {
    return HoverAnimationSet(
      elevation: AppAnimations.createElevationAnimation(
        controller,
        begin: 0,
        end: 2,
      ),
      brightness: AppAnimations.createBrightnessAnimation(
        controller,
        begin: 0,
        end: 0.3,
      ),
      scale: AppAnimations.createScaleAnimation(
        controller,
        begin: 1.0,
        end: 1.2,
      ),
    );
  }
  
  /// Create a staggered animation group
  static StaggeredAnimationGroup createStaggeredAnimations(
    AnimationController controller,
    List<StaggeredAnimationConfig> configs,
  ) {
    final animations = <Animation<double>>[];
    
    for (final config in configs) {
      animations.add(
        Tween<double>(
          begin: config.begin,
          end: config.end,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              config.startInterval,
              config.endInterval,
              curve: config.curve ?? AppAnimations.standardCurve,
            ),
          ),
        ),
      );
    }
    
    return StaggeredAnimationGroup(animations);
  }
  
  /// Create a scroll-triggered animation
  static ScrollTriggeredAnimation createScrollTriggeredAnimation(
    AnimationController controller, {
    double triggerOffset = 0.8,
    Duration? duration,
  }) {
    return ScrollTriggeredAnimation(
      controller: controller,
      triggerOffset: triggerOffset,
      duration: duration ?? AppAnimations.standardDuration,
    );
  }
}

/// A set of hover animations for a widget
class HoverAnimationSet {
  /// Creates a hover animation set
  HoverAnimationSet({
    required this.elevation,
    required this.brightness,
    required this.scale,
  });

  /// Animation for elevation change
  final Animation<double> elevation;
  
  /// Animation for brightness change
  final Animation<double> brightness;
  
  /// Animation for scale change
  final Animation<double> scale;
}

/// Configuration for a staggered animation
class StaggeredAnimationConfig {
  /// Creates a staggered animation configuration
  StaggeredAnimationConfig({
    required this.begin,
    required this.end,
    required this.startInterval,
    required this.endInterval,
    this.curve,
  });

  /// Starting value of the animation
  final double begin;
  
  /// Ending value of the animation
  final double end;
  
  /// Start interval (0.0 to 1.0)
  final double startInterval;
  
  /// End interval (0.0 to 1.0)
  final double endInterval;
  
  /// Optional curve for the animation
  final Curve? curve;
}

/// A group of staggered animations
class StaggeredAnimationGroup {
  /// Creates a staggered animation group
  StaggeredAnimationGroup(this.animations);

  /// List of animations in the group
  final List<Animation<double>> animations;
  
  /// Get an animation by index
  Animation<double> operator [](int index) => animations[index];
  
  /// Number of animations in the group
  int get length => animations.length;
}

/// An animation triggered by scrolling
class ScrollTriggeredAnimation {
  /// Creates a scroll-triggered animation
  ScrollTriggeredAnimation({
    required this.controller,
    required this.triggerOffset,
    required this.duration,
  });

  /// The animation controller
  final AnimationController controller;
  
  /// Offset at which the animation is triggered (0.0 to 1.0)
  final double triggerOffset;
  
  /// Duration of the animation
  final Duration duration;
  
  /// Check if the animation should be triggered based on scroll position
  bool shouldTrigger(ScrollNotification notification) {
    final scrollPosition = notification.metrics.pixels;
    final viewportDimension = notification.metrics.viewportDimension;
    final maxScrollExtent = notification.metrics.maxScrollExtent;
    
    // Calculate the scroll percentage (0.0 to 1.0)
    final scrollPercentage = scrollPosition / maxScrollExtent;
    
    // Check if we've scrolled past the trigger point
    return scrollPercentage >= triggerOffset;
  }
  
  /// Start the animation
  void start() {
    controller.forward();
  }
  
  /// Reset the animation
  void reset() {
    controller.reset();
  }
}
