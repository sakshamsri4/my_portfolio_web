import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/common/utils/error_utils_test_helper.dart';

void main() {
  group('ErrorUtilsTestHelper', () {
    setUp(() {
      ErrorUtilsTestHelper.isTestMode = true;
      ErrorUtilsTestHelper.resetTestValues();
    });

    tearDown(() {
      ErrorUtilsTestHelper.resetTestValues();
      ErrorUtilsTestHelper.isTestMode = false;
    });

    group('Test Mode Configuration', () {
      test('should be configurable for test mode', () {
        ErrorUtilsTestHelper.isTestMode = true;
        expect(ErrorUtilsTestHelper.isTestMode, isTrue);

        ErrorUtilsTestHelper.isTestMode = false;
        expect(ErrorUtilsTestHelper.isTestMode, isFalse);
      });

      test('should reset test values correctly', () {
        // Set some values
        ErrorUtilsTestHelper.lastErrorMessage = 'test error';
        ErrorUtilsTestHelper.lastErrorTitle = 'test title';
        ErrorUtilsTestHelper.lastSuccessMessage = 'test success';

        // Reset
        ErrorUtilsTestHelper.resetTestValues();

        // Verify all values are null
        expect(ErrorUtilsTestHelper.lastErrorMessage, isNull);
        expect(ErrorUtilsTestHelper.lastErrorTitle, isNull);
        expect(ErrorUtilsTestHelper.lastSuccessMessage, isNull);
        expect(ErrorUtilsTestHelper.lastSuccessTitle, isNull);
        expect(ErrorUtilsTestHelper.lastInfoMessage, isNull);
        expect(ErrorUtilsTestHelper.lastInfoTitle, isNull);
      });
    });

    group('Error Snackbar', () {
      test('should capture error snackbar in test mode', () {
        ErrorUtilsTestHelper.showErrorSnackbar('Error Title', 'Error Message');

        expect(ErrorUtilsTestHelper.lastErrorTitle, equals('Error Title'));
        expect(ErrorUtilsTestHelper.lastErrorMessage, equals('Error Message'));
      });

      test('should handle empty error messages', () {
        ErrorUtilsTestHelper.showErrorSnackbar('', '');

        expect(ErrorUtilsTestHelper.lastErrorTitle, equals(''));
        expect(ErrorUtilsTestHelper.lastErrorMessage, equals(''));
      });

      test('should handle special characters in error messages', () {
        const title = 'Error: Special Characters!@#\$%';
        const message = 'Message with\nnewlines and\ttabs';

        ErrorUtilsTestHelper.showErrorSnackbar(title, message);

        expect(ErrorUtilsTestHelper.lastErrorTitle, equals(title));
        expect(ErrorUtilsTestHelper.lastErrorMessage, equals(message));
      });

      test('should overwrite previous error messages', () {
        ErrorUtilsTestHelper.showErrorSnackbar('First Error', 'First Message');
        ErrorUtilsTestHelper.showErrorSnackbar('Second Error', 'Second Message');

        expect(ErrorUtilsTestHelper.lastErrorTitle, equals('Second Error'));
        expect(ErrorUtilsTestHelper.lastErrorMessage, equals('Second Message'));
      });
    });

    group('Success Snackbar', () {
      test('should capture success snackbar in test mode', () {
        ErrorUtilsTestHelper.showSuccessSnackbar('Success Title', 'Success Message');

        expect(ErrorUtilsTestHelper.lastSuccessTitle, equals('Success Title'));
        expect(ErrorUtilsTestHelper.lastSuccessMessage, equals('Success Message'));
      });

      test('should handle empty success messages', () {
        ErrorUtilsTestHelper.showSuccessSnackbar('', '');

        expect(ErrorUtilsTestHelper.lastSuccessTitle, equals(''));
        expect(ErrorUtilsTestHelper.lastSuccessMessage, equals(''));
      });

      test('should handle long success messages', () {
        const longTitle = 'Very Long Success Title That Exceeds Normal Length';
        const longMessage = 'Very long success message that contains a lot of text '
            'and might be used to test how the system handles lengthy content '
            'in success notifications and snackbars.';

        ErrorUtilsTestHelper.showSuccessSnackbar(longTitle, longMessage);

        expect(ErrorUtilsTestHelper.lastSuccessTitle, equals(longTitle));
        expect(ErrorUtilsTestHelper.lastSuccessMessage, equals(longMessage));
      });
    });

    group('Info Snackbar', () {
      test('should capture info snackbar in test mode', () {
        ErrorUtilsTestHelper.showInfoSnackbar('Info Title', 'Info Message');

        expect(ErrorUtilsTestHelper.lastInfoTitle, equals('Info Title'));
        expect(ErrorUtilsTestHelper.lastInfoMessage, equals('Info Message'));
      });

      test('should handle multiple info messages', () {
        ErrorUtilsTestHelper.showInfoSnackbar('Info 1', 'Message 1');
        expect(ErrorUtilsTestHelper.lastInfoTitle, equals('Info 1'));
        expect(ErrorUtilsTestHelper.lastInfoMessage, equals('Message 1'));

        ErrorUtilsTestHelper.showInfoSnackbar('Info 2', 'Message 2');
        expect(ErrorUtilsTestHelper.lastInfoTitle, equals('Info 2'));
        expect(ErrorUtilsTestHelper.lastInfoMessage, equals('Message 2'));
      });
    });

    group('URL Launch Error Handling', () {
      test('should handle URL launch errors correctly', () {
        const testUrl = 'https://example.com';
        final result = ErrorUtilsTestHelper.handleUrlLaunchError(testUrl);

        expect(result, equals('Could not launch $testUrl'));
        expect(ErrorUtilsTestHelper.lastErrorTitle, equals('Error'));
        expect(ErrorUtilsTestHelper.lastErrorMessage, equals('Could not launch $testUrl'));
      });

      test('should handle various URL formats', () {
        final urls = [
          'https://www.google.com',
          'mailto:test@example.com',
          'tel:+1234567890',
          'whatsapp://send?phone=1234567890',
          'invalid-url',
          '',
        ];

        for (final url in urls) {
          ErrorUtilsTestHelper.resetTestValues();
          final result = ErrorUtilsTestHelper.handleUrlLaunchError(url);

          expect(result, equals('Could not launch $url'));
          expect(ErrorUtilsTestHelper.lastErrorTitle, equals('Error'));
          expect(ErrorUtilsTestHelper.lastErrorMessage, equals('Could not launch $url'));
        }
      });
    });

    group('General Error Handling', () {
      test('should handle general errors without context', () {
        const error = 'Something went wrong';
        final result = ErrorUtilsTestHelper.handleError(error);

        expect(result, equals('An error occurred: $error'));
        expect(ErrorUtilsTestHelper.lastErrorTitle, equals('Error'));
        expect(ErrorUtilsTestHelper.lastErrorMessage, equals('An error occurred: $error'));
      });

      test('should handle general errors with context', () {
        const error = 'Network timeout';
        const context = 'API call';
        final result = ErrorUtilsTestHelper.handleError(error, context: context);

        expect(result, equals('Error in $context: $error'));
        expect(ErrorUtilsTestHelper.lastErrorTitle, equals('Error'));
        expect(ErrorUtilsTestHelper.lastErrorMessage, equals('Error in $context: $error'));
      });

      test('should handle different error types', () {
        final errors = [
          'String error',
          Exception('Exception error'),
          42,
          null,
          {'key': 'value'},
          ['list', 'error'],
        ];

        for (final error in errors) {
          ErrorUtilsTestHelper.resetTestValues();
          final result = ErrorUtilsTestHelper.handleError(error);

          expect(result, equals('An error occurred: $error'));
          expect(ErrorUtilsTestHelper.lastErrorMessage, contains(error.toString()));
        }
      });

      test('should handle errors with empty context', () {
        const error = 'Test error';
        final result = ErrorUtilsTestHelper.handleError(error, context: '');

        expect(result, equals('Error in : $error'));
        expect(ErrorUtilsTestHelper.lastErrorMessage, equals('Error in : $error'));
      });

      test('should handle errors with null context', () {
        const error = 'Test error';
        final result = ErrorUtilsTestHelper.handleError(error, context: null);

        expect(result, equals('An error occurred: $error'));
        expect(ErrorUtilsTestHelper.lastErrorMessage, equals('An error occurred: $error'));
      });
    });

    group('Non-Test Mode Behavior', () {
      test('should not capture messages when not in test mode', () {
        ErrorUtilsTestHelper.isTestMode = false;

        ErrorUtilsTestHelper.showErrorSnackbar('Error', 'Message');
        ErrorUtilsTestHelper.showSuccessSnackbar('Success', 'Message');
        ErrorUtilsTestHelper.showInfoSnackbar('Info', 'Message');

        expect(ErrorUtilsTestHelper.lastErrorTitle, isNull);
        expect(ErrorUtilsTestHelper.lastErrorMessage, isNull);
        expect(ErrorUtilsTestHelper.lastSuccessTitle, isNull);
        expect(ErrorUtilsTestHelper.lastSuccessMessage, isNull);
        expect(ErrorUtilsTestHelper.lastInfoTitle, isNull);
        expect(ErrorUtilsTestHelper.lastInfoMessage, isNull);
      });

      test('should still return error messages from handle methods in non-test mode', () {
        ErrorUtilsTestHelper.isTestMode = false;

        final urlResult = ErrorUtilsTestHelper.handleUrlLaunchError('test-url');
        final errorResult = ErrorUtilsTestHelper.handleError('test-error');

        expect(urlResult, equals('Could not launch test-url'));
        expect(errorResult, equals('An error occurred: test-error'));

        // But should not capture in test variables
        expect(ErrorUtilsTestHelper.lastErrorTitle, isNull);
        expect(ErrorUtilsTestHelper.lastErrorMessage, isNull);
      });
    });

    group('State Management', () {
      test('should maintain independent state for different message types', () {
        ErrorUtilsTestHelper.showErrorSnackbar('Error Title', 'Error Message');
        ErrorUtilsTestHelper.showSuccessSnackbar('Success Title', 'Success Message');
        ErrorUtilsTestHelper.showInfoSnackbar('Info Title', 'Info Message');

        expect(ErrorUtilsTestHelper.lastErrorTitle, equals('Error Title'));
        expect(ErrorUtilsTestHelper.lastErrorMessage, equals('Error Message'));
        expect(ErrorUtilsTestHelper.lastSuccessTitle, equals('Success Title'));
        expect(ErrorUtilsTestHelper.lastSuccessMessage, equals('Success Message'));
        expect(ErrorUtilsTestHelper.lastInfoTitle, equals('Info Title'));
        expect(ErrorUtilsTestHelper.lastInfoMessage, equals('Info Message'));
      });

      test('should allow partial resets', () {
        ErrorUtilsTestHelper.showErrorSnackbar('Error', 'Message');
        ErrorUtilsTestHelper.showSuccessSnackbar('Success', 'Message');

        // Manually reset only error values
        ErrorUtilsTestHelper.lastErrorTitle = null;
        ErrorUtilsTestHelper.lastErrorMessage = null;

        expect(ErrorUtilsTestHelper.lastErrorTitle, isNull);
        expect(ErrorUtilsTestHelper.lastErrorMessage, isNull);
        expect(ErrorUtilsTestHelper.lastSuccessTitle, equals('Success'));
        expect(ErrorUtilsTestHelper.lastSuccessMessage, equals('Message'));
      });
    });
  });
}
