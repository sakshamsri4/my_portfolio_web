import 'package:get/get.dart';

import 'package:my_portfolio_web/app/modules/home/bindings/home_binding.dart';
import 'package:my_portfolio_web/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
