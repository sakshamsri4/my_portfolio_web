import 'dart:developer';
// Import dart:js conditionally only for web
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js
    if (dart.library.io) 'package:my_portfolio_web/app/utils/js_stub.dart';

import 'package:flutter/foundation.dart';

/// Debug mode flag for enhanced analytics logging
const bool _kAnalyticsDebugMode = kDebugMode;

/// Service for handling Firebase Analytics events and tracking
/// Uses JavaScript SDK for web platform to avoid platform channel conflicts
class AnalyticsService {
  factory AnalyticsService() => _instance;
  AnalyticsService._internal();

  static final AnalyticsService _instance = AnalyticsService._internal();

  /// Debug event tracking for verification
  final List<Map<String, dynamic>> _debugEvents = [];

  /// Flag to track if analytics is properly initialized
  bool _isInitialized = false;

  /// Get the singleton instance
  static AnalyticsService get instance => _instance;

  /// Initialize Firebase Analytics via JavaScript SDK
  Future<void> initialize() async {
    try {
      if (kIsWeb) {
        // On web, check if JavaScript SDK is available
        if (js.context.hasProperty('firebaseAnalytics')) {
          log('Firebase Analytics JavaScript SDK detected');
          _isInitialized = true;
        } else {
          log('Firebase Analytics JavaScript SDK not available yet - will retry on events');
          // Set a flag to retry later
          _isInitialized = false;
        }
      } else {
        // On native platforms, we would use Flutter plugins
        // For now, just mark as initialized for development
        _isInitialized = true;
        log('Analytics service initialized for native platform');
      }

      // Set default user properties
      await _setDefaultUserProperties();

      log('Firebase Analytics service initialized successfully');
    } catch (e) {
      _isInitialized = false;
      log('Firebase Analytics initialization error: $e');
    }
  }

  /// Check if analytics is properly initialized
  bool get isInitialized => _isInitialized;

  /// Get debug events for testing
  List<Map<String, dynamic>> get debugEvents => List.unmodifiable(_debugEvents);

  /// Set default user properties
  Future<void> _setDefaultUserProperties() async {
    try {
      await setUserProperty('app_type', 'portfolio_web');
      await setUserProperty('platform', kIsWeb ? 'web' : 'mobile');
      await setUserProperty('user_type', 'visitor');
    } catch (e) {
      log('Error setting default user properties: $e');
    }
  }

  /// Track a custom event with parameters
  Future<void> trackEvent(String eventName, [Map<String, dynamic>? parameters]) async {
    try {
      final eventData = {
        'event_name': eventName,
        'parameters': parameters ?? {},
        'timestamp': DateTime.now().toIso8601String(),
      };

      // Add to debug events
      if (_kAnalyticsDebugMode) {
        _debugEvents.add(eventData);
        log('Analytics event tracked: $eventName with parameters: $parameters');
      }

      if (kIsWeb) {
        // Use JavaScript SDK for web
        await _trackEventWeb(eventName, parameters);
      } else {
        // For native platforms, we would use Flutter plugins
        log('Native analytics tracking not implemented yet');
      }
    } catch (e) {
      log('Error tracking event $eventName: $e');
    }
  }

  /// Track event using JavaScript SDK
  Future<void> _trackEventWeb(String eventName, Map<String, dynamic>? parameters) async {
    try {
      if (js.context.hasProperty('firebaseAnalytics')) {
        // Call JavaScript function to track event
        js.context.callMethod('eval', ['''
          if (window.firebaseAnalytics && typeof gtag !== 'undefined') {
            gtag('event', '$eventName', ${_mapToJsObject(parameters ?? {})});
          }
        ''']);
        log('Web analytics event sent: $eventName');
      } else {
        log('Firebase Analytics JavaScript SDK not available');
      }
    } catch (e) {
      log('Error tracking web event: $e');
    }
  }

  /// Convert Dart map to JavaScript object string
  String _mapToJsObject(Map<String, dynamic> map) {
    if (map.isEmpty) return '{}';
    
    final entries = map.entries.map((entry) {
      final key = entry.key;
      final value = entry.value;
      
      if (value is String) {
        return '"$key": "${value.replaceAll('"', '\\"')}"';
      } else if (value is num) {
        return '"$key": $value';
      } else if (value is bool) {
        return '"$key": $value';
      } else {
        return '"$key": "${value.toString().replaceAll('"', '\\"')}"';
      }
    }).join(', ');
    
    return '{$entries}';
  }

  /// Set user property
  Future<void> setUserProperty(String name, String value) async {
    try {
      if (_kAnalyticsDebugMode) {
        log('Setting user property: $name = $value');
      }

      if (kIsWeb) {
        await _setUserPropertyWeb(name, value);
      } else {
        // For native platforms, we would use Flutter plugins
        log('Native user property setting not implemented yet');
      }
    } catch (e) {
      log('Error setting user property $name: $e');
    }
  }

  /// Set user property using JavaScript SDK
  Future<void> _setUserPropertyWeb(String name, String value) async {
    try {
      if (js.context.hasProperty('firebaseAnalytics')) {
        js.context.callMethod('eval', ['''
          if (window.firebaseAnalytics && typeof gtag !== 'undefined') {
            gtag('config', 'G-VVVFQJL1WD', {
              'custom_map': {'$name': '$value'}
            });
          }
        ''']);
        log('Web user property set: $name = $value');
      }
    } catch (e) {
      log('Error setting web user property: $e');
    }
  }

  /// Track page view
  Future<void> trackPageView(String pageName, [String? pageClass]) async {
    await trackEvent('page_view', {
      'page_name': pageName,
      'page_class': pageClass ?? 'unknown',
    });
  }

  /// Track button click
  Future<void> trackButtonClick(String buttonName, [String? location]) async {
    await trackEvent('button_click', {
      'button_name': buttonName,
      'location': location ?? 'unknown',
    });
  }

  /// Track section view
  Future<void> trackSectionView(String sectionName) async {
    await trackEvent('section_view', {
      'section_name': sectionName,
    });
  }

  /// Track download event
  Future<void> trackDownload(String fileName, String fileType) async {
    await trackEvent('file_download', {
      'file_name': fileName,
      'file_type': fileType,
    });
  }

  /// Track contact form submission
  Future<void> trackContactSubmission(String method) async {
    await trackEvent('contact_submission', {
      'contact_method': method,
    });
  }

  /// Track project view
  Future<void> trackProjectView(String projectName) async {
    await trackEvent('project_view', {
      'project_name': projectName,
    });
  }

  /// Track error event
  Future<void> trackError(String errorType, String errorMessage) async {
    await trackEvent('error_occurred', {
      'error_type': errorType,
      'error_message': errorMessage,
    });
  }

  /// Clear debug events (for testing)
  void clearDebugEvents() {
    _debugEvents.clear();
  }
}
