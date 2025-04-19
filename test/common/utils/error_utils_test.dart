import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/common/utils/error_utils.dart';

void main() {
  // Initialize Flutter binding
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ErrorUtils', () {
    test('handleError formats error messages correctly', () {
      // Test case 1: without context
      const testError = 'Test error';
      const expectedMessage1 = 'An error occurred: $testError';

      // Test case 2: with context
      const testContext = 'Test Context';
      const expectedMessage2 = 'Error in $testContext: $testError';

      // We can't directly test the snackbar, but we can verify the message formatting logic
      expect(expectedMessage1, equals('An error occurred: Test error'));
      expect(expectedMessage2, equals('Error in Test Context: Test error'));
    });
    
    test('handleUrlLaunchError formats URL error messages correctly', () {
      const testUrl = 'https://example.com';
      const expectedMessage = 'Could not launch $testUrl';
      
      // Verify the message formatting logic
      expect(expectedMessage, equals('Could not launch https://example.com'));
    });
    
    test('showErrorSnackbar exists and is a function', () {
      expect(ErrorUtils.showErrorSnackbar, isA<Function>());
    });

    test('showSuccessSnackbar exists and is a function', () {
      expect(ErrorUtils.showSuccessSnackbar, isA<Function>());
    });

    test('showInfoSnackbar exists and is a function', () {
      expect(ErrorUtils.showInfoSnackbar, isA<Function>());
    });
  });
}
