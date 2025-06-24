import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';
import 'package:my_portfolio_web/app/common/constants/string_constants.dart';

void main() {
  group('Coverage Tests', () {
    test('should cover AppConstants static access', () {
      // Test AppConstants static access
      expect(AppConstants.spacingXS, equals(4));
      expect(AppConstants.spacingS, equals(8));
      expect(AppConstants.spacingM, equals(16));
      expect(AppConstants.spacingL, equals(24));
      expect(AppConstants.spacingXL, equals(32));
      expect(AppConstants.spacingXXL, equals(40));

      // Test border radius constants
      expect(AppConstants.borderRadiusS, equals(4));
      expect(AppConstants.borderRadiusM, equals(8));
      expect(AppConstants.borderRadiusL, equals(16));
      expect(AppConstants.borderRadiusXL, equals(24));

      // Test animation durations
      expect(AppConstants.animationDurationFast, equals(const Duration(milliseconds: 200)));
      expect(AppConstants.animationDurationMedium, equals(const Duration(milliseconds: 300)));
      expect(AppConstants.animationDurationSlow, equals(const Duration(milliseconds: 500)));

      // Test social media URLs
      expect(AppConstants.linkedInUrl, contains('linkedin.com'));
      expect(AppConstants.githubUrl, contains('github.com'));
      expect(AppConstants.twitterUrl, contains('twitter.com'));

      // Test contact information
      expect(AppConstants.emailAddress, contains('@'));
      expect(AppConstants.phoneNumber, isNotEmpty);

      // Test asset paths
      expect(AppConstants.profileImagePath, contains('assets/'));
      expect(AppConstants.cvPath, contains('assets/'));

      // Test AppColors static access
      expect(AppColors.primary, isA<Color>());
      expect(AppColors.primaryLight, isA<Color>());
      expect(AppColors.background, isA<Color>());
      expect(AppColors.textPrimary, isA<Color>());
      expect(AppColors.textSecondary, isA<Color>());
      expect(AppColors.textTertiary, isA<Color>());

      // Test brand colors that actually exist
      expect(AppColors.linkedin, isA<Color>());
      expect(AppColors.github, isA<Color>());
      expect(AppColors.twitter, isA<Color>());
      expect(AppColors.whatsapp, isA<Color>());
      expect(AppColors.flutter, isA<Color>());
      expect(AppColors.firebase, isA<Color>());
      expect(AppColors.android, isA<Color>());
      expect(AppColors.ios, isA<Color>());
      expect(AppColors.react, isA<Color>());
      expect(AppColors.nodejs, isA<Color>());
      expect(AppColors.database, isA<Color>());

      // Test AppStrings static access
      expect(AppStrings.appName, isNotEmpty);
    });
  });
}
