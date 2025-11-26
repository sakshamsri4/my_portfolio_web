import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:my_portfolio_web/app/services/service_locator.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase initialization is handled by JavaScript SDK for web
  // No Flutter Firebase initialization needed to avoid platform channel conflicts
  if (kIsWeb) {
    log('Using Firebase JavaScript SDK for web platform');
  } else {
    log('Native platform detected - Firebase plugins would be needed for full functionality');
  }

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  // Add cross-flavor configuration here

  // Initialize service locator
  await ServiceLocator.init();

  runApp(await builder());
}
