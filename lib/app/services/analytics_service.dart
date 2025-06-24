import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

/// Debug mode flag for enhanced analytics logging
const bool _kAnalyticsDebugMode = kDebugMode;

/// Service for handling Firebase Analytics events and tracking
class AnalyticsService {
  factory AnalyticsService() => _instance;
  AnalyticsService._internal();

  static final AnalyticsService _instance = AnalyticsService._internal();

  late FirebaseAnalytics _analytics;
  late FirebaseAnalyticsObserver _observer;

  /// Debug event tracking for verification
  final List<Map<String, dynamic>> _debugEvents = [];

  /// Flag to track if analytics is properly initialized
  bool _isInitialized = false;

  /// Initialize Firebase Analytics
  Future<void> initialize() async {
    try {
      // For web platforms, Firebase is initialized via JavaScript SDK
      // We need to handle this gracefully to avoid platform channel conflicts
      if (kIsWeb) {
        // On web, try to get analytics instance but handle failures gracefully
        try {
          _analytics = FirebaseAnalytics.instance;
          _observer = FirebaseAnalyticsObserver(analytics: _analytics);
          log('Firebase Analytics instance obtained for web');
        } catch (e) {
          log('Firebase Analytics instance creation failed on web (expected): $e');
          // Create a dummy observer to prevent null errors
          _observer = FirebaseAnalyticsObserver(analytics: _analytics);
        }
      } else {
        // On native platforms, standard initialization
        _analytics = FirebaseAnalytics.instance;
        _observer = FirebaseAnalyticsObserver(analytics: _analytics);
      }

      // Set default user properties (with error handling for web)
      await _setDefaultUserProperties();

      _isInitialized = true;
      log('Firebase Analytics initialized successfully');
    } on Exception catch (e) {
      _isInitialized = false;
      log('Firebase Analytics initialization handled: $e');
      // On web, this is expected when using JavaScript SDK
      if (kIsWeb) {
        log('Using JavaScript SDK analytics - Flutter analytics disabled');
        // Still create observer to prevent null errors
        try {
          _analytics = FirebaseAnalytics.instance;
          _observer = FirebaseAnalyticsObserver(analytics: _analytics);
        } catch (_) {
          // If this fails too, we'll handle it in the analytics calls
        }
      }
    }
  }

  /// Helper method to convert `Map<String, dynamic>` to `Map<String, Object>`
  Map<String, Object>? _convertParameters(Map<String, dynamic>? parameters) {
    if (parameters == null) return null;
    return parameters.map((key, value) => MapEntry(key, value as Object));
  }

  /// Get the analytics observer for navigation tracking
  FirebaseAnalyticsObserver get observer => _observer;

  /// Set default user properties
  Future<void> _setDefaultUserProperties() async {
    try {
      if (_isInitialized) {
        await _analytics.setUserProperty(
          name: 'app_type',
          value: 'portfolio_web',
        );

        await _analytics.setUserProperty(
          name: 'platform',
          value: kIsWeb ? 'web' : 'mobile',
        );

        await _analytics.setUserProperty(
          name: 'user_type',
          value: 'visitor',
        );
      }
    } on Exception catch (e) {
      // On web, platform channel errors are expected - handle gracefully
      if (kIsWeb) {
        if (_kAnalyticsDebugMode) {
          log('User properties not set on web (expected with JavaScript SDK)');
        }
      } else {
        log('Failed to set user properties: $e');
      }
    }
  }

  /// Track page views
  Future<void> trackPageView({
    required String pageName,
    String? pageClass,
    Map<String, Object>? parameters,
  }) async {
    try {
      if (_isInitialized) {
        await _analytics.logScreenView(
          screenName: pageName,
          screenClass: pageClass ?? pageName,
          parameters: parameters,
        );
      }

      // Add to debug tracking
      _addDebugEvent('screen_view', {
        'screen_name': pageName,
        'screen_class': pageClass ?? pageName,
        ...?parameters?.map((k, v) => MapEntry(k, v.toString())),
      });

      if (_kAnalyticsDebugMode) {
        log('Page view tracked: $pageName (initialized: $_isInitialized)');
      }
    } on Exception catch (e) {
      // On web, platform channel errors are expected - handle gracefully
      if (kIsWeb) {
        if (_kAnalyticsDebugMode) {
          log('Page view tracking handled gracefully on web: $pageName');
        }
      } else {
        log('Failed to track page view: $e');
      }
    }
  }

  /// Track button clicks and interactions
  Future<void> trackButtonClick({
    required String buttonName,
    String? section,
    Map<String, Object>? parameters,
  }) async {
    try {
      final eventParameters = <String, Object>{
        'button_name': buttonName,
        if (section != null) 'section': section,
        ...?parameters,
      };

      if (_isInitialized) {
        await _analytics.logEvent(
          name: 'button_click',
          parameters: eventParameters,
        );
      }

      // Add to debug tracking
      _addDebugEvent('button_click', {
        'button_name': buttonName,
        if (section != null) 'section': section,
        ...?parameters?.map((k, v) => MapEntry(k, v.toString())),
      });

      if (_kAnalyticsDebugMode) {
        log('Button click tracked: $buttonName (initialized: $_isInitialized)');
      }
    } on Exception catch (e) {
      // On web, platform channel errors are expected - handle gracefully
      if (kIsWeb) {
        if (_kAnalyticsDebugMode) {
          log('Button click tracking handled gracefully on web: $buttonName');
        }
      } else {
        log('Failed to track button click: $e');
      }
    }
  }

  /// Track project interactions
  Future<void> trackProjectInteraction({
    required String projectName,
    required String action, // 'view', 'click_demo', 'click_github', etc.
    Map<String, dynamic>? parameters,
  }) async {
    try {
      final eventParameters = <String, Object>{
        'project_name': projectName,
        'action': action,
        ...?_convertParameters(parameters),
      };

      if (_isInitialized) {
        await _analytics.logEvent(
          name: 'project_interaction',
          parameters: eventParameters,
        );
      }

      // Add to debug tracking
      _addDebugEvent('project_interaction', {
        'project_name': projectName,
        'action': action,
        ...?parameters,
      });

      if (_kAnalyticsDebugMode) {
        log('Project interaction tracked: $projectName - $action (initialized: $_isInitialized)');
      }
    } on Exception catch (e) {
      // On web, platform channel errors are expected - handle gracefully
      if (kIsWeb) {
        if (_kAnalyticsDebugMode) {
          log('Project interaction tracking handled gracefully on web: $projectName - $action');
        }
      } else {
        log('Failed to track project interaction: $e');
      }
    }
  }

  /// Track contact form interactions
  Future<void> trackContactInteraction({
    required String action, // 'form_view', 'form_submit', 'email_click', etc.
    String? method, // 'email', 'linkedin', 'github', etc.
    Map<String, dynamic>? parameters,
  }) async {
    try {
      final eventParameters = <String, Object>{
        'action': action,
        if (method != null) 'contact_method': method,
        ...?_convertParameters(parameters),
      };

      if (_isInitialized) {
        await _analytics.logEvent(
          name: 'contact_interaction',
          parameters: eventParameters,
        );
      }

      // Add to debug tracking
      _addDebugEvent('contact_interaction', {
        'action': action,
        if (method != null) 'contact_method': method,
        ...?parameters,
      });

      if (_kAnalyticsDebugMode) {
        log('Contact interaction tracked: $action (initialized: $_isInitialized)');
      }
    } on Exception catch (e) {
      log('Failed to track contact interaction: $e');
    }
  }

  /// Track skill/technology interactions
  Future<void> trackSkillInteraction({
    required String skillName,
    required String action, // 'view', 'click', 'hover', etc.
    String? category, // 'frontend', 'backend', 'mobile', etc.
    Map<String, dynamic>? parameters,
  }) async {
    try {
      final eventParameters = <String, Object>{
        'skill_name': skillName,
        'action': action,
        if (category != null) 'skill_category': category,
        ...?_convertParameters(parameters),
      };

      if (_isInitialized) {
        await _analytics.logEvent(
          name: 'skill_interaction',
          parameters: eventParameters,
        );
      }

      // Add to debug tracking
      _addDebugEvent('skill_interaction', {
        'skill_name': skillName,
        'action': action,
        if (category != null) 'skill_category': category,
        ...?parameters,
      });

      if (_kAnalyticsDebugMode) {
        log('Skill interaction tracked: $skillName - $action (initialized: $_isInitialized)');
      }
    } on Exception catch (e) {
      log('Failed to track skill interaction: $e');
    }
  }

  /// Track CV/Resume downloads
  Future<void> trackCVDownload({
    String? source, // 'header_button', 'contact_section', etc.
    Map<String, dynamic>? parameters,
  }) async {
    try {
      final eventParameters = <String, Object>{
        'download_type': 'cv',
        if (source != null) 'source': source,
        ...?_convertParameters(parameters),
      };

      if (_isInitialized) {
        await _analytics.logEvent(
          name: 'file_download',
          parameters: eventParameters,
        );
      }

      // Add to debug tracking
      _addDebugEvent('file_download', {
        'download_type': 'cv',
        if (source != null) 'source': source,
        ...?parameters,
      });

      if (_kAnalyticsDebugMode) {
        log('CV download tracked from: ${source ?? 'unknown'} (initialized: $_isInitialized)');
      }
    } on Exception catch (e) {
      log('Failed to track CV download: $e');
    }
  }

  /// Track social media link clicks
  Future<void> trackSocialMediaClick({
    required String platform, // 'linkedin', 'github', 'twitter', etc.
    String? source, // 'header', 'footer', 'contact_section', etc.
    Map<String, dynamic>? parameters,
  }) async {
    try {
      final eventParameters = <String, Object>{
        'platform': platform,
        if (source != null) 'source': source,
        ...?_convertParameters(parameters),
      };

      if (_isInitialized) {
        await _analytics.logEvent(
          name: 'social_media_click',
          parameters: eventParameters,
        );
      }

      // Add to debug tracking
      _addDebugEvent('social_media_click', {
        'platform': platform,
        if (source != null) 'source': source,
        ...?parameters,
      });

      if (_kAnalyticsDebugMode) {
        log('Social media click tracked: $platform (initialized: $_isInitialized)');
      }
    } on Exception catch (e) {
      log('Failed to track social media click: $e');
    }
  }

  /// Track custom events
  Future<void> trackCustomEvent({
    required String eventName,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      if (_isInitialized) {
        await _analytics.logEvent(
          name: eventName,
          parameters: _convertParameters(parameters),
        );
      }

      // Add to debug tracking
      _addDebugEvent(eventName, parameters);

      if (_kAnalyticsDebugMode) {
        log('Custom event tracked: $eventName (initialized: $_isInitialized)');
      }
    } on Exception catch (e) {
      log('Failed to track custom event: $e');
    }
  }

  /// Set user ID for tracking
  Future<void> setUserId(String userId) async {
    try {
      if (_isInitialized) {
        await _analytics.setUserId(id: userId);
      }

      if (_kAnalyticsDebugMode) {
        log('User ID set: $userId (initialized: $_isInitialized)');
      }
    } on Exception catch (e) {
      log('Failed to set user ID: $e');
    }
  }

  /// Reset analytics data (useful for testing)
  Future<void> resetAnalyticsData() async {
    try {
      if (_isInitialized) {
        await _analytics.resetAnalyticsData();
      }

      if (_kAnalyticsDebugMode) {
        log('Analytics data reset (initialized: $_isInitialized)');
      }
    } on Exception catch (e) {
      log('Failed to reset analytics data: $e');
    }
  }

  // ========== DEBUG & VERIFICATION METHODS ==========

  /// Check if analytics is properly initialized
  bool get isInitialized => _isInitialized;

  /// Get debug events for testing (only in debug mode)
  List<Map<String, dynamic>> get debugEvents =>
      _kAnalyticsDebugMode ? List.unmodifiable(_debugEvents) : [];

  /// Add event to debug tracking
  void _addDebugEvent(String eventName, Map<String, dynamic>? parameters) {
    if (_kAnalyticsDebugMode) {
      _debugEvents.add({
        'event_name': eventName,
        'parameters': parameters ?? {},
        'timestamp': DateTime.now().toIso8601String(),
      });

      // Keep only last 50 events to prevent memory issues
      if (_debugEvents.length > 50) {
        _debugEvents.removeAt(0);
      }
    }
  }

  /// Clear debug events
  void clearDebugEvents() {
    if (_kAnalyticsDebugMode) {
      _debugEvents.clear();
      log('Debug events cleared');
    }
  }

  /// Print all debug events to console
  void printDebugEvents() {
    if (_kAnalyticsDebugMode) {
      log('=== Firebase Analytics Debug Events ===');
      for (final event in _debugEvents) {
        log('Event: ${event['event_name']} | '
            'Time: ${event['timestamp']} | '
            'Params: ${event['parameters']}');
      }
      log('=== End Debug Events (${_debugEvents.length} total) ===');
    }
  }

  /// Verify analytics configuration
  Map<String, dynamic> getAnalyticsStatus() {
    return {
      'is_initialized': _isInitialized,
      'debug_mode': _kAnalyticsDebugMode,
      'debug_events_count': _debugEvents.length,
      'firebase_app_id': '1:51439261225:web:bb97fff3613e72ef96ae38',
      'measurement_id': 'G-VVVFQJL1WD',
      'project_id': 'saksham-portfolio-ba828',
    };
  }
}
