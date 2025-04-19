import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/common/constants/string_constants.dart';

void main() {
  group('AppStrings', () {
    test('app name should not be empty', () {
      expect(AppStrings.appName, isNotEmpty);
      expect(AppStrings.appName, equals('Saksham Srivastava'));
    });

    test('navigation strings should not be empty', () {
      expect(AppStrings.home, isNotEmpty);
      expect(AppStrings.about, isNotEmpty);
      expect(AppStrings.skills, isNotEmpty);
      expect(AppStrings.projects, isNotEmpty);
      expect(AppStrings.career, isNotEmpty);
      expect(AppStrings.contact, isNotEmpty);
      expect(AppStrings.education, isNotEmpty);
    });

    test('section title strings should not be empty', () {
      expect(AppStrings.aboutMeTitle, isNotEmpty);
      expect(AppStrings.skillsTitle, isNotEmpty);
      expect(AppStrings.projectsTitle, isNotEmpty);
      expect(AppStrings.careerTitle, isNotEmpty);
      expect(AppStrings.educationTitle, isNotEmpty);
      expect(AppStrings.contactTitle, isNotEmpty);
    });

    test('section subtitle strings should not be empty', () {
      expect(AppStrings.aboutMeSubtitle, isNotEmpty);
      expect(AppStrings.skillsSubtitle, isNotEmpty);
      expect(AppStrings.projectsSubtitle, isNotEmpty);
      expect(AppStrings.careerSubtitle, isNotEmpty);
      expect(AppStrings.educationSubtitle, isNotEmpty);
      expect(AppStrings.contactSubtitle, isNotEmpty);
    });

    test('about section strings should not be empty', () {
      expect(AppStrings.aboutMeDescription, isNotEmpty);
      expect(AppStrings.aboutMePassion, isNotEmpty);
    });

    test('contact section strings should not be empty', () {
      expect(AppStrings.contactDescription, isNotEmpty);
      expect(AppStrings.emailMe, isNotEmpty);
      expect(AppStrings.messageMe, isNotEmpty);
      expect(AppStrings.downloadCV, isNotEmpty);
      expect(AppStrings.sayHello, isNotEmpty);
    });

    test('button label strings should not be empty', () {
      expect(AppStrings.viewProject, isNotEmpty);
      expect(AppStrings.learnMore, isNotEmpty);
      expect(AppStrings.sendMessage, isNotEmpty);
      expect(AppStrings.viewAll, isNotEmpty);
    });

    test('error message strings should not be empty', () {
      expect(AppStrings.errorLaunchingUrl, isNotEmpty);
      expect(AppStrings.errorLaunchingEmail, isNotEmpty);
      expect(AppStrings.errorLaunchingWhatsApp, isNotEmpty);
    });

    test('success message strings should not be empty', () {
      expect(AppStrings.copiedToClipboard, isNotEmpty);
    });

    test('placeholder strings should not be empty', () {
      expect(AppStrings.emailSubject, isNotEmpty);
      expect(AppStrings.cvFileName, isNotEmpty);
    });

    test('mobile-specific message strings should not be empty', () {
      expect(AppStrings.cvDownloadWebOnly, isNotEmpty);
    });
  });
}
