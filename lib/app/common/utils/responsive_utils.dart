import 'package:flutter/material.dart';

/// Utilities for responsive layouts
class ResponsiveUtils {
  /// Private constructor to prevent instantiation
  ResponsiveUtils._();

  /// Screen size breakpoints
  static const double mobileBreakpoint = 768.0;
  static const double tabletBreakpoint = 1024.0;

  /// Check if the current screen size is mobile
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  /// Check if the current screen size is tablet
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  /// Check if the current screen size is desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreakpoint;
  }

  /// Get the number of columns for a grid based on screen size
  static int getColumnCount(BuildContext context) {
    if (isMobile(context)) {
      return 1;
    } else if (isTablet(context)) {
      return 2;
    } else {
      return 3;
    }
  }

  /// Get the appropriate padding based on screen size
  static EdgeInsets getScreenPadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.all(16);
    } else if (isTablet(context)) {
      return const EdgeInsets.all(24);
    } else {
      return const EdgeInsets.all(32);
    }
  }

  /// Get a responsive value based on screen size
  static T getResponsiveValue<T>({
    required BuildContext context,
    required T mobile,
    required T desktop,
    T? tablet,
  }) {
    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context)) {
      return tablet ?? mobile;
    } else {
      return mobile;
    }
  }

  /// Get a responsive font size based on screen size
  static double getResponsiveFontSize(
    BuildContext context, {
    required double mobile,
    required double desktop,
    double? tablet,
  }) {
    return getResponsiveValue<double>(
      context: context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }

  /// Get a responsive spacing value based on screen size
  static double getResponsiveSpacing(
    BuildContext context, {
    required double mobile,
    required double desktop,
    double? tablet,
  }) {
    return getResponsiveValue<double>(
      context: context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }

  /// Get appropriate title font size based on screen size
  static double getTitleFontSize(BuildContext context) {
    if (isMobile(context)) return 24.0;
    if (isTablet(context)) return 28.0;
    return 32.0;
  }

  /// Get appropriate subtitle font size based on screen size
  static double getSubtitleFontSize(BuildContext context) {
    if (isMobile(context)) return 18.0;
    if (isTablet(context)) return 20.0;
    return 22.0;
  }

  /// Get appropriate body font size based on screen size
  static double getBodyFontSize(BuildContext context) {
    if (isMobile(context)) return 14.0;
    return 16.0;
  }
}
