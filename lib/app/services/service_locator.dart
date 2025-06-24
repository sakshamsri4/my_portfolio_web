import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/controller_factory.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository_interface.dart';
import 'package:my_portfolio_web/app/services/analytics_service.dart';

/// Service locator for dependency injection
class ServiceLocator {
  /// Private constructor to prevent instantiation
  ServiceLocator._();

  /// Initialize all services and dependencies
  static Future<void> init() async {
    // Register and initialize Analytics service
    Get.put<AnalyticsService>(
      AnalyticsService(),
      permanent: true,
    );
    await Get.find<AnalyticsService>().initialize();

    // Register repositories
    Get.put<PortfolioRepositoryInterface>(
      PortfolioRepository(),
      permanent: true,
    );

    // Initialize repositories
    await Get.find<PortfolioRepositoryInterface>().initialize();

    // Initialize controllers
    ControllerFactory.initializeControllers();
  }

  /// Clean up all services and dependencies
  static void dispose() {
    // Clean up controllers
    ControllerFactory.cleanupControllers();

    // Clean up repositories
    Get.find<PortfolioRepositoryInterface>().dispose();
  }
}
