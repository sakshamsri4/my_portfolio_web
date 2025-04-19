import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/skills_controller.dart';
import 'package:my_portfolio_web/app/data/models/tech_stack_item.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository_interface.dart';

void main() {
  group('SkillsController', () {
    late SkillsController skillsController;
    late PortfolioRepositoryInterface repository;

    setUp(() {
      // Register the repository
      repository = PortfolioRepository();
      Get.put<PortfolioRepositoryInterface>(repository);

      // Create the controller with the repository
      skillsController = SkillsController(repository: repository);
    });

    tearDown(Get.reset);

    test('techStack should be populated from repository', () {
      // Verify that techStack is populated correctly
      expect(skillsController.techStack, isA<List<TechStackItem>>());
      expect(skillsController.techStack, isNotEmpty);

      // Verify that techStack matches repository data
      final repoTechStack = repository.getTechStack();
      expect(skillsController.techStack.length, equals(repoTechStack.length));

      // Check a few items to ensure they match
      expect(
        skillsController.techStack.first.name,
        equals(repoTechStack.first.name),
      );
      expect(
        skillsController.techStack.last.name,
        equals(repoTechStack.last.name),
      );
    });

    test('skillCategories should be populated from repository', () {
      // Verify that skillCategories is populated correctly
      expect(
        skillsController.skillCategories,
        isA<List<Map<String, dynamic>>>(),
      );
      expect(skillsController.skillCategories, isNotEmpty);

      // Verify that skillCategories matches repository data
      final repoSkillCategories = repository.getSkillCategories();
      expect(
        skillsController.skillCategories.length,
        equals(repoSkillCategories.length),
      );

      // Check a few categories to ensure they match
      expect(
        skillsController.skillCategories.first['category'],
        equals(repoSkillCategories.first['category']),
      );
      expect(
        skillsController.skillCategories.last['category'],
        equals(repoSkillCategories.last['category']),
      );
    });

    test('skills getter should return flattened list of all skills', () {
      // Get all skills from the controller
      final skills = skillsController.skills;

      // Verify that skills is a non-empty list
      expect(skills, isA<List<String>>());
      expect(skills, isNotEmpty);

      // Manually compute the expected skills list
      final expectedSkills = <String>[];
      for (final category in skillsController.skillCategories) {
        expectedSkills.addAll(category['skills']! as List<String>);
      }

      // Verify that skills matches the expected list
      expect(skills.length, equals(expectedSkills.length));
      for (final skill in expectedSkills) {
        expect(skills.contains(skill), isTrue);
      }
    });

    test('initializeController should not throw exceptions', () {
      // This method should complete without throwing exceptions
      expect(() => skillsController.initializeController(), returnsNormally);
    });

    test('cleanupResources should not throw exceptions', () {
      // This method should complete without throwing exceptions
      expect(() => skillsController.cleanupResources(), returnsNormally);
    });
  });
}
