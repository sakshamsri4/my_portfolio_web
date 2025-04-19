import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/theme/app_theme.dart';

void main() {
  // Initialize Flutter binding
  TestWidgetsFlutterBinding.ensureInitialized();
  group('AppTheme', () {
    test('primarySwatch should have correct primary color', () {
      expect(AppTheme.primarySwatch.value, equals(0xFF675AF2));
    });

    test('backgroundColor should have correct value', () {
      expect(AppTheme.backgroundColor.value, equals(0xFFF4F0FF));
    });

    test('textPrimary should have correct value', () {
      expect(AppTheme.textPrimary.value, equals(0xFF333333));
    });

    test('textSecondary should have correct value', () {
      expect(AppTheme.textSecondary.value, equals(0xFF666666));
    });

    test('textLight should have correct value', () {
      expect(AppTheme.textLight.value, equals(0xFF999999));
    });
  });
}
