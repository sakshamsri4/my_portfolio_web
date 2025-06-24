import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/analytics_controller.dart';
import 'package:my_portfolio_web/app/controllers/career_controller.dart';
import 'package:my_portfolio_web/app/controllers/contact_controller.dart';
import 'package:my_portfolio_web/app/controllers/navigation_controller.dart';
import 'package:my_portfolio_web/app/controllers/projects_controller.dart';
import 'package:my_portfolio_web/app/controllers/skills_controller.dart';
import 'package:my_portfolio_web/app/controllers/theme_controller.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository_interface.dart';

/// Factory for creating and registering controllers
class ControllerFactory {
  /// Private constructor to prevent instantiation
  ControllerFactory._();

  /// Initialize all controllers
  static void initializeControllers() {
    final repository = Get.find<PortfolioRepositoryInterface>();

    // Register all controllers with GetX dependency injection
    // Using cascade notation for cleaner code
    Get
      ..put<AnalyticsController>(AnalyticsController(), permanent: true)
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

    // Initialize all controllers
    _initializeAllControllers();
  }

  /// Initialize all registered controllers
  static void _initializeAllControllers() {
    // Initialize each controller individually
    try {
      Get.find<NavigationController>().initializeController();
      Get.find<ProjectsController>().initializeController();
      Get.find<CareerController>().initializeController();
      Get.find<ContactController>().initializeController();
      Get.find<SkillsController>().initializeController();
      Get.find<ThemeController>().initializeController();
    } on Exception catch (e) {
      debugPrint('Error initializing controllers: $e');
    }
  }

  /// Clean up all controllers
  static void cleanupControllers() {
    // Clean up each controller individually
    try {
      Get.find<NavigationController>().cleanupResources();
      Get.find<ProjectsController>().cleanupResources();
      Get.find<CareerController>().cleanupResources();
      Get.find<ContactController>().cleanupResources();
      Get.find<SkillsController>().cleanupResources();
      Get.find<ThemeController>().cleanupResources();
    } on Exception catch (e) {
      debugPrint('Error cleaning up controllers: $e');
    }
  }
}
