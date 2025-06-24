import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:mockito/mockito.dart';
import 'package:my_portfolio_web/app/services/analytics_service.dart';

/// Mock implementation of AnalyticsService for testing
class MockAnalyticsService extends Mock implements AnalyticsService {
  final List<Map<String, dynamic>> _trackedEvents = [];
  bool _isInitialized = false;

  @override
  bool get isInitialized => _isInitialized;

  @override
  List<Map<String, dynamic>> get debugEvents => List.unmodifiable(_trackedEvents);

  @override
  Future<void> initialize() async {
    _isInitialized = true;
  }

  @override
  FirebaseAnalyticsObserver get observer => MockFirebaseAnalyticsObserver();

  @override
  Future<void> trackPageView({
    required String pageName,
    String? pageClass,
    Map<String, Object>? parameters,
  }) async {
    _trackedEvents.add({
      'event_type': 'page_view',
      'page_name': pageName,
      'page_class': pageClass,
      'parameters': parameters,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  @override
  Future<void> trackButtonClick({
    required String buttonName,
    String? section,
    Map<String, Object>? parameters,
  }) async {
    _trackedEvents.add({
      'event_type': 'button_click',
      'button_name': buttonName,
      'section': section,
      'parameters': parameters,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  @override
  Future<void> trackProjectInteraction({
    required String projectName,
    required String action,
    Map<String, dynamic>? parameters,
  }) async {
    _trackedEvents.add({
      'event_type': 'project_interaction',
      'project_name': projectName,
      'action': action,
      'parameters': parameters,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  @override
  Future<void> trackContactInteraction({
    required String action,
    String? method,
    Map<String, dynamic>? parameters,
  }) async {
    _trackedEvents.add({
      'event_type': 'contact_interaction',
      'action': action,
      'method': method,
      'parameters': parameters,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  @override
  Future<void> trackSkillInteraction({
    required String skillName,
    required String action,
    String? category,
    Map<String, dynamic>? parameters,
  }) async {
    _trackedEvents.add({
      'event_type': 'skill_interaction',
      'skill_name': skillName,
      'action': action,
      'category': category,
      'parameters': parameters,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  @override
  Future<void> trackCVDownload({
    String? source,
    Map<String, dynamic>? parameters,
  }) async {
    _trackedEvents.add({
      'event_type': 'cv_download',
      'source': source,
      'parameters': parameters,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  @override
  Future<void> trackSocialMediaClick({
    required String platform,
    String? source,
    Map<String, dynamic>? parameters,
  }) async {
    _trackedEvents.add({
      'event_type': 'social_media_click',
      'platform': platform,
      'source': source,
      'parameters': parameters,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  @override
  Future<void> trackCustomEvent({
    required String eventName,
    Map<String, dynamic>? parameters,
  }) async {
    _trackedEvents.add({
      'event_type': 'custom_event',
      'event_name': eventName,
      'parameters': parameters,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  @override
  Future<void> setUserId(String userId) async {
    _trackedEvents.add({
      'event_type': 'set_user_id',
      'user_id': userId,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  @override
  Future<void> resetAnalyticsData() async {
    _trackedEvents.clear();
  }

  @override
  void clearDebugEvents() {
    _trackedEvents.clear();
  }

  @override
  void printDebugEvents() {
    for (final event in _trackedEvents) {
      print('Mock Event: ${event['event_type']} - ${event['timestamp']}');
    }
  }

  @override
  Map<String, dynamic> getAnalyticsStatus() {
    return {
      'is_initialized': _isInitialized,
      'debug_mode': true,
      'debug_events_count': _trackedEvents.length,
      'firebase_app_id': '1:51439261225:web:bb97fff3613e72ef96ae38',
      'measurement_id': 'G-VVVFQJL1WD',
      'project_id': 'saksham-portfolio-ba828',
      'mock': true,
    };
  }

  /// Get tracked events for testing verification
  List<Map<String, dynamic>> getTrackedEvents() {
    return List.unmodifiable(_trackedEvents);
  }

  /// Get events of a specific type
  List<Map<String, dynamic>> getEventsByType(String eventType) {
    return _trackedEvents
        .where((event) => event['event_type'] == eventType)
        .toList();
  }

  /// Clear all tracked events
  void clearTrackedEvents() {
    _trackedEvents.clear();
  }

  /// Check if a specific event was tracked
  bool hasEvent(String eventType, {Map<String, dynamic>? withParameters}) {
    return _trackedEvents.any((event) {
      if (event['event_type'] != eventType) return false;
      
      if (withParameters != null) {
        for (final entry in withParameters.entries) {
          if (event[entry.key] != entry.value) return false;
        }
      }
      
      return true;
    });
  }
}

/// Mock implementation of FirebaseAnalyticsObserver
class MockFirebaseAnalyticsObserver extends Mock implements FirebaseAnalyticsObserver {
  @override
  FirebaseAnalytics get analytics => MockFirebaseAnalytics();
}

/// Mock implementation of FirebaseAnalytics
class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}
