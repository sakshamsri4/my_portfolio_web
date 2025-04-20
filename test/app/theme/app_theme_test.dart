import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/theme/app_theme.dart';

void main() {
  // Initialize Flutter binding
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AppTheme', () {
    test('has correct color constants', () {
      // Test color constants
      expect(AppTheme.primarySwatch, isA<MaterialColor>());
      expect(AppTheme.primarySwatch.value, equals(0xFF675AF2));
      expect(AppTheme.backgroundColor, equals(const Color(0xFFF4F0FF)));
      expect(AppTheme.textPrimary, equals(const Color(0xFF333333)));
      expect(AppTheme.textSecondary, equals(const Color(0xFF666666)));
      expect(AppTheme.textLight, equals(const Color(0xFF999999)));
    });
  });
}
