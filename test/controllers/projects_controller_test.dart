import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/projects_controller.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ProjectsController', () {
    late ProjectsController projectsController;
    late PortfolioRepositoryInterface repository;

    setUp(() {
      // Register the repository
      repository = PortfolioRepository();
      Get.put<PortfolioRepositoryInterface>(repository);

      // Create the controller with the repository
      projectsController = ProjectsController(repository: repository);
    });

    tearDown(Get.reset);

    test('projects should be populated from repository', () {
      // Verify that projects is populated correctly
      expect(projectsController.projects, isA<List<Map<String, String>>>());
      expect(projectsController.projects, isNotEmpty);

      // Verify that projects matches repository data
      final repoProjects = repository.getProjects();
      expect(projectsController.projects.length, equals(repoProjects.length));

      // Check a few projects to ensure they match
      expect(
        projectsController.projects.first['title'],
        equals(repoProjects.first['title']),
      );
      expect(
        projectsController.projects.last['title'],
        equals(repoProjects.last['title']),
      );
    });

    test('isCarouselPlaying should be initially true', () {
      expect(projectsController.isCarouselPlaying.value, isTrue);
    });

    test('toggleCarouselPlay should toggle isCarouselPlaying', () {
      // Initially true
      expect(projectsController.isCarouselPlaying.value, isTrue);

      // Toggle to false
      projectsController.toggleCarouselPlay();
      expect(projectsController.isCarouselPlaying.value, isFalse);

      // Toggle back to true
      projectsController.toggleCarouselPlay();
      expect(projectsController.isCarouselPlaying.value, isTrue);
    });

    test('getImageWithFallback should return fallback for empty path', () {
      final fallbackImage = projectsController.fallbackImageUrl;

      // Empty path should return fallback
      expect(
        projectsController.getImageWithFallback(''),
        equals(fallbackImage),
      );

      // Path containing 'project' should return fallback
      expect(
        projectsController.getImageWithFallback('project_image.jpg'),
        equals(fallbackImage),
      );

      // Valid path should return the path
      const validPath = 'assets/images/valid_image.jpg';
      expect(
        projectsController.getImageWithFallback(validPath),
        equals(validPath),
      );
    });

    test('initializeController should not throw exceptions', () {
      // This method should complete without throwing exceptions
      expect(() => projectsController.initializeController(), returnsNormally);
    });

    test('cleanupResources should not throw exceptions', () {
      // This method should complete without throwing exceptions
      expect(() => projectsController.cleanupResources(), returnsNormally);
    });
  });
}
