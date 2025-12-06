import 'package:get/get.dart';
import 'package:my_portfolio_web/app/services/log_service.dart';

/// Base controller interface for all controllers in the app
abstract class BaseController extends GetxController {
  /// Logger instance
  late final LogService logger;

  /// Initializes the controller
  void initializeController();

  /// Cleans up resources when controller is no longer needed
  void cleanupResources();

  @override
  void onInit() {
    super.onInit();
    try {
      logger = Get.find<LogService>();
      logger.d('$runtimeType initialized');
    } on Object {
      // Fallback if logger not found (e.g. during testing)
      LogService.instance.i('$runtimeType initialized (Logger not found)');
    }
    initializeController();
  }

  @override
  void onReady() {
    super.onReady();
    logger.d('$runtimeType ready');
  }

  @override
  void onClose() {
    logger.d('$runtimeType closing');
    cleanupResources();
    super.onClose();
  }

  /// Helper to log info messages
  void logInfo(String message) {
    logger.i('[$runtimeType] $message');
  }

  /// Helper to log error messages
  void logError(String message, [dynamic error, StackTrace? stackTrace]) {
    logger.e('[$runtimeType] $message', error, stackTrace);
  }
}
