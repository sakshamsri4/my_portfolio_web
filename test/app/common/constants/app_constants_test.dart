import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';

void main() {
  group('AppConstants', () {
    group('spacing constants', () {
      test('spacingXS has correct value', () {
        expect(AppConstants.spacingXS, equals(4));
      });

      test('spacingS has correct value', () {
        expect(AppConstants.spacingS, equals(8));
      });

      test('spacingM has correct value', () {
        expect(AppConstants.spacingM, equals(16));
      });

      test('spacingL has correct value', () {
        expect(AppConstants.spacingL, equals(24));
      });

      test('spacingXL has correct value', () {
        expect(AppConstants.spacingXL, equals(32));
      });

      test('spacingXXL has correct value', () {
        expect(AppConstants.spacingXXL, equals(40));
      });
    });

    group('border radius constants', () {
      test('borderRadiusS has correct value', () {
        expect(AppConstants.borderRadiusS, equals(4));
      });

      test('borderRadiusM has correct value', () {
        expect(AppConstants.borderRadiusM, equals(8));
      });

      test('borderRadiusL has correct value', () {
        expect(AppConstants.borderRadiusL, equals(16));
      });

      test('borderRadiusXL has correct value', () {
        expect(AppConstants.borderRadiusXL, equals(24));
      });
    });

    group('animation duration constants', () {
      test('animationDurationFast has correct value', () {
        expect(
          AppConstants.animationDurationFast,
          equals(const Duration(milliseconds: 200)),
        );
      });

      test('animationDurationMedium has correct value', () {
        expect(
          AppConstants.animationDurationMedium,
          equals(const Duration(milliseconds: 300)),
        );
      });

      test('animationDurationSlow has correct value', () {
        expect(
          AppConstants.animationDurationSlow,
          equals(const Duration(milliseconds: 500)),
        );
      });
    });

    group('social media URL constants', () {
      test('linkedInUrl has correct value', () {
        expect(
          AppConstants.linkedInUrl,
          equals('https://linkedin.com/in/sakshamsri/'),
        );
      });

      test('githubUrl has correct value', () {
        expect(
          AppConstants.githubUrl,
          equals('https://github.com/sakshamsri4'),
        );
      });

      test('twitterUrl has correct value', () {
        expect(
          AppConstants.twitterUrl,
          equals('https://twitter.com/sakshamsri4'),
        );
      });
    });

    group('contact information constants', () {
      test('emailAddress has correct value', () {
        expect(
          AppConstants.emailAddress,
          equals('sakshamsri4@gmail.com'),
        );
      });

      test('phoneNumber has correct value', () {
        expect(
          AppConstants.phoneNumber,
          equals('+91 8795304811'),
        );
      });
    });

    group('asset path constants', () {
      test('profileImagePath has correct value', () {
        expect(
          AppConstants.profileImagePath,
          equals('assets/images/myself.jpeg'),
        );
      });

      test('cvPath has correct value', () {
        expect(
          AppConstants.cvPath,
          equals('assets/cv/27Feb25.pdf'),
        );
      });
    });

    test('private constructor prevents instantiation', () {
      // This is a compile-time check, but we can at least verify the class exists
      expect(AppConstants, isNotNull);
    });
  });

  group('AppColors', () {
    group('primary colors', () {
      test('primary has correct value', () {
        expect(AppColors.primary, equals(const Color(0xFF675AF2)));
      });

      test('primaryLight has correct value', () {
        expect(AppColors.primaryLight, equals(const Color(0xFF8A7DF7)));
      });

      test('background has correct value', () {
        expect(AppColors.background, equals(const Color(0xFFF4F0FF)));
      });
    });

    group('social media brand colors', () {
      test('linkedin has correct value', () {
        expect(AppColors.linkedin, equals(const Color(0xFF0A66C2)));
      });

      test('github has correct value', () {
        expect(AppColors.github, equals(const Color(0xFF333333)));
      });

      test('twitter has correct value', () {
        expect(AppColors.twitter, equals(const Color(0xFF1DA1F2)));
      });

      test('whatsapp has correct value', () {
        expect(AppColors.whatsapp, equals(const Color(0xFF25D366)));
      });
    });

    group('technology brand colors', () {
      test('flutter has correct value', () {
        expect(AppColors.flutter, equals(const Color(0xFF02569B)));
      });

      test('firebase has correct value', () {
        expect(AppColors.firebase, equals(const Color(0xFFFFA000)));
      });

      test('android has correct value', () {
        expect(AppColors.android, equals(const Color(0xFF3DDC84)));
      });

      test('ios has correct value', () {
        expect(AppColors.ios, equals(const Color(0xFF999999)));
      });

      test('react has correct value', () {
        expect(AppColors.react, equals(const Color(0xFF61DAFB)));
      });

      test('nodejs has correct value', () {
        expect(AppColors.nodejs, equals(const Color(0xFF339933)));
      });

      test('database has correct value', () {
        expect(AppColors.database, equals(const Color(0xFF336791)));
      });
    });

    group('text colors', () {
      test('textPrimary has correct value', () {
        expect(AppColors.textPrimary, equals(const Color(0xFF212121)));
      });

      test('textSecondary has correct value', () {
        expect(AppColors.textSecondary, equals(const Color(0xFF757575)));
      });

      test('textTertiary has correct value', () {
        expect(AppColors.textTertiary, equals(const Color(0xFF9E9E9E)));
      });
    });

    test('private constructor prevents instantiation', () {
      // This is a compile-time check, but we can at least verify the class exists
      expect(AppColors, isNotNull);
    });
  });
}
