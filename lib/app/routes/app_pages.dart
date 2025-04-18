import 'package:get/get.dart';

import 'package:my_portfolio_web/app/modules/about/bindings/about_binding.dart';
import 'package:my_portfolio_web/app/modules/about/views/about_view.dart';
import 'package:my_portfolio_web/app/modules/contact/bindings/contact_binding.dart';
import 'package:my_portfolio_web/app/modules/contact/views/contact_view.dart';
import 'package:my_portfolio_web/app/modules/home/bindings/home_binding.dart';
import 'package:my_portfolio_web/app/modules/home/views/home_view.dart';
import 'package:my_portfolio_web/app/modules/projects/bindings/projects_binding.dart';
import 'package:my_portfolio_web/app/modules/projects/views/projects_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage<dynamic>(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.about,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.projects,
      page: () => const ProjectsView(),
      binding: ProjectsBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.contact,
      page: () => const ContactView(),
      binding: ContactBinding(),
    ),
  ];
}
