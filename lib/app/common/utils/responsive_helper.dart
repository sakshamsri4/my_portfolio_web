import 'package:flutter/material.dart';

/// Helper class for responsive design
class ResponsiveHelper {
  /// Private constructor to prevent instantiation
  ResponsiveHelper._();
  
  /// Breakpoint for mobile devices
  static const double mobileBreakpoint = 600;
  
  /// Breakpoint for tablet devices
  static const double tabletBreakpoint = 900;
  
  /// Breakpoint for desktop devices
  static const double desktopBreakpoint = 1200;
  
  /// Checks if the current screen width is mobile size
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }
  
  /// Checks if the current screen width is tablet size
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < desktopBreakpoint;
  }
  
  /// Checks if the current screen width is desktop size
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktopBreakpoint;
  }
  
  /// Returns a value based on the screen size
  static T responsiveValue<T>({
    required BuildContext context,
    required T mobile,
    T? tablet,
    required T desktop,
  }) {
    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context)) {
      return tablet ?? mobile;
    } else {
      return mobile;
    }
  }
}
