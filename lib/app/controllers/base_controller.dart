import 'package:get/get.dart';

/// Base controller interface for all controllers in the app
abstract class BaseController extends GetxController {
  /// Initializes the controller
  void initializeController();
  
  /// Cleans up resources when controller is no longer needed
  void cleanupResources();
}
