import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/theme_controller.dart';
import 'package:my_portfolio_web/app/routes/app_pages.dart';
import 'package:my_portfolio_web/app/services/analytics_service.dart';
import 'package:my_portfolio_web/app/theme/app_theme.dart';
import 'package:my_portfolio_web/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the theme controller from GetX
    final themeController = Get.find<ThemeController>();

    // Get the analytics service for navigation tracking
    final analyticsService = Get.find<AnalyticsService>();

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
          analyticsService.observer,
        ],
      ),
    );
  }
}
