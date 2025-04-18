import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/modules/about/views/about_view.dart';
import 'package:my_portfolio_web/app/modules/contact/views/contact_view.dart';
import 'package:my_portfolio_web/app/modules/home/views/home_view.dart';
import 'package:my_portfolio_web/app/modules/projects/views/projects_view.dart';
import 'package:my_portfolio_web/app/routes/app_pages.dart';

void main() {
  group('AppPages', () {
    test('initial route should be home', () {
      expect(AppPages.initial, equals(Routes.home));
    });

    test('all required routes should be defined', () {
      final routes = AppPages.routes;

      // Check that we have routes for all main sections
      expect(routes.any((route) => route.name == Routes.home), isTrue);
      expect(routes.any((route) => route.name == Routes.about), isTrue);
      expect(routes.any((route) => route.name == Routes.projects), isTrue);
      expect(routes.any((route) => route.name == Routes.contact), isTrue);
    });

    test('routes should map to correct views', () {
      final routes = AppPages.routes;

      // Find each route
      final homeRoute = routes.firstWhere((route) => route.name == Routes.home);
      final aboutRoute =
          routes.firstWhere((route) => route.name == Routes.about);
      final projectsRoute =
          routes.firstWhere((route) => route.name == Routes.projects);
      final contactRoute =
          routes.firstWhere((route) => route.name == Routes.contact);

      // Check that each route maps to the correct view
      expect(homeRoute.page(), isA<HomeView>());
      expect(aboutRoute.page(), isA<AboutView>());
      expect(projectsRoute.page(), isA<ProjectsView>());
      expect(contactRoute.page(), isA<ContactView>());
    });

    test('route paths should be correctly defined', () {
      expect(Routes.home, equals('/home'));
      expect(Routes.about, equals('/about'));
      expect(Routes.projects, equals('/projects'));
      expect(Routes.contact, equals('/contact'));
    });
  });
}
