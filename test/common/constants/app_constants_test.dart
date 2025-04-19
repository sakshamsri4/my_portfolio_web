import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';

void main() {
  group('AppConstants', () {
    test('spacing constants should have correct values', () {
      expect(AppConstants.spacingXS, equals(4));
      expect(AppConstants.spacingS, equals(8));
      expect(AppConstants.spacingM, equals(16));
      expect(AppConstants.spacingL, equals(24));
      expect(AppConstants.spacingXL, equals(32));
      expect(AppConstants.spacingXXL, equals(40));
    });

    test('border radius constants should have correct values', () {
      expect(AppConstants.borderRadiusS, equals(4));
      expect(AppConstants.borderRadiusM, equals(8));
      expect(AppConstants.borderRadiusL, equals(16));
      expect(AppConstants.borderRadiusXL, equals(24));
    });

    test('animation duration constants should have correct values', () {
      expect(AppConstants.animationDurationFast,
          equals(const Duration(milliseconds: 200)),);
      expect(AppConstants.animationDurationMedium,
          equals(const Duration(milliseconds: 300)),);
      expect(AppConstants.animationDurationSlow,
          equals(const Duration(milliseconds: 500)),);
    });

    test('social media URL constants should not be empty', () {
      expect(AppConstants.linkedInUrl, isNotEmpty);
      expect(AppConstants.githubUrl, isNotEmpty);
      expect(AppConstants.twitterUrl, isNotEmpty);
    });

    test('contact information constants should not be empty', () {
      expect(AppConstants.emailAddress, isNotEmpty);
      expect(AppConstants.phoneNumber, isNotEmpty);
    });

    test('asset path constants should not be empty', () {
      expect(AppConstants.profileImagePath, isNotEmpty);
      expect(AppConstants.cvPath, isNotEmpty);
    });
  });

  group('AppColors', () {
    test('primary colors should have correct values', () {
      expect(AppColors.primary, equals(const Color(0xFF675AF2)));
      expect(AppColors.primaryLight, equals(const Color(0xFF8A7DF7)));
      expect(AppColors.background, equals(const Color(0xFFF4F0FF)));
    });

    test('social media brand colors should have correct values', () {
      expect(AppColors.linkedin, equals(const Color(0xFF0A66C2)));
      expect(AppColors.github, equals(const Color(0xFF333333)));
      expect(AppColors.twitter, equals(const Color(0xFF1DA1F2)));
      expect(AppColors.whatsapp, equals(const Color(0xFF25D366)));
    });

    test('technology brand colors should have correct values', () {
      expect(AppColors.flutter, equals(const Color(0xFF02569B)));
      expect(AppColors.firebase, equals(const Color(0xFFFFA000)));
      expect(AppColors.android, equals(const Color(0xFF3DDC84)));
      expect(AppColors.ios, equals(const Color(0xFF999999)));
      expect(AppColors.react, equals(const Color(0xFF61DAFB)));
      expect(AppColors.nodejs, equals(const Color(0xFF339933)));
      expect(AppColors.database, equals(const Color(0xFF336791)));
    });

    test('text colors should have correct values', () {
      expect(AppColors.textPrimary, equals(const Color(0xFF212121)));
      expect(AppColors.textSecondary, equals(const Color(0xFF757575)));
      expect(AppColors.textTertiary, equals(const Color(0xFF9E9E9E)));
    });
  });
}
