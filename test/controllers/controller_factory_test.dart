import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/career_controller.dart';
import 'package:my_portfolio_web/app/controllers/contact_controller.dart';
import 'package:my_portfolio_web/app/controllers/controller_factory.dart';
import 'package:my_portfolio_web/app/controllers/navigation_controller.dart';
import 'package:my_portfolio_web/app/controllers/projects_controller.dart';
import 'package:my_portfolio_web/app/controllers/skills_controller.dart';
import 'package:my_portfolio_web/app/controllers/theme_controller.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository_interface.dart';

import '../mocks/test_setup.dart';

void main() {
  group('ControllerFactory', () {
    setUp(() {
      // Set up analytics dependencies first
      setupAnalyticsDependencies();

      // Register the repository
      Get.put<PortfolioRepositoryInterface>(
        PortfolioRepository(),
        permanent: true,
      );
    });

    tearDown(() {
      cleanupTestEnvironment();
    });

    test('initializeControllers should register all controllers', () {
      // Initialize controllers
      ControllerFactory.initializeControllers();

      // Verify that all controllers are registered
      expect(Get.isRegistered<NavigationController>(), isTrue);
      expect(Get.isRegistered<ProjectsController>(), isTrue);
      expect(Get.isRegistered<CareerController>(), isTrue);
      expect(Get.isRegistered<ContactController>(), isTrue);
      expect(Get.isRegistered<SkillsController>(), isTrue);
      expect(Get.isRegistered<ThemeController>(), isTrue);

      // Verify that controllers can be found
      expect(Get.find<NavigationController>(), isA<NavigationController>());
      expect(Get.find<ProjectsController>(), isA<ProjectsController>());
      expect(Get.find<CareerController>(), isA<CareerController>());
      expect(Get.find<ContactController>(), isA<ContactController>());
      expect(Get.find<SkillsController>(), isA<SkillsController>());
      expect(Get.find<ThemeController>(), isA<ThemeController>());
    });

    test('cleanupControllers should not throw exceptions', () {
      // Initialize controllers first
      ControllerFactory.initializeControllers();

      // Cleanup should not throw exceptions
      expect(ControllerFactory.cleanupControllers, returnsNormally);
    });

    test('initializeControllers should handle errors gracefully', () {
      // Remove the repository to cause an error
      Get.delete<PortfolioRepositoryInterface>();

      // Should not throw an exception even though there will be errors
      expect(ControllerFactory.initializeControllers, returnsNormally);
    });
  });
}
