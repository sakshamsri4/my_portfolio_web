import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/theme_controller.dart';
import 'package:my_portfolio_web/app/routes/app_pages.dart';
import 'package:my_portfolio_web/app/theme/app_theme.dart';
import 'package:my_portfolio_web/app/utils/log_navigation_observer.dart';
import 'package:my_portfolio_web/gen/l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the theme controller from GetX
    final themeController = Get.find<ThemeController>();

    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Portfolio',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeController.themeMode.value,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
        navigatorObservers: [
          LogNavigationObserver(),
        ],
      ),
    );
  }
}
