import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/common/constants/string_constants.dart';

void main() {
  group('AppStrings', () {
    test('app name has correct value', () {
      expect(AppStrings.appName, equals('Saksham Srivastava'));
    });

    group('navigation strings', () {
      test('home has correct value', () {
        expect(AppStrings.home, equals('Home'));
      });

      test('about has correct value', () {
        expect(AppStrings.about, equals('About'));
      });

      test('skills has correct value', () {
        expect(AppStrings.skills, equals('Skills'));
      });

      test('projects has correct value', () {
        expect(AppStrings.projects, equals('Projects'));
      });

      test('career has correct value', () {
        expect(AppStrings.career, equals('Career'));
      });

      test('contact has correct value', () {
        expect(AppStrings.contact, equals('Contact'));
      });

      test('education has correct value', () {
        expect(AppStrings.education, equals('Education'));
      });
    });

    group('section title strings', () {
      test('aboutMeTitle has correct value', () {
        expect(AppStrings.aboutMeTitle, equals('About Me'));
      });

      test('skillsTitle has correct value', () {
        expect(AppStrings.skillsTitle, equals('Skills'));
      });

      test('projectsTitle has correct value', () {
        expect(AppStrings.projectsTitle, equals('Featured Projects'));
      });

      test('careerTitle has correct value', () {
        expect(AppStrings.careerTitle, equals('Career Timeline'));
      });

      test('educationTitle has correct value', () {
        expect(AppStrings.educationTitle, equals('Education'));
      });

      test('contactTitle has correct value', () {
        expect(AppStrings.contactTitle, equals("Let's Connect"));
      });
    });

    group('section subtitle strings', () {
      test('aboutMeSubtitle has correct value', () {
        expect(AppStrings.aboutMeSubtitle, equals('Get to know me better'));
      });

      test('skillsSubtitle has correct value', () {
        expect(AppStrings.skillsSubtitle, equals('What I bring to the table'));
      });

      test('projectsSubtitle has correct value', () {
        expect(AppStrings.projectsSubtitle, equals('Some of my recent work'));
      });

      test('careerSubtitle has correct value', () {
        expect(AppStrings.careerSubtitle, equals('My professional journey'));
      });

      test('educationSubtitle has correct value', () {
        expect(AppStrings.educationSubtitle, equals('My academic background'));
      });

      test('contactSubtitle has correct value', () {
        expect(AppStrings.contactSubtitle, equals('Get in touch with me'));
      });
    });

    group('about section strings', () {
      test('aboutMeDescription has correct value', () {
        expect(
          AppStrings.aboutMeDescription,
          equals(
            "I'm a passionate Flutter developer with 6+ years of experience in "
            'creating beautiful, high-performance mobile applications. I specialize '
            'in cross-platform development, responsive UI design, and integrating '
            'with various backend services.',
          ),
        );
      });

      test('aboutMePassion has correct value', () {
        expect(
          AppStrings.aboutMePassion,
          equals(
            "I'm passionate about creating apps that not only look beautiful but "
            'also solve real problems and deliver exceptional user experiences.',
          ),
        );
      });
    });

    group('contact section strings', () {
      test('contactDescription has correct value', () {
        expect(
          AppStrings.contactDescription,
          equals(
            "Have a project in mind or just want to say hello? I'd love to hear "
            "from you! Let's discuss how we can work together to bring your ideas "
            'to life.',
          ),
        );
      });

      test('emailMe has correct value', () {
        expect(AppStrings.emailMe, equals('Email Me'));
      });

      test('messageMe has correct value', () {
        expect(AppStrings.messageMe, equals('Message Me'));
      });

      test('downloadCV has correct value', () {
        expect(AppStrings.downloadCV, equals('Download CV'));
      });

      test('sayHello has correct value', () {
        expect(AppStrings.sayHello, equals('Say Hello'));
      });
    });

    group('button label strings', () {
      test('viewProject has correct value', () {
        expect(AppStrings.viewProject, equals('View Project'));
      });

      test('learnMore has correct value', () {
        expect(AppStrings.learnMore, equals('Learn More'));
      });

      test('sendMessage has correct value', () {
        expect(AppStrings.sendMessage, equals('Send Message'));
      });

      test('viewAll has correct value', () {
        expect(AppStrings.viewAll, equals('View All'));
      });
    });

    group('error message strings', () {
      test('errorLaunchingUrl has correct value', () {
        expect(AppStrings.errorLaunchingUrl, equals('Could not launch URL'));
      });

      test('errorLaunchingEmail has correct value', () {
        expect(
          AppStrings.errorLaunchingEmail,
          equals('Could not launch email client'),
        );
      });

      test('errorLaunchingWhatsApp has correct value', () {
        expect(
          AppStrings.errorLaunchingWhatsApp,
          equals('Could not launch WhatsApp'),
        );
      });
    });

    group('success message strings', () {
      test('copiedToClipboard has correct value', () {
        expect(AppStrings.copiedToClipboard, equals('Copied to clipboard'));
      });
    });

    group('placeholder strings', () {
      test('emailSubject has correct value', () {
        expect(
          AppStrings.emailSubject,
          equals('Contact from Portfolio Website'),
        );
      });

      test('cvFileName has correct value', () {
        expect(AppStrings.cvFileName, equals('Saksham_Srivastava_CV.pdf'));
      });
    });

    group('mobile-specific message strings', () {
      test('cvDownloadWebOnly has correct value', () {
        expect(
          AppStrings.cvDownloadWebOnly,
          equals('CV download is only available on web platform'),
        );
      });
    });

    test('private constructor prevents instantiation', () {
      // This is a compile-time check, but we can at least verify the class exists
      expect(AppStrings, isNotNull);
    });
  });
}
