import 'package:flutter/foundation.dart';

/// Test helper for ErrorUtils
/// This class is used to test the ErrorUtils class without using GetX
class ErrorUtilsTestHelper {
  /// Private constructor to prevent instantiation
  ErrorUtilsTestHelper._();

  /// Flag to indicate if we're in test mode
  static bool isTestMode = false;

  /// Last error message
  static String? lastErrorMessage;

  /// Last error title
  static String? lastErrorTitle;

  /// Last success message
  static String? lastSuccessMessage;

  /// Last success title
  static String? lastSuccessTitle;

  /// Last info message
  static String? lastInfoMessage;

  /// Last info title
  static String? lastInfoTitle;

  /// Show a standard error snackbar
  static void showErrorSnackbar(String title, String message) {
    if (isTestMode) {
      lastErrorTitle = title;
      lastErrorMessage = message;
      return;
    }

    // In real implementation, this would show a snackbar
    if (kDebugMode) {
      print('ERROR: $title - $message');
    }
  }

  /// Show a standard success snackbar
  static void showSuccessSnackbar(String title, String message) {
    if (isTestMode) {
      lastSuccessTitle = title;
      lastSuccessMessage = message;
      return;
    }

    // In real implementation, this would show a snackbar
    if (kDebugMode) {
      print('SUCCESS: $title - $message');
    }
  }

  /// Show a standard info snackbar
  static void showInfoSnackbar(String title, String message) {
    if (isTestMode) {
      lastInfoTitle = title;
      lastInfoMessage = message;
      return;
    }

    // In real implementation, this would show a snackbar
    if (kDebugMode) {
      print('INFO: $title - $message');
    }
  }

  /// Handle URL launch errors
  static String handleUrlLaunchError(String url) {
    final errorMessage = 'Could not launch $url';

    showErrorSnackbar(
      'Error',
      errorMessage,
    );

    // Log the error in debug mode
    if (kDebugMode) {
      print('Error launching URL: $url');
    }

    return errorMessage;
  }

  /// Handle general errors
  static String handleError(dynamic error, {String? context}) {
    final errorMessage = context != null
        ? 'Error in $context: $error'
        : 'An error occurred: $error';

    showErrorSnackbar('Error', errorMessage);

    // Log the error in debug mode
    if (kDebugMode) {
      print(errorMessage);
    }

    return errorMessage;
  }

  /// Reset all test values
  static void resetTestValues() {
    lastErrorMessage = null;
    lastErrorTitle = null;
    lastSuccessMessage = null;
    lastSuccessTitle = null;
    lastInfoMessage = null;
    lastInfoTitle = null;
  }
}
