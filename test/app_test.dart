import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/routes/app_pages.dart';

void main() {
  group('Routes', () {
    test('AppPages should have correct initial route', () {
      // This test verifies that the initial route is set correctly
      expect(AppPages.initial, equals(Routes.home));
    });

    test('AppPages should have all required routes', () {
      // This test verifies that all required routes are defined
      final routes = AppPages.routes;

      // Check that we have routes for all main sections
      expect(routes.any((route) => route.name == Routes.home), isTrue);
      expect(routes.any((route) => route.name == Routes.about), isTrue);
      expect(routes.any((route) => route.name == Routes.projects), isTrue);
      expect(routes.any((route) => route.name == Routes.contact), isTrue);
    });
  });
}
