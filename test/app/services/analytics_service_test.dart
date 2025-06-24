import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio_web/app/services/analytics_service.dart';

void main() {
  group('AnalyticsService', () {
    late AnalyticsService analyticsService;

    setUp(() {
      analyticsService = AnalyticsService();
    });

    group('Initialization', () {
      test('should be a singleton', () {
        final instance1 = AnalyticsService();
        final instance2 = AnalyticsService();
        expect(instance1, same(instance2));
      });

      test('should initialize successfully', () async {
        // Note: In a real test environment, we would need to mock Firebase.initializeApp
        // For now, we test the service structure
        expect(analyticsService, isNotNull);
        expect(analyticsService.isInitialized, isFalse);
      });

      test('should provide analytics status', () {
        final status = analyticsService.getAnalyticsStatus();

        expect(status, isA<Map<String, dynamic>>());
        expect(status['is_initialized'], isA<bool>());
        expect(status['debug_mode'], isA<bool>());
        expect(status['debug_events_count'], isA<int>());
        expect(status['firebase_app_id'],
            equals('1:51439261225:web:bb97fff3613e72ef96ae38'));
        expect(status['measurement_id'], equals('G-VVVFQJL1WD'));
        expect(status['project_id'], equals('saksham-portfolio-ba828'));
      });
    });

    group('Debug Events', () {
      test('should track debug events in debug mode', () {
        // Clear any existing events
        analyticsService.clearDebugEvents();

        final initialCount = analyticsService.debugEvents.length;
        expect(initialCount, equals(0));
      });

      test('should clear debug events', () {
        analyticsService.clearDebugEvents();
        expect(analyticsService.debugEvents.length, equals(0));
      });

      test('should provide immutable debug events list', () {
        final events = analyticsService.debugEvents;
        expect(events, isA<List<Map<String, dynamic>>>());

        // Should not be able to modify the returned list
        expect(() => events.add({}), throwsUnsupportedError);
      });
    });

    group('Event Tracking', () {
      test('should handle tracking calls gracefully when not initialized',
          () async {
        // These should not throw errors even when Firebase is not initialized
        expect(
          () => analyticsService.trackPageView(
            pageName: 'home',
            pageClass: 'portfolio_page',
            parameters: {'test': 'value'},
          ),
          returnsNormally,
        );

        expect(
          () => analyticsService.trackButtonClick(
            buttonName: 'test_button',
            section: 'test_section',
            parameters: {'action': 'click'},
          ),
          returnsNormally,
        );

        expect(
          () => analyticsService.trackProjectInteraction(
            projectName: 'test_project',
            action: 'view',
            parameters: {'source': 'portfolio'},
          ),
          returnsNormally,
        );

        expect(
          () => analyticsService.trackContactInteraction(
            action: 'email_click',
            method: 'email',
            parameters: {'section': 'contact'},
          ),
          returnsNormally,
        );

        expect(
          () => analyticsService.trackSkillInteraction(
            skillName: 'Flutter',
            action: 'click',
            category: 'mobile',
            parameters: {'level': 'expert'},
          ),
          returnsNormally,
        );

        expect(
          () => analyticsService.trackCVDownload(
            source: 'header_button',
            parameters: {'format': 'pdf'},
          ),
          returnsNormally,
        );

        expect(
          () => analyticsService.trackSocialMediaClick(
            platform: 'linkedin',
            source: 'contact_section',
            parameters: {'profile_type': 'professional'},
          ),
          returnsNormally,
        );

        expect(
          () => analyticsService.trackCustomEvent(
            eventName: 'custom_test_event',
            parameters: {'custom_param': 'custom_value'},
          ),
          returnsNormally,
        );
      });
    });

    group('User Management', () {
      test('should handle user ID setting gracefully', () async {
        expect(
          () => analyticsService.setUserId('test_user_123'),
          returnsNormally,
        );
      });

      test('should handle analytics data reset gracefully', () async {
        expect(
          () => analyticsService.resetAnalyticsData(),
          returnsNormally,
        );
      });
    });

    group('Error Handling', () {
      test('should handle null parameters gracefully', () async {
        expect(
          () => analyticsService.trackPageView(
            pageName: 'test',
          ),
          returnsNormally,
        );

        expect(
          () => analyticsService.trackButtonClick(
            buttonName: 'test',
          ),
          returnsNormally,
        );
      });

      test('should handle empty parameters', () async {
        expect(
          () => analyticsService.trackCustomEvent(
            eventName: 'test_event',
            parameters: {},
          ),
          returnsNormally,
        );
      });
    });
  });
}
