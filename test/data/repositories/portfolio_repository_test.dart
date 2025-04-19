import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/data/models/tech_stack_item.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository.dart';

void main() {
  group('PortfolioRepository', () {
    late PortfolioRepository repository;

    setUp(() {
      repository = PortfolioRepository();
    });

    test('initialize should complete without errors', () async {
      await expectLater(repository.initialize(), completes);
    });

    test('dispose should not throw', () {
      expect(() => repository.dispose(), returnsNormally);
    });

    test('getTechStack should return a non-empty list of TechStackItem', () {
      final techStack = repository.getTechStack();
      expect(techStack, isA<List<TechStackItem>>());
      expect(techStack, isNotEmpty);

      // Verify the first item has expected properties
      final firstItem = techStack.first;
      expect(firstItem.name, isNotEmpty);
      expect(firstItem.color, isNotNull);
    });

    test('getSocialLinks should return a non-empty map with expected keys', () {
      final socialLinks = repository.getSocialLinks();
      expect(socialLinks, isA<Map<String, Map<String, dynamic>>>());
      expect(socialLinks, isNotEmpty);

      // Verify common social media platforms are included
      expect(socialLinks.containsKey('linkedin'), isTrue);
      expect(socialLinks.containsKey('github'), isTrue);

      // Verify structure of a social link entry
      final linkedinEntry = socialLinks['linkedin']!;
      expect(linkedinEntry.containsKey('url'), isTrue);
      expect(linkedinEntry.containsKey('icon'), isTrue);
      expect(linkedinEntry.containsKey('color'), isTrue);
    });

    test('getAnimatedGreetings should return a non-empty list of strings', () {
      final greetings = repository.getAnimatedGreetings();
      expect(greetings, isA<List<String>>());
      expect(greetings, isNotEmpty);
      expect(greetings.first, isA<String>());
    });

    test('getAnimatedIntroductions should return a non-empty list of strings',
        () {
      final introductions = repository.getAnimatedIntroductions();
      expect(introductions, isA<List<String>>());
      expect(introductions, isNotEmpty);
      expect(introductions.first, isA<String>());
    });

    test(
        'getSkillCategories should return a non-empty list with expected structure',
        () {
      final skillCategories = repository.getSkillCategories();
      expect(skillCategories, isA<List<Map<String, dynamic>>>());
      expect(skillCategories, isNotEmpty);

      // Verify structure of a skill category
      final firstCategory = skillCategories.first;
      expect(firstCategory.containsKey('category'), isTrue);
      expect(firstCategory.containsKey('skills'), isTrue);
      expect(firstCategory['skills'], isA<List<String>>());
      expect(firstCategory['skills'], isNotEmpty);
    });

    test('getProjects should return a non-empty list with expected structure',
        () {
      final projects = repository.getProjects();
      expect(projects, isA<List<Map<String, String>>>());
      expect(projects, isNotEmpty);

      // Verify structure of a project
      final firstProject = projects.first;
      expect(firstProject.containsKey('title'), isTrue);
      expect(firstProject.containsKey('description'), isTrue);
      expect(firstProject.containsKey('image'), isTrue);
      expect(firstProject.containsKey('url'), isTrue);
    });

    test(
        'getCareerTimeline should return a non-empty list with expected structure',
        () {
      final careerTimeline = repository.getCareerTimeline();
      expect(careerTimeline, isA<List<Map<String, String>>>());
      expect(careerTimeline, isNotEmpty);

      // Verify structure of a career entry
      final firstEntry = careerTimeline.first;
      expect(firstEntry.containsKey('company'), isTrue);
      expect(firstEntry.containsKey('role'), isTrue);
      expect(firstEntry.containsKey('period'), isTrue);
      expect(firstEntry.containsKey('description'), isTrue);
    });

    test('getContactInfo should return a map with expected keys', () {
      final contactInfo = repository.getContactInfo();
      expect(contactInfo, isA<Map<String, String>>());

      // Verify expected contact information is included
      expect(contactInfo.containsKey('email'), isTrue);
      expect(contactInfo.containsKey('phone'), isTrue);
    });

    test(
        'getEducationInfo should return a non-empty list with expected structure',
        () {
      final educationInfo = repository.getEducationInfo();
      expect(educationInfo, isA<List<Map<String, String>>>());
      expect(educationInfo, isNotEmpty);

      // Verify structure of an education entry
      final firstEntry = educationInfo.first;
      expect(firstEntry.containsKey('institution'), isTrue);
      expect(firstEntry.containsKey('degree'), isTrue);
      expect(firstEntry.containsKey('period'), isTrue);
    });

    test('getProfessionalSummary should return a non-empty string', () {
      final summary = repository.getProfessionalSummary();
      expect(summary, isA<String>());
      expect(summary, isNotEmpty);
    });
  });
}
