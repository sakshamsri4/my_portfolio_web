import 'dart:developer';
// Import dart:html conditionally only for web
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html
    if (dart.library.io) 'package:my_portfolio_web/app/utils/html_stub.dart';
// Import dart:js conditionally only for web
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js
    if (dart.library.io) 'package:my_portfolio_web/app/utils/js_stub.dart';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/services/analytics_service.dart';

/// Debug helper for Firebase Analytics verification and testing
class AnalyticsDebugHelper {
  static const String _debugPrefix = '[ANALYTICS_DEBUG]';

  /// Check if we're running in debug mode
  static bool get isDebugMode => kDebugMode;

  /// Check if we're running on web platform
  static bool get isWeb => kIsWeb;

  /// Print analytics configuration status
  static void printAnalyticsStatus() {
    if (!isDebugMode) return;

    try {
      final analyticsService = Get.find<AnalyticsService>();
      final status = analyticsService.getAnalyticsStatus();

      log('$_debugPrefix Analytics Configuration Status:');
      log('$_debugPrefix =====================================');
      log('$_debugPrefix Initialized: ${status['is_initialized']}');
      log('$_debugPrefix Debug Mode: ${status['debug_mode']}');
      log('$_debugPrefix Events Count: ${status['debug_events_count']}');
      log('$_debugPrefix Project ID: ${status['project_id']}');
      log('$_debugPrefix Measurement ID: ${status['measurement_id']}');
      log('$_debugPrefix App ID: ${status['firebase_app_id']}');
      log('$_debugPrefix =====================================');
    } on Exception catch (e) {
      log('$_debugPrefix Error getting analytics status: $e');
    }
  }

  /// Print all debug events
  static void printDebugEvents() {
    if (!isDebugMode) return;

    try {
      final analyticsService = Get.find<AnalyticsService>();
      analyticsService.printDebugEvents();
    } on Exception catch (e) {
      log('$_debugPrefix Error printing debug events: $e');
    }
  }

  /// Clear debug events
  static void clearDebugEvents() {
    if (!isDebugMode) return;

    try {
      final analyticsService = Get.find<AnalyticsService>();
      analyticsService.clearDebugEvents();
      log('$_debugPrefix Debug events cleared');
    } on Exception catch (e) {
      log('$_debugPrefix Error clearing debug events: $e');
    }
  }

  /// Test analytics by sending a test event
  static Future<void> sendTestEvent() async {
    if (!isDebugMode) return;

    try {
      final analyticsService = Get.find<AnalyticsService>();
      await analyticsService.trackCustomEvent(
        eventName: 'debug_test_event',
        parameters: {
          'test_timestamp': DateTime.now().millisecondsSinceEpoch,
          'test_source': 'analytics_debug_helper',
          'user_agent': isWeb ? html.window.navigator.userAgent : 'mobile',
        },
      );
      log('$_debugPrefix Test event sent successfully');
    } on Exception catch (e) {
      log('$_debugPrefix Error sending test event: $e');
    }
  }

  /// Check browser developer tools for Firebase Analytics
  static void checkBrowserDevTools() {
    if (!isDebugMode || !isWeb) return;

    log('$_debugPrefix Browser Developer Tools Check:');
    log('$_debugPrefix =====================================');
    log('$_debugPrefix 1. Open Browser Developer Tools (F12)');
    log('$_debugPrefix 2. Go to Network tab');
    log('$_debugPrefix 3. Filter by "google-analytics" or "analytics"');
    log('$_debugPrefix 4. Look for requests to:');
    log('$_debugPrefix    - https://www.google-analytics.com/g/collect');
    log('$_debugPrefix    - https://analytics.google.com/analytics/web/');
    log('$_debugPrefix 5. Check Console for Firebase Analytics logs');
    log('$_debugPrefix =====================================');
  }

  /// Generate Firebase DebugView instructions
  static void printDebugViewInstructions() {
    if (!isDebugMode) return;

    log('$_debugPrefix Firebase DebugView Setup:');
    log('$_debugPrefix =====================================');
    log('$_debugPrefix 1. Go to Firebase Console: https://console.firebase.google.com/');
    log('$_debugPrefix 2. Select project: saksham-portfolio-ba828');
    log('$_debugPrefix 3. Navigate to Analytics > DebugView');
    log('$_debugPrefix 4. Enable debug mode by adding ?debug=1 to URL:');
    log('$_debugPrefix    https://saksham-portfolio-ba828.web.app/#/home?debug=1');
    log('$_debugPrefix 5. Or run: flutter run -d chrome --dart-define=FIREBASE_DEBUG=true');
    log('$_debugPrefix 6. Events should appear in real-time in DebugView');
    log('$_debugPrefix =====================================');
  }

  /// Check if Firebase Analytics is loaded in browser
  static void checkFirebaseLoaded() {
    if (!isWeb) return;

    try {
      // Check if gtag is available using js.context
      final hasGtag = kIsWeb && js.context.hasProperty('gtag');
      final hasGa = kIsWeb && js.context.hasProperty('ga');
      final hasDataLayer = kIsWeb && js.context.hasProperty('dataLayer');

      log('$_debugPrefix Firebase Analytics Browser Check:');
      log('$_debugPrefix =====================================');
      log('$_debugPrefix gtag available: $hasGtag');
      log('$_debugPrefix ga available: $hasGa');
      log('$_debugPrefix dataLayer available: $hasDataLayer');

      if (hasDataLayer && kIsWeb) {
        // Check dataLayer contents
        final dataLayer = js.context['dataLayer'];
        if (dataLayer != null) {
          log('$_debugPrefix dataLayer available: true');
        }
      }

      log('$_debugPrefix =====================================');
    } on Exception catch (e) {
      log('$_debugPrefix Error checking Firebase in browser: $e');
    }
  }

  /// Comprehensive analytics verification
  static Future<void> runFullDiagnostics() async {
    if (!isDebugMode) return;

    log('$_debugPrefix Running Full Analytics Diagnostics...');
    log('$_debugPrefix =====================================');

    // 1. Check analytics status
    printAnalyticsStatus();

    // 2. Check browser environment (web only)
    if (isWeb) {
      checkFirebaseLoaded();
    }

    // 3. Send test event
    await sendTestEvent();

    // 4. Print debug events
    printDebugEvents();

    // 5. Provide instructions
    checkBrowserDevTools();
    printDebugViewInstructions();

    log('$_debugPrefix Diagnostics Complete');
    log('$_debugPrefix =====================================');
  }

  /// Monitor analytics events in real-time
  static void startEventMonitoring() {
    if (!isDebugMode) return;

    log('$_debugPrefix Starting real-time event monitoring...');

    // This would be enhanced with actual event listening
    // For now, we provide instructions for manual monitoring
    log('$_debugPrefix To monitor events in real-time:');
    log('$_debugPrefix 1. Call AnalyticsDebugHelper.printDebugEvents() periodically');
    log('$_debugPrefix 2. Use Firebase DebugView for live monitoring');
    log('$_debugPrefix 3. Check browser Network tab for analytics requests');
  }

  /// Generate analytics test scenarios
  static Future<void> runTestScenarios() async {
    if (!isDebugMode) return;

    log('$_debugPrefix Running Analytics Test Scenarios...');

    try {
      final analyticsService = Get.find<AnalyticsService>();

      // Clear existing events
      analyticsService.clearDebugEvents();

      // Test scenario 1: Page navigation
      await analyticsService.trackPageView(
        pageName: 'test_page',
        pageClass: 'test_class',
        parameters: {'test': 'page_view'},
      );

      // Test scenario 2: Button interaction
      await analyticsService.trackButtonClick(
        buttonName: 'test_button',
        section: 'test_section',
        parameters: {'test': 'button_click'},
      );

      // Test scenario 3: Custom event
      await analyticsService.trackCustomEvent(
        eventName: 'test_custom_event',
        parameters: {
          'test_param': 'test_value',
          'timestamp': DateTime.now().millisecondsSinceEpoch,
        },
      );

      log('$_debugPrefix Test scenarios completed');

      // Print results
      printDebugEvents();
    } on Exception catch (e) {
      log('$_debugPrefix Error running test scenarios: $e');
    }
  }

  /// Export debug data for analysis
  static Map<String, dynamic> exportDebugData() {
    if (!isDebugMode) return {};

    try {
      final analyticsService = Get.find<AnalyticsService>();

      return {
        'analytics_status': analyticsService.getAnalyticsStatus(),
        'debug_events': analyticsService.debugEvents,
        'export_timestamp': DateTime.now().toIso8601String(),
        'platform': isWeb ? 'web' : 'mobile',
        'debug_mode': isDebugMode,
      };
    } on Exception catch (e) {
      log('$_debugPrefix Error exporting debug data: $e');
      return {'error': e.toString()};
    }
  }

  /// Print troubleshooting guide
  static void printTroubleshootingGuide() {
    log('$_debugPrefix Analytics Troubleshooting Guide:');
    log('$_debugPrefix =====================================');
    log('$_debugPrefix Common Issues & Solutions:');
    log(_debugPrefix);
    log('$_debugPrefix 1. No data in Firebase Console:');
    log('$_debugPrefix    - Data processing takes 24-48 hours');
    log('$_debugPrefix    - Use DebugView for real-time data');
    log('$_debugPrefix    - Check measurement ID: G-VVVFQJL1WD');
    log(_debugPrefix);
    log('$_debugPrefix 2. Events not appearing in DebugView:');
    log('$_debugPrefix    - Enable debug mode: ?debug=1 in URL');
    log('$_debugPrefix    - Check browser console for errors');
    log('$_debugPrefix    - Verify Firebase initialization');
    log(_debugPrefix);
    log('$_debugPrefix 3. Low traffic threshold:');
    log('$_debugPrefix    - Firebase may not show data for low traffic');
    log('$_debugPrefix    - Generate more test events');
    log('$_debugPrefix    - Wait for data aggregation');
    log(_debugPrefix);
    log('$_debugPrefix 4. Browser blocking:');
    log('$_debugPrefix    - Check ad blockers');
    log('$_debugPrefix    - Verify CORS settings');
    log('$_debugPrefix    - Test in incognito mode');
    log('$_debugPrefix =====================================');
  }
}
