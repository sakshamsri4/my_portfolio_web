import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/modules/about/bindings/about_binding.dart';
import 'package:my_portfolio_web/app/modules/about/views/about_view.dart';
import 'package:my_portfolio_web/app/modules/contact/bindings/contact_binding.dart';
import 'package:my_portfolio_web/app/modules/contact/views/contact_view.dart';
import 'package:my_portfolio_web/app/modules/home/bindings/home_binding.dart';
import 'package:my_portfolio_web/app/modules/home/views/home_view.dart';
import 'package:my_portfolio_web/app/modules/projects/bindings/projects_binding.dart';
import 'package:my_portfolio_web/app/modules/projects/views/projects_view.dart';
import 'package:my_portfolio_web/app/routes/app_pages.dart';

void main() {
  group('AppPages', () {
    test('initial route is home', () {
      expect(AppPages.initial, equals(Routes.home));
    });

    test('routes are correctly defined', () {
      // Verify the number of routes
      expect(AppPages.routes.length, equals(4));

      // Verify each route
      final homeRoute =
          AppPages.routes.firstWhere((r) => r.name == Routes.home);
      final aboutRoute =
          AppPages.routes.firstWhere((r) => r.name == Routes.about);
      final projectsRoute =
          AppPages.routes.firstWhere((r) => r.name == Routes.projects);
      final contactRoute =
          AppPages.routes.firstWhere((r) => r.name == Routes.contact);

      // Verify home route
      expect(homeRoute.name, equals('/home'));
      expect(homeRoute.page(), isA<HomeView>());
      expect(homeRoute.binding, isA<HomeBinding>());

      // Verify about route
      expect(aboutRoute.name, equals('/about'));
      expect(aboutRoute.page(), isA<AboutView>());
      expect(aboutRoute.binding, isA<AboutBinding>());

      // Verify projects route
      expect(projectsRoute.name, equals('/projects'));
      expect(projectsRoute.page(), isA<ProjectsView>());
      expect(projectsRoute.binding, isA<ProjectsBinding>());

      // Verify contact route
      expect(contactRoute.name, equals('/contact'));
      expect(contactRoute.page(), isA<ContactView>());
      expect(contactRoute.binding, isA<ContactBinding>());
    });
  });

  group('Routes', () {
    test('route constants are correctly defined', () {
      expect(Routes.home, equals('/home'));
      expect(Routes.about, equals('/about'));
      expect(Routes.projects, equals('/projects'));
      expect(Routes.contact, equals('/contact'));
    });
  });
}
