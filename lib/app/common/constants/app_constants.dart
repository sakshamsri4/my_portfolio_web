import 'package:flutter/material.dart';

/// Application-wide constants
class AppConstants {
  /// Private constructor to prevent instantiation
  AppConstants._();
  
  /// Standard spacing values
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 40.0;
  
  /// Standard border radius values
  static const double borderRadiusS = 4.0;
  static const double borderRadiusM = 8.0;
  static const double borderRadiusL = 16.0;
  static const double borderRadiusXL = 24.0;
  
  /// Standard animation durations
  static const Duration animationDurationFast = Duration(milliseconds: 200);
  static const Duration animationDurationMedium = Duration(milliseconds: 300);
  static const Duration animationDurationSlow = Duration(milliseconds: 500);
  
  /// Social media URLs
  static const String linkedInUrl = 'https://linkedin.com/in/sakshamsri/';
  static const String githubUrl = 'https://github.com/sakshamsri4';
  static const String twitterUrl = 'https://twitter.com/sakshamsri4';
  
  /// Contact information
  static const String emailAddress = 'sakshamsri4@gmail.com';
  static const String phoneNumber = '+91 8795304811';
  
  /// Asset paths
  static const String profileImagePath = 'assets/images/myself.jpeg';
  static const String cvPath = 'assets/cv/CV_3April.pdf';
}

/// Color constants for the application
class AppColors {
  /// Private constructor to prevent instantiation
  AppColors._();
  
  /// Primary brand color
  static const Color primary = Color(0xFF675AF2);
  
  /// Background color
  static const Color background = Color(0xFFF4F0FF);
  
  /// LinkedIn brand color
  static const Color linkedin = Color(0xFF0A66C2);
  
  /// GitHub brand color
  static const Color github = Color(0xFF333333);
  
  /// Twitter brand color
  static const Color twitter = Color(0xFF1DA1F2);
  
  /// WhatsApp brand color
  static const Color whatsapp = Color(0xFF25D366);
  
  /// Flutter brand color
  static const Color flutter = Color(0xFF02569B);
  
  /// Firebase brand color
  static const Color firebase = Color(0xFFFFA000);
  
  /// Android brand color
  static const Color android = Color(0xFF3DDC84);
  
  /// iOS brand color
  static const Color ios = Color(0xFF999999);
  
  /// React brand color
  static const Color react = Color(0xFF61DAFB);
  
  /// Node.js brand color
  static const Color nodejs = Color(0xFF339933);
  
  /// Database generic color
  static const Color database = Color(0xFF336791);
}
