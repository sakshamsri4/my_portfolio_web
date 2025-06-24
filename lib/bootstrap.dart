import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:my_portfolio_web/app/services/service_locator.dart';
import 'package:my_portfolio_web/firebase_options.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase - handle web platform carefully to avoid dual initialization
  if (kIsWeb) {
    // On web, skip Firebase initialization since JavaScript SDK handles it
    // This prevents platform channel conflicts
    try {
      // Check if Firebase is already initialized by JavaScript SDK
      final existingApps = Firebase.apps;
      if (existingApps.isNotEmpty) {
        log('Firebase already initialized via JavaScript SDK: ${existingApps.length} apps found');
      } else {
        // If no apps exist, JavaScript SDK might not be ready yet
        // Skip initialization to prevent platform channel conflicts
        log('No Firebase apps found - relying on JavaScript SDK initialization');
      }
    } catch (e) {
      // On web, Firebase errors are expected when using JavaScript SDK
      log('Firebase platform check completed (expected on web): $e');
    }
  } else {
    // On native platforms, initialize normally
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    log('Firebase initialized via Flutter SDK for native platform');
  }

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  // Add cross-flavor configuration here

  // Initialize service locator
  await ServiceLocator.init();

  runApp(await builder());
}
