import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/services/log_service.dart';

/// Observer for logging navigation events
class LogNavigationObserver extends GetObserver {
  final LogService _logger = LogService.instance;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _logger.i(
        'Navigation: Pushed ${route.settings.name} (Previous: ${previousRoute?.settings.name})');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _logger.i(
        'Navigation: Popped ${route.settings.name} (Previous: ${previousRoute?.settings.name})');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _logger.i(
        'Navigation: Replaced ${oldRoute?.settings.name} with ${newRoute?.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    _logger.i('Navigation: Removed ${route.settings.name}');
  }
}
