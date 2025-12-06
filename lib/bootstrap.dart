import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:my_portfolio_web/app/services/log_service.dart';
import 'package:my_portfolio_web/app/services/service_locator.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  // Run app in a zone to catch async errors
  await runZonedGuarded(
    () async {
      // Ensure Flutter binding is initialized inside the zone
      WidgetsFlutterBinding.ensureInitialized();

      // Firebase initialization is handled by JavaScript SDK for web
      // No Flutter Firebase initialization needed to avoid platform channel conflicts
      if (kIsWeb) {
        log('Using Firebase JavaScript SDK for web platform');
      } else {
        log('Native platform detected - Firebase plugins would be needed for full functionality');
      }

      // Initialize service locator
      await ServiceLocator.init();

      // Get logger instance
      final logger = LogService.instance;

      FlutterError.onError = (details) {
        logger.e(details.exceptionAsString(), details.exception, details.stack);
      };

      runApp(await builder());
    },
    (error, stackTrace) {
      LogService.instance.e('Async error caught in zone', error, stackTrace);
    },
  );
}
