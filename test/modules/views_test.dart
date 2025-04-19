import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/career_controller.dart';
import 'package:my_portfolio_web/app/controllers/contact_controller.dart';
import 'package:my_portfolio_web/app/controllers/navigation_controller.dart';
import 'package:my_portfolio_web/app/controllers/projects_controller.dart';
import 'package:my_portfolio_web/app/controllers/skills_controller.dart';
import 'package:my_portfolio_web/app/controllers/theme_controller.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository_interface.dart';
import 'package:my_portfolio_web/app/modules/about/controllers/about_controller.dart';
import 'package:my_portfolio_web/app/modules/contact/controllers/contact_controller.dart'
    as module_contact;
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:my_portfolio_web/app/modules/projects/controllers/projects_controller.dart'
    as module_projects;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    // Register the repository
    final repository = PortfolioRepository();
    Get
      ..put<PortfolioRepositoryInterface>(repository, permanent: true)
      ..put<NavigationController>(NavigationController(), permanent: true)
      ..put<ProjectsController>(
        ProjectsController(repository: repository),
        permanent: true,
      )
      ..put<CareerController>(
        CareerController(repository: repository),
        permanent: true,
      )
      ..put<ContactController>(
        ContactController(repository: repository),
        permanent: true,
      )
      ..put<SkillsController>(
        SkillsController(repository: repository),
        permanent: true,
      )
      ..put<ThemeController>(ThemeController(), permanent: true);
  });

  tearDown(Get.reset);

  group('Module Controllers', () {
    // Test that controllers can be registered and accessed
    test('HomeController can be registered', () {
      // Register the HomeController
      final repository = Get.find<PortfolioRepositoryInterface>();
      Get.put(HomeController(repository: repository as PortfolioRepository));

      // Verify that the controller is registered
      expect(Get.isRegistered<HomeController>(), isTrue);
    });

    test('AboutController can be registered', () {
      // Register the AboutController
      Get.put(AboutController());

      // Verify that the controller is registered
      expect(Get.isRegistered<AboutController>(), isTrue);
    });

    test('Module ProjectsController can be registered', () {
      // Use a unique key to avoid conflicts with the app controller
      Get.put(module_projects.ProjectsController(), tag: 'module');

      // Verify that the controller is registered with the tag
      expect(
        Get.isRegistered<module_projects.ProjectsController>(tag: 'module'),
        isTrue,
      );
    });

    test('Module ContactController can be registered', () {
      // Use a unique key to avoid conflicts with the app controller
      Get.put(module_contact.ContactController(), tag: 'module');

      // Verify that the controller is registered with the tag
      expect(
        Get.isRegistered<module_contact.ContactController>(tag: 'module'),
        isTrue,
      );
    });
  });
}
