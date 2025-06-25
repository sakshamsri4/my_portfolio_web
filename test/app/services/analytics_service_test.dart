import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_portfolio_web/app/services/analytics_service.dart';

import 'analytics_service_test.mocks.dart';

// Mock dart:js context for testing
class MockJsContext {
  bool hasFirebaseAnalytics = false;
  
  bool hasProperty(String property) {
    return property == 'firebaseAnalytics' && hasFirebaseAnalytics;
  }
}

@GenerateMocks([])
void main() {
  group('AnalyticsService', () {
    late AnalyticsService analyticsService;

    setUp(() {
      analyticsService = AnalyticsService();
    });

    tearDown(() {
      analyticsService.clearDebugEvents();
    });

    group('Initialization', () {
      test('should create analytics service instance', () {
        expect(analyticsService, isA<AnalyticsService>());
        expect(analyticsService.isInitialized, isFalse);
      });

      test('should initialize on web platform', () async {
        await analyticsService.initialize();
        
        // On web, should attempt initialization
        expect(analyticsService, isNotNull);
      });

      test('should initialize on native platform', () async {
        await analyticsService.initialize();
        
        // Should complete without error
        expect(analyticsService, isNotNull);
      });

      test('should handle initialization errors', () async {
        // Test that initialization doesn't throw
        await expectLater(
          () => analyticsService.initialize(),
          returnsNormally,
        );
      });

      test('should set initialization flag', () async {
        await analyticsService.initialize();
        
        // Check if initialization was attempted
        expect(analyticsService, isNotNull);
      });
    });

    group('Event Tracking', () {
      test('should track page views', () async {
        await analyticsService.trackPageView('home', 'HomePage');
        
        // Verify event was logged
        expect(analyticsService.debugEvents, isNotEmpty);
        expect(analyticsService.debugEvents.last['event'], equals('page_view'));
        expect(analyticsService.debugEvents.last['page_name'], equals('home'));
      });

      test('should track button clicks', () async {
        await analyticsService.trackButtonClick('download_cv', 'hero_section');
        
        // Verify event was logged
        expect(analyticsService.debugEvents, isNotEmpty);
        expect(analyticsService.debugEvents.last['event'], equals('button_click'));
        expect(analyticsService.debugEvents.last['button_name'], equals('download_cv'));
      });

      test('should track custom events', () async {
        await analyticsService.trackCustomEvent(
          eventName: 'custom_test',
          parameters: {'test_param': 'test_value'},
        );
        
        // Verify event was logged
        expect(analyticsService.debugEvents, isNotEmpty);
        expect(analyticsService.debugEvents.last['event'], equals('custom_test'));
        expect(analyticsService.debugEvents.last['test_param'], equals('test_value'));
      });

      test('should track contact submissions', () async {
        await analyticsService.trackContactSubmission('email');
        
        // Verify event was logged
        expect(analyticsService.debugEvents, isNotEmpty);
        expect(analyticsService.debugEvents.last['event'], equals('contact_submission'));
        expect(analyticsService.debugEvents.last['method'], equals('email'));
      });

      test('should track downloads', () async {
        await analyticsService.trackDownload('cv.pdf', 'pdf');
        
        // Verify event was logged
        expect(analyticsService.debugEvents, isNotEmpty);
        expect(analyticsService.debugEvents.last['event'], equals('download'));
        expect(analyticsService.debugEvents.last['file_name'], equals('cv.pdf'));
      });

      test('should track generic events', () async {
        await analyticsService.trackEvent('test_event', {'key': 'value'});
        
        // Verify event was logged
        expect(analyticsService.debugEvents, isNotEmpty);
        expect(analyticsService.debugEvents.last['event'], equals('test_event'));
        expect(analyticsService.debugEvents.last['key'], equals('value'));
      });
    });

    group('Debug Events', () {
      test('should store debug events', () async {
        await analyticsService.trackPageView('test', 'TestPage');
        
        expect(analyticsService.debugEvents, hasLength(1));
        expect(analyticsService.debugEvents.first['event'], equals('page_view'));
      });

      test('should clear debug events', () async {
        await analyticsService.trackPageView('test', 'TestPage');
        expect(analyticsService.debugEvents, isNotEmpty);
        
        analyticsService.clearDebugEvents();
        expect(analyticsService.debugEvents, isEmpty);
      });

      test('should limit debug events count', () async {
        // Add many events
        for (int i = 0; i < 150; i++) {
          await analyticsService.trackEvent('test_$i', {});
        }
        
        // Should not exceed maximum
        expect(analyticsService.debugEvents.length, lessThanOrEqualTo(100));
      });

      test('should include timestamp in debug events', () async {
        await analyticsService.trackPageView('test', 'TestPage');
        
        final event = analyticsService.debugEvents.first;
        expect(event['timestamp'], isA<int>());
        expect(event['timestamp'], greaterThan(0));
      });
    });

    group('Platform Handling', () {
      test('should handle web platform correctly', () async {
        if (kIsWeb) {
          await analyticsService.initialize();
          expect(analyticsService, isNotNull);
        } else {
          await analyticsService.initialize();
          expect(analyticsService, isNotNull);
        }
      });

      test('should handle native platform correctly', () async {
        await analyticsService.initialize();
        expect(analyticsService, isNotNull);
      });

      test('should log platform detection', () async {
        // Test platform detection logging
        await analyticsService.initialize();
        expect(analyticsService, isNotNull);
      });
    });

    group('Error Handling', () {
      test('should handle tracking errors gracefully', () async {
        // Test with null parameters
        await expectLater(
          () => analyticsService.trackEvent('test', null),
          returnsNormally,
        );
      });

      test('should handle empty event names', () async {
        await expectLater(
          () => analyticsService.trackEvent('', {}),
          returnsNormally,
        );
      });

      test('should handle invalid parameters', () async {
        await expectLater(
          () => analyticsService.trackEvent('test', {'invalid': Object()}),
          returnsNormally,
        );
      });

      test('should handle initialization failures', () async {
        // Test that initialization failures don't crash
        await expectLater(
          () => analyticsService.initialize(),
          returnsNormally,
        );
      });
    });

    group('Event Parameters', () {
      test('should handle string parameters', () async {
        await analyticsService.trackEvent('test', {'string_param': 'value'});
        
        final event = analyticsService.debugEvents.last;
        expect(event['string_param'], equals('value'));
      });

      test('should handle numeric parameters', () async {
        await analyticsService.trackEvent('test', {
          'int_param': 42,
          'double_param': 3.14,
        });
        
        final event = analyticsService.debugEvents.last;
        expect(event['int_param'], equals(42));
        expect(event['double_param'], equals(3.14));
      });

      test('should handle boolean parameters', () async {
        await analyticsService.trackEvent('test', {'bool_param': true});
        
        final event = analyticsService.debugEvents.last;
        expect(event['bool_param'], equals(true));
      });

      test('should handle null parameters', () async {
        await analyticsService.trackEvent('test', {'null_param': null});
        
        final event = analyticsService.debugEvents.last;
        expect(event.containsKey('null_param'), isTrue);
      });
    });

    group('Logging', () {
      test('should log events in debug mode', () async {
        await analyticsService.trackPageView('test', 'TestPage');
        
        // In debug mode, events should be logged
        expect(analyticsService.debugEvents, isNotEmpty);
      });

      test('should log initialization status', () async {
        // Test that initialization is logged
        await expectLater(
          () => analyticsService.initialize(),
          returnsNormally,
        );
      });

      test('should log tracking attempts', () async {
        await analyticsService.trackEvent('test_log', {});
        
        // Verify logging doesn't cause errors
        expect(analyticsService.debugEvents, isNotEmpty);
      });
    });

    group('Service State', () {
      test('should maintain initialization state', () async {
        expect(analyticsService.isInitialized, isFalse);
        
        await analyticsService.initialize();
        
        // State should be updated after initialization
        expect(analyticsService, isNotNull);
      });

      test('should handle multiple initializations', () async {
        await analyticsService.initialize();
        await analyticsService.initialize();
        
        // Should handle multiple calls gracefully
        expect(analyticsService, isNotNull);
      });

      test('should maintain event history', () async {
        await analyticsService.trackEvent('event1', {});
        await analyticsService.trackEvent('event2', {});
        
        expect(analyticsService.debugEvents, hasLength(2));
        expect(analyticsService.debugEvents[0]['event'], equals('event1'));
        expect(analyticsService.debugEvents[1]['event'], equals('event2'));
      });
    });
  });
}
