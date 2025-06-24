import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/common/constants/string_constants.dart';

void main() {
  group('AppStrings', () {
    group('App Identity', () {
      test('should have valid app name', () {
        expect(AppStrings.appName, isNotEmpty);
        expect(AppStrings.appName, equals('Saksham Srivastava'));
      });
    });

    group('Navigation Strings', () {
      test('should have all navigation items', () {
        expect(AppStrings.home, equals('Home'));
        expect(AppStrings.about, equals('About'));
        expect(AppStrings.skills, equals('Skills'));
        expect(AppStrings.projects, equals('Projects'));
        expect(AppStrings.career, equals('Career'));
        expect(AppStrings.contact, equals('Contact'));
        expect(AppStrings.education, equals('Education'));
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

      test('navigation strings should be properly capitalized', () {
        final navigationItems = [
          AppStrings.home,
          AppStrings.about,
          AppStrings.skills,
          AppStrings.projects,
          AppStrings.career,
          AppStrings.contact,
          AppStrings.education,
        ];

        for (final item in navigationItems) {
          expect(item[0], equals(item[0].toUpperCase()));
        }
      });
    });

    group('Section Titles', () {
      test('should have all section titles', () {
        expect(AppStrings.aboutMeTitle, equals('About Me'));
        expect(AppStrings.skillsTitle, equals('Skills'));
        expect(AppStrings.projectsTitle, equals('Featured Projects'));
        expect(AppStrings.careerTitle, equals('Career Timeline'));
        expect(AppStrings.educationTitle, equals('Education'));
        expect(AppStrings.contactTitle, equals("Let's Connect"));
      });

      test('section titles should not be empty', () {
        expect(AppStrings.aboutMeTitle, isNotEmpty);
        expect(AppStrings.skillsTitle, isNotEmpty);
        expect(AppStrings.projectsTitle, isNotEmpty);
        expect(AppStrings.careerTitle, isNotEmpty);
        expect(AppStrings.educationTitle, isNotEmpty);
        expect(AppStrings.contactTitle, isNotEmpty);
      });
    });

    group('Section Subtitles', () {
      test('should have all section subtitles', () {
        expect(AppStrings.aboutMeSubtitle, equals('Get to know me better'));
        expect(AppStrings.skillsSubtitle, equals('What I bring to the table'));
        expect(AppStrings.projectsSubtitle, equals('Some of my recent work'));
        expect(AppStrings.careerSubtitle, equals('My professional journey'));
        expect(AppStrings.educationSubtitle, equals('My academic background'));
        expect(AppStrings.contactSubtitle, equals('Get in touch with me'));
      });

      test('section subtitles should not be empty', () {
        expect(AppStrings.aboutMeSubtitle, isNotEmpty);
        expect(AppStrings.skillsSubtitle, isNotEmpty);
        expect(AppStrings.projectsSubtitle, isNotEmpty);
        expect(AppStrings.careerSubtitle, isNotEmpty);
        expect(AppStrings.educationSubtitle, isNotEmpty);
        expect(AppStrings.contactSubtitle, isNotEmpty);
      });

      test('subtitles should be descriptive', () {
        // Subtitles should be longer than titles and contain descriptive words
        expect(AppStrings.aboutMeSubtitle.length, 
               greaterThan(AppStrings.aboutMeTitle.length));
        expect(AppStrings.skillsSubtitle.length, 
               greaterThan(AppStrings.skillsTitle.length));
        expect(AppStrings.projectsSubtitle.length, 
               greaterThan(AppStrings.projectsTitle.length));
      });
    });

    group('Action Strings', () {
      test('should have valid action strings', () {
        expect(AppStrings.downloadCV, equals('Download CV'));
        expect(AppStrings.viewProject, equals('View Project'));
        expect(AppStrings.getInTouch, equals('Get in Touch'));
        expect(AppStrings.sendMessage, equals('Send Message'));
        expect(AppStrings.callMe, equals('Call Me'));
        expect(AppStrings.emailMe, equals('Email Me'));
        expect(AppStrings.whatsappMe, equals('WhatsApp Me'));
      });

      test('action strings should be imperative', () {
        final actionStrings = [
          AppStrings.downloadCV,
          AppStrings.viewProject,
          AppStrings.getInTouch,
          AppStrings.sendMessage,
          AppStrings.callMe,
          AppStrings.emailMe,
          AppStrings.whatsappMe,
        ];

        for (final action in actionStrings) {
          expect(action, isNotEmpty);
          // Action strings should start with a verb (capital letter)
          expect(action[0], equals(action[0].toUpperCase()));
        }
      });
    });

    group('Error Messages', () {
      test('should have valid error messages', () {
        expect(AppStrings.errorLaunchingUrl, equals('Could not launch URL'));
        expect(AppStrings.errorLaunchingEmail, 
               equals('Could not launch email client'));
        expect(AppStrings.errorLaunchingWhatsApp, 
               equals('Could not launch WhatsApp'));
      });

      test('error messages should be descriptive', () {
        expect(AppStrings.errorLaunchingUrl, contains('Could not'));
        expect(AppStrings.errorLaunchingEmail, contains('Could not'));
        expect(AppStrings.errorLaunchingWhatsApp, contains('Could not'));
      });

      test('error messages should not be empty', () {
        expect(AppStrings.errorLaunchingUrl, isNotEmpty);
        expect(AppStrings.errorLaunchingEmail, isNotEmpty);
        expect(AppStrings.errorLaunchingWhatsApp, isNotEmpty);
      });
    });

    group('Success Messages', () {
      test('should have valid success messages', () {
        expect(AppStrings.copiedToClipboard, equals('Copied to clipboard'));
      });

      test('success messages should be positive', () {
        expect(AppStrings.copiedToClipboard, isNotEmpty);
        expect(AppStrings.copiedToClipboard, contains('Copied'));
      });
    });

    group('Placeholders and File Names', () {
      test('should have valid placeholder strings', () {
        expect(AppStrings.emailSubject, 
               equals('Contact from Portfolio Website'));
        expect(AppStrings.cvFileName, equals('Saksham_Srivastava_CV.pdf'));
      });

      test('email subject should be descriptive', () {
        expect(AppStrings.emailSubject, contains('Contact'));
        expect(AppStrings.emailSubject, contains('Portfolio'));
      });

      test('CV filename should have correct format', () {
        expect(AppStrings.cvFileName, endsWith('.pdf'));
        expect(AppStrings.cvFileName, contains('CV'));
        expect(AppStrings.cvFileName, contains('_'));
      });
    });

    group('Mobile-specific Messages', () {
      test('should have mobile-specific messages', () {
        expect(AppStrings.cvDownloadWebOnly, 
               equals('CV download is only available on web platform'));
      });

      test('mobile messages should be informative', () {
        expect(AppStrings.cvDownloadWebOnly, contains('web platform'));
        expect(AppStrings.cvDownloadWebOnly, contains('only available'));
      });
    });

    group('String Consistency', () {
      test('related strings should be consistent', () {
        // Navigation and section titles should be related
        expect(AppStrings.about.toLowerCase(), 
               equals(AppStrings.aboutMeTitle.split(' ')[0].toLowerCase()));
        expect(AppStrings.skills.toLowerCase(), 
               equals(AppStrings.skillsTitle.toLowerCase()));
        expect(AppStrings.projects.toLowerCase(), 
               contains(AppStrings.projectsTitle.split(' ')[1].toLowerCase()));
      });

      test('all strings should use consistent casing', () {
        // Titles should be title case
        expect(AppStrings.aboutMeTitle, matches(r'^[A-Z][a-z]*(\s[A-Z][a-z]*)*$'));
        expect(AppStrings.skillsTitle, matches(r'^[A-Z][a-z]*$'));
        expect(AppStrings.educationTitle, matches(r'^[A-Z][a-z]*$'));
      });
    });
  });
}
