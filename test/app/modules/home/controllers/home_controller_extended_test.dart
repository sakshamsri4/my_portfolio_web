import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:my_portfolio_web/app/data/models/tech_stack_item.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

class MockPortfolioRepository extends Mock implements PortfolioRepository {
  @override
  List<TechStackItem> getTechStack() => [
        const TechStackItem(
          name: 'Flutter',
          icon: IconData(0xf425, fontFamily: 'FontAwesome'),
          color: Colors.blue,
        ),
        const TechStackItem(
          name: 'Dart',
          icon: IconData(0xf426, fontFamily: 'FontAwesome'),
          color: Colors.blue,
        ),
      ];

  @override
  Map<String, Map<String, dynamic>> getSocialLinks() => {
        'linkedin': {'url': 'https://linkedin.com/test'},
        'github': {'url': 'https://github.com/test'},
        'twitter': {'url': 'https://twitter.com/test'},
        'whatsapp': {'url': 'https://whatsapp.com'},
      };

  @override
  List<String> getAnimatedGreetings() => ['Hello', 'Hi', 'Greetings'];

  @override
  List<String> getAnimatedIntroductions() =>
      ['I am a developer', 'I build apps'];

  @override
  List<Map<String, dynamic>> getSkillCategories() => [
        {
          'category': 'Frontend',
          'skills': ['Flutter', 'React', 'Angular'],
        },
        {
          'category': 'Backend',
          'skills': ['Node.js', 'Django', 'Flask'],
        },
      ];

  @override
  List<Map<String, String>> getProjects() => [
        {
          'title': 'Project 1',
          'description': 'Description 1',
          'image': 'assets/images/project1.jpg',
          'url': 'https://example.com/project1',
        },
        {
          'title': 'Project 2',
          'description': 'Description 2',
          'image': 'assets/images/project2.jpg',
          'url': 'https://example.com/project2',
        },
      ];

  @override
  List<Map<String, String>> getCareerTimeline() => [
        {
          'company': 'Company 1',
          'role': 'Developer',
          'duration': '2020-2022',
          'description': 'Worked on various projects',
        },
        {
          'company': 'Company 2',
          'role': 'Senior Developer',
          'duration': '2022-Present',
          'description': 'Leading development team',
        },
      ];

  @override
  Map<String, String> getContactInfo() => {
        'email': 'test@example.com',
        'phone': '+1234567890',
        'location': 'Test City, Country',
      };

  @override
  List<Map<String, String>> getEducationInfo() => [
        {
          'institution': 'University 1',
          'degree': 'Bachelor of Science',
          'duration': '2016-2020',
          'description': 'Computer Science',
        },
      ];

  @override
  String getProfessionalSummary() =>
      'Experienced developer with expertise in Flutter and Dart.';
}

void main() {
  late HomeController controller;
  late MockPortfolioRepository mockRepository;

  setUp(() {
    mockRepository = MockPortfolioRepository();
    controller = HomeController(repository: mockRepository);
    Get.testMode = true;
  });

  tearDown(Get.reset);

  group('HomeController Initialization', () {
    test('controller initializes with correct data from repository', () {
      // Verify that the controller has initialized with the mock data
      expect(controller.techStack, equals(mockRepository.getTechStack()));
      expect(controller.socialLinks, equals(mockRepository.getSocialLinks()));
      expect(
        controller.animatedGreetings,
        equals(mockRepository.getAnimatedGreetings()),
      );
      expect(
        controller.animatedIntroductions,
        equals(mockRepository.getAnimatedIntroductions()),
      );
      expect(
        controller.skillCategories,
        equals(mockRepository.getSkillCategories()),
      );
      expect(controller.projects, equals(mockRepository.getProjects()));
      expect(
        controller.careerTimeline,
        equals(mockRepository.getCareerTimeline()),
      );
      expect(controller.contactInfo, equals(mockRepository.getContactInfo()));
      expect(
        controller.educationInfo,
        equals(mockRepository.getEducationInfo()),
      );
      expect(
        controller.professionalSummary,
        equals(mockRepository.getProfessionalSummary()),
      );
    });

    test('controller initializes with default values', () {
      expect(controller.activeSection.value, equals('home'));
      expect(controller.isCarouselPlaying.value, isTrue);
      expect(controller.scrollController, isA<ScrollController>());
      expect(controller.aboutKey, isA<GlobalKey>());
      expect(controller.educationKey, isA<GlobalKey>());
      expect(controller.skillsKey, isA<GlobalKey>());
      expect(controller.projectsKey, isA<GlobalKey>());
      expect(controller.careerKey, isA<GlobalKey>());
      expect(controller.contactKey, isA<GlobalKey>());
    });
  });

  group('HomeController Skills', () {
    test('skills getter returns flattened skills list', () {
      final expectedSkills = [
        'Flutter',
        'React',
        'Angular',
        'Node.js',
        'Django',
        'Flask',
      ];
      expect(controller.skills, containsAll(expectedSkills));
      expect(controller.skills.length, equals(expectedSkills.length));
    });

    test('_computeSkills flattens skill categories correctly', () {
      // This is testing a private method indirectly through the skills getter
      final expectedSkills = [
        'Flutter',
        'React',
        'Angular',
        'Node.js',
        'Django',
        'Flask',
      ];
      expect(controller.skills, containsAll(expectedSkills));
      expect(controller.skills.length, equals(expectedSkills.length));
    });
  });

  group('HomeController Navigation', () {
    test('activeSection can be updated directly', () {
      controller.activeSection.value = 'about';
      expect(controller.activeSection.value, equals('about'));

      controller.activeSection.value = 'skills';
      expect(controller.activeSection.value, equals('skills'));

      controller.activeSection.value = 'home';
      expect(controller.activeSection.value, equals('home'));
    });

    test('scrollToSection method exists', () {
      expect(controller.scrollToSection, isA<Function>());
    });
  });

  group('HomeController Image Handling', () {
    test('getImageWithFallback returns fallback for project images', () {
      expect(
        controller.getImageWithFallback('assets/images/project1.jpg'),
        equals(controller.fallbackImageUrl),
      );
    });

    test('getImageWithFallback returns original path for non-project images',
        () {
      const testPath = 'assets/images/profile.jpg';
      expect(controller.getImageWithFallback(testPath), equals(testPath));
    });
  });

  group('HomeController Carousel', () {
    test('toggleCarouselPlay toggles isCarouselPlaying', () {
      // Initial value should be true
      expect(controller.isCarouselPlaying.value, isTrue);

      // Toggle once
      controller.toggleCarouselPlay();
      expect(controller.isCarouselPlaying.value, isFalse);

      // Toggle again
      controller.toggleCarouselPlay();
      expect(controller.isCarouselPlaying.value, isTrue);
    });
  });

  group('HomeController Resource Management', () {
    test('onClose is a function', () {
      expect(controller.onClose, isA<Function>());
    });
  });

  group('HomeController URL Launching', () {
    test('launchProjectUrl is a function', () {
      expect(controller.launchProjectUrl, isA<Function>());
    });

    test('launchEmail is a function', () {
      expect(controller.launchEmail, isA<Function>());
    });

    test('launchWhatsApp is a function', () {
      expect(controller.launchWhatsApp, isA<Function>());
    });
  });

  group('HomeController Clipboard', () {
    test('copyToClipboard is a function', () {
      expect(controller.copyToClipboard, isA<Function>());
    });
  });

  group('HomeController CV Download', () {
    test('downloadCV is a function', () {
      expect(controller.downloadCV, isA<Function>());
    });
  });
}
