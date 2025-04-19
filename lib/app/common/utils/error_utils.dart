import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

/// Utilities for error handling
class ErrorUtils {
  /// Private constructor to prevent instantiation
  ErrorUtils._();

  /// Show a standard error snackbar
  static void showErrorSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Get.theme.colorScheme.errorContainer,
      colorText: Get.theme.colorScheme.onErrorContainer,
    );
  }

  /// Show a standard success snackbar
  static void showSuccessSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      duration: const Duration(seconds: 2),
      backgroundColor: Get.theme.colorScheme.primaryContainer,
      colorText: Get.theme.colorScheme.onPrimaryContainer,
    );
  }

  /// Show a standard info snackbar
  static void showInfoSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      duration: const Duration(seconds: 2),
    );
  }

  /// Handle URL launch errors
  static void handleUrlLaunchError(String url) {
    final errorMessage = 'Could not launch $url';

    showErrorSnackbar(
      'Error',
      errorMessage,
    );

    // Log the error in debug mode
    if (kDebugMode) {
      print('Error launching URL: $url');
    }
  }

  /// Handle general errors
  static void handleError(dynamic error, {String? context}) {
    final errorMessage = context != null
        ? 'Error in $context: $error'
        : 'An error occurred: $error';

    showErrorSnackbar('Error', errorMessage);

    // Log the error in debug mode
    if (kDebugMode) {
      print(errorMessage);
    }
  }
}
