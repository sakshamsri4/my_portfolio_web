import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';

void main() {
  group('AppConstants', () {
    group('Spacing Constants', () {
      test('should have correct spacing values', () {
        expect(AppConstants.spacingXS, equals(4.0));
        expect(AppConstants.spacingS, equals(8.0));
        expect(AppConstants.spacingM, equals(16.0));
        expect(AppConstants.spacingL, equals(24.0));
        expect(AppConstants.spacingXL, equals(32.0));
        expect(AppConstants.spacingXXL, equals(40.0));
      });

      test('spacing values should be in ascending order', () {
        expect(AppConstants.spacingXS, lessThan(AppConstants.spacingS));
        expect(AppConstants.spacingS, lessThan(AppConstants.spacingM));
        expect(AppConstants.spacingM, lessThan(AppConstants.spacingL));
        expect(AppConstants.spacingL, lessThan(AppConstants.spacingXL));
        expect(AppConstants.spacingXL, lessThan(AppConstants.spacingXXL));
      });
    });

    group('Border Radius Constants', () {
      test('should have correct border radius values', () {
        expect(AppConstants.borderRadiusS, equals(4.0));
        expect(AppConstants.borderRadiusM, equals(8.0));
        expect(AppConstants.borderRadiusL, equals(16.0));
        expect(AppConstants.borderRadiusXL, equals(24.0));
      });

      test('border radius values should be in ascending order', () {
        expect(AppConstants.borderRadiusS, lessThan(AppConstants.borderRadiusM));
        expect(AppConstants.borderRadiusM, lessThan(AppConstants.borderRadiusL));
        expect(AppConstants.borderRadiusL, lessThan(AppConstants.borderRadiusXL));
      });
    });

    group('Animation Duration Constants', () {
      test('should have correct animation duration values', () {
        expect(AppConstants.animationDurationFast, 
               equals(const Duration(milliseconds: 200)));
        expect(AppConstants.animationDurationMedium, 
               equals(const Duration(milliseconds: 300)));
        expect(AppConstants.animationDurationSlow, 
               equals(const Duration(milliseconds: 500)));
      });

      test('animation durations should be in ascending order', () {
        expect(AppConstants.animationDurationFast.inMilliseconds,
               lessThan(AppConstants.animationDurationMedium.inMilliseconds));
        expect(AppConstants.animationDurationMedium.inMilliseconds,
               lessThan(AppConstants.animationDurationSlow.inMilliseconds));
      });
    });

    group('Social Media URLs', () {
      test('should have valid social media URLs', () {
        expect(AppConstants.linkedInUrl, isNotEmpty);
        expect(AppConstants.githubUrl, isNotEmpty);
        expect(AppConstants.twitterUrl, isNotEmpty);
        
        // Test URL format
        expect(AppConstants.linkedInUrl, startsWith('https://'));
        expect(AppConstants.githubUrl, startsWith('https://'));
        expect(AppConstants.twitterUrl, startsWith('https://'));
        
        // Test specific domains
        expect(AppConstants.linkedInUrl, contains('linkedin.com'));
        expect(AppConstants.githubUrl, contains('github.com'));
        expect(AppConstants.twitterUrl, contains('twitter.com'));
      });

      test('URLs should end with forward slash', () {
        expect(AppConstants.linkedInUrl, endsWith('/'));
      });
    });

    group('Contact Information', () {
      test('should have valid contact information', () {
        expect(AppConstants.emailAddress, isNotEmpty);
        expect(AppConstants.phoneNumber, isNotEmpty);
        
        // Test email format
        expect(AppConstants.emailAddress, contains('@'));
        expect(AppConstants.emailAddress, contains('.'));
        
        // Test phone format
        expect(AppConstants.phoneNumber, startsWith('+'));
      });

      test('email should be valid format', () {
        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
        expect(emailRegex.hasMatch(AppConstants.emailAddress), isTrue);
      });

      test('phone should be valid format', () {
        final phoneRegex = RegExp(r'^\+\d{1,3}\s?\d{10}$');
        expect(phoneRegex.hasMatch(AppConstants.phoneNumber), isTrue);
      });
    });

    group('Asset Paths', () {
      test('should have valid asset paths', () {
        expect(AppConstants.profileImagePath, isNotEmpty);
        expect(AppConstants.cvPath, isNotEmpty);
        
        // Test asset path format
        expect(AppConstants.profileImagePath, startsWith('assets/'));
        expect(AppConstants.cvPath, startsWith('assets/'));
        
        // Test file extensions
        expect(AppConstants.profileImagePath, endsWith('.jpeg'));
        expect(AppConstants.cvPath, endsWith('.pdf'));
      });
    });
  });

  group('AppColors', () {
    test('should have valid primary colors', () {
      expect(AppColors.primary, equals(const Color(0xFF675AF2)));
      expect(AppColors.primaryLight, equals(const Color(0xFF8A7DF7)));
      expect(AppColors.background, equals(const Color(0xFFF4F0FF)));
    });

    test('should have valid brand colors', () {
      expect(AppColors.linkedin, equals(const Color(0xFF0A66C2)));
      expect(AppColors.github, equals(const Color(0xFF333333)));
      expect(AppColors.twitter, equals(const Color(0xFF1DA1F2)));
      expect(AppColors.whatsapp, equals(const Color(0xFF25D366)));
    });

    test('should have valid technology colors', () {
      expect(AppColors.flutter, equals(const Color(0xFF02569B)));
      expect(AppColors.firebase, equals(const Color(0xFFFFA000)));
      expect(AppColors.android, equals(const Color(0xFF3DDC84)));
      expect(AppColors.ios, equals(const Color(0xFF999999)));
      expect(AppColors.react, equals(const Color(0xFF61DAFB)));
      expect(AppColors.nodejs, equals(const Color(0xFF339933)));
      expect(AppColors.database, equals(const Color(0xFF336791)));
    });

    test('should have valid text colors', () {
      expect(AppColors.textPrimary, equals(const Color(0xFF212121)));
      expect(AppColors.textSecondary, equals(const Color(0xFF757575)));
      expect(AppColors.textTertiary, equals(const Color(0xFF9E9E9E)));
    });

    test('text colors should have proper contrast hierarchy', () {
      // Primary should be darkest (lowest value)
      expect(AppColors.textPrimary.value, 
             lessThan(AppColors.textSecondary.value));
      expect(AppColors.textSecondary.value, 
             lessThan(AppColors.textTertiary.value));
    });

    test('colors should be opaque', () {
      expect(AppColors.primary.alpha, equals(255));
      expect(AppColors.background.alpha, equals(255));
      expect(AppColors.linkedin.alpha, equals(255));
      expect(AppColors.textPrimary.alpha, equals(255));
    });
  });
}
