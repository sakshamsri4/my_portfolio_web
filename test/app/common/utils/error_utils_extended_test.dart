import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/common/utils/error_utils.dart';
import 'package:my_portfolio_web/app/common/utils/error_utils_test_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ErrorUtilsTestHelper', () {
    setUp(() {
      // Enable test mode for ErrorUtilsTestHelper
      ErrorUtilsTestHelper.isTestMode = true;
      ErrorUtilsTestHelper.resetTestValues();
    });

    test('handleError formats error messages correctly with context', () {
      // Call the test helper method
      final result =
          ErrorUtilsTestHelper.handleError('Test error', context: 'Testing');

      // Verify the error message format
      expect(result, equals('Error in Testing: Test error'));
      expect(ErrorUtilsTestHelper.lastErrorTitle, equals('Error'));
      expect(
        ErrorUtilsTestHelper.lastErrorMessage,
        equals('Error in Testing: Test error'),
      );
    });

    test('handleError formats error messages correctly without context', () {
      // Call the test helper method
      final result = ErrorUtilsTestHelper.handleError('Test error');

      // Verify the error message format
      expect(result, equals('An error occurred: Test error'));
      expect(ErrorUtilsTestHelper.lastErrorTitle, equals('Error'));
      expect(
        ErrorUtilsTestHelper.lastErrorMessage,
        equals('An error occurred: Test error'),
      );
    });

    test('handleUrlLaunchError formats URL error messages correctly', () {
      // Call the test helper method
      final result =
          ErrorUtilsTestHelper.handleUrlLaunchError('https://example.com');

      // Verify the error message format
      expect(result, equals('Could not launch https://example.com'));
      expect(ErrorUtilsTestHelper.lastErrorTitle, equals('Error'));
      expect(
        ErrorUtilsTestHelper.lastErrorMessage,
        equals('Could not launch https://example.com'),
      );
    });

    test('showErrorSnackbar sets correct values', () {
      // Call the test helper method
      ErrorUtilsTestHelper.showErrorSnackbar('Error Title', 'Error Message');

      // Verify the values are set correctly
      expect(ErrorUtilsTestHelper.lastErrorTitle, equals('Error Title'));
      expect(ErrorUtilsTestHelper.lastErrorMessage, equals('Error Message'));
    });

    test('showSuccessSnackbar sets correct values', () {
      // Call the test helper method
      ErrorUtilsTestHelper.showSuccessSnackbar(
        'Success Title',
        'Success Message',
      );

      // Verify the values are set correctly
      expect(ErrorUtilsTestHelper.lastSuccessTitle, equals('Success Title'));
      expect(
        ErrorUtilsTestHelper.lastSuccessMessage,
        equals('Success Message'),
      );
    });

    test('showInfoSnackbar sets correct values', () {
      // Call the test helper method
      ErrorUtilsTestHelper.showInfoSnackbar('Info Title', 'Info Message');

      // Verify the values are set correctly
      expect(ErrorUtilsTestHelper.lastInfoTitle, equals('Info Title'));
      expect(ErrorUtilsTestHelper.lastInfoMessage, equals('Info Message'));
    });
  });

  group('ErrorUtils', () {
    test('ErrorUtils class has the required methods', () {
      // Verify that ErrorUtils has the same methods
      expect(ErrorUtils.showErrorSnackbar, isA<Function>());
      expect(ErrorUtils.showSuccessSnackbar, isA<Function>());
      expect(ErrorUtils.showInfoSnackbar, isA<Function>());
      expect(ErrorUtils.handleError, isA<Function>());
      expect(ErrorUtils.handleUrlLaunchError, isA<Function>());
    });
  });
}
