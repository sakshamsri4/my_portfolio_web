import 'dart:developer';
import 'package:flutter/foundation.dart';

/// Debug mode flag for enhanced analytics logging
const bool _kAnalyticsDebugMode = kDebugMode;

/// Service for handling Firebase Analytics events and tracking
/// Stub implementation for non-web platforms
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

  /// Initialize Firebase Analytics
  Future<void> initialize() async {
    try {
      // For non-web platforms, just mark as initialized for testing
      _isInitialized = true;
      log('Analytics service initialized for non-web platform');

      // Set default user properties
      await _setDefaultUserProperties();

      log('Firebase Analytics service initialized successfully');
    } on Exception catch (e) {
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
    } on Exception catch (e) {
      log('Error setting default user properties: $e');
    }
  }

  /// Track a custom event with parameters
  Future<void> trackEvent(String eventName,
      [Map<String, dynamic>? parameters]) async {
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

      // For non-web platforms, just log the event
      log('Non-web analytics tracking: $eventName');
    } on Exception catch (e) {
      log('Error tracking event $eventName: $e');
    }
  }

  /// Set user property
  Future<void> setUserProperty(String name, String value) async {
    try {
      if (_kAnalyticsDebugMode) {
        log('Setting user property: $name = $value');
      }

      // For non-web platforms, just log the property
      log('Non-web user property setting: $name = $value');
    } on Exception catch (e) {
      log('Error setting user property $name: $e');
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

  /// Get analytics status for debugging
  Map<String, dynamic> getAnalyticsStatus() {
    return {
      'is_initialized': _isInitialized,
      'debug_mode': _kAnalyticsDebugMode,
      'debug_events_count': _debugEvents.length,
      'project_id': 'saksham-portfolio-ba828',
      'measurement_id': 'G-VVVFQJL1WD',
      'firebase_app_id': '1:51439261225:web:bb97fff3613e72ef96ae38',
    };
  }

  /// Print debug events for debugging
  void printDebugEvents() {
    if (_kAnalyticsDebugMode) {
      log('Analytics Debug Events (${_debugEvents.length} total):');
      for (var i = 0; i < _debugEvents.length; i++) {
        final event = _debugEvents[i];
        log('Event ${i + 1}: ${event['event_name']} - ${event['parameters']}');
      }
    }
  }

  /// Track custom event (alias for trackEvent for backward compatibility)
  Future<void> trackCustomEvent({
    required String eventName,
    Map<String, dynamic>? parameters,
  }) async {
    await trackEvent(eventName, parameters);
  }
}
