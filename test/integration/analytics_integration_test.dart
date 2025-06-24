import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/analytics_controller.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:my_portfolio_web/app/services/analytics_service.dart';

import '../helpers/pump_app.dart';
import '../mocks/analytics_mock.dart';

void main() {
  group('Analytics Integration Tests', () {
    late MockAnalyticsService mockAnalyticsService;
    late AnalyticsController analyticsController;
    late HomeController homeController;

    setUp(() {
      Get.testMode = true;

      // Set up mock analytics service
      mockAnalyticsService = MockAnalyticsService();
      Get.put<AnalyticsService>(mockAnalyticsService);

      // Initialize controllers
      analyticsController = AnalyticsController();
      Get.put<AnalyticsController>(analyticsController);

      // Mock home controller dependencies
      homeController = HomeController();
      Get.put<HomeController>(homeController);
    });

    tearDown(() {
      Get.reset();
    });

    group('Service Integration', () {
      test('should initialize analytics service successfully', () async {
        await mockAnalyticsService.initialize();

        expect(mockAnalyticsService.isInitialized, isTrue);

        final status = mockAnalyticsService.getAnalyticsStatus();
        expect(status['is_initialized'], isTrue);
        expect(status['mock'], isTrue);
      });

      test('should track events through controller', () async {
        // Clear any existing events
        mockAnalyticsService.clearTrackedEvents();

        // Track various events
        await analyticsController.trackPageView('home');
        await analyticsController.trackNavigationClick('about');
        await analyticsController.trackHeroInteraction('cta_click');

        final trackedEvents = mockAnalyticsService.getTrackedEvents();
        expect(trackedEvents.length, equals(3));

        // Verify page view event
        expect(
          mockAnalyticsService.hasEvent('page_view', withParameters: {
            'page_name': 'home',
          }),
          isTrue,
        );

        // Verify button click event
        expect(
          mockAnalyticsService.hasEvent('button_click', withParameters: {
            'button_name': 'navigation_about',
          }),
          isTrue,
        );

        // Verify hero interaction event
        expect(
          mockAnalyticsService.hasEvent('button_click', withParameters: {
            'button_name': 'hero_cta_click',
          }),
          isTrue,
        );
      });
    });

    group('User Journey Tracking', () {
      test('should track complete user journey', () async {
        mockAnalyticsService.clearTrackedEvents();

        // Simulate user journey
        await analyticsController.trackPageView('home');
        await analyticsController.trackNavigationClick('projects');
        await analyticsController.trackProjectClick(
          projectName: 'portfolio_app',
          action: 'view_demo',
        );
        await analyticsController.trackNavigationClick('contact');
        await analyticsController.trackContactAction('email_click',
            method: 'email');
        await analyticsController.trackCVDownload(source: 'contact_section');

        final events = mockAnalyticsService.getTrackedEvents();
        expect(events.length, equals(6));

        // Verify journey sequence
        expect(events[0]['event_type'], equals('page_view'));
        expect(events[1]['event_type'], equals('button_click'));
        expect(events[2]['event_type'], equals('project_interaction'));
        expect(events[3]['event_type'], equals('button_click'));
        expect(events[4]['event_type'], equals('contact_interaction'));
        expect(events[5]['event_type'], equals('cv_download'));
      });

      test('should track skills section interactions', () async {
        mockAnalyticsService.clearTrackedEvents();

        // Simulate skills interactions
        await analyticsController.trackSkillClick(
          skillName: 'Flutter',
          category: 'mobile',
        );
        await analyticsController.trackSkillClick(
          skillName: 'Firebase',
          category: 'backend',
        );
        await analyticsController.trackSkillClick(skillName: 'Dart');

        final skillEvents =
            mockAnalyticsService.getEventsByType('skill_interaction');
        expect(skillEvents.length, equals(3));

        // Verify skill categories
        expect(skillEvents[0]['category'], equals('mobile'));
        expect(skillEvents[1]['category'], equals('backend'));
        expect(skillEvents[2]['category'], isNull);
      });

      test('should track social media interactions', () async {
        mockAnalyticsService.clearTrackedEvents();

        // Simulate social media clicks
        await analyticsController.trackSocialClick(
          platform: 'linkedin',
          source: 'header',
        );
        await analyticsController.trackSocialClick(
          platform: 'github',
          source: 'projects_section',
        );

        final socialEvents =
            mockAnalyticsService.getEventsByType('social_media_click');
        expect(socialEvents.length, equals(2));

        expect(socialEvents[0]['platform'], equals('linkedin'));
        expect(socialEvents[1]['platform'], equals('github'));
      });
    });

    group('Error Scenarios', () {
      test('should handle analytics service errors gracefully', () async {
        // Test with null parameters
        expect(
          () => analyticsController.trackPageView('test'),
          returnsNormally,
        );

        expect(
          () => analyticsController.trackButtonClick(buttonName: 'test'),
          returnsNormally,
        );

        expect(
          () => analyticsController.trackProjectClick(
            projectName: 'test',
            action: 'test',
          ),
          returnsNormally,
        );
      });

      test('should maintain event tracking even with errors', () async {
        mockAnalyticsService.clearTrackedEvents();

        // Track some events
        await analyticsController.trackPageView('home');

        // Simulate error scenario (this shouldn't break subsequent tracking)
        try {
          await analyticsController.trackError(
            errorType: 'test_error',
            errorMessage: 'invalid_event',
          );
        } on Exception catch (e) {
          // Error handling
        }

        // Continue tracking
        await analyticsController.trackNavigationClick('about');

        final events = mockAnalyticsService.getTrackedEvents();
        expect(events.length, greaterThanOrEqualTo(2));
      });
    });

    group('Performance Tests', () {
      test('should handle rapid event tracking', () async {
        mockAnalyticsService.clearTrackedEvents();

        // Track many events rapidly
        final futures = <Future<void>>[];
        for (var i = 0; i < 10; i++) {
          futures.add(analyticsController.trackPageView('page_$i'));
          futures.add(
              analyticsController.trackButtonClick(buttonName: 'button_$i'));
        }

        await Future.wait(futures);

        final events = mockAnalyticsService.getTrackedEvents();
        expect(events.length, equals(20));
      });

      test('should handle concurrent analytics calls', () async {
        mockAnalyticsService.clearTrackedEvents();

        // Simulate concurrent user interactions
        await Future.wait([
          analyticsController.trackPageView('home'),
          analyticsController.trackNavigationClick('about'),
          analyticsController.trackSkillClick(skillName: 'Flutter'),
          analyticsController.trackProjectClick(
            projectName: 'test',
            action: 'view',
          ),
          analyticsController.trackContactAction('form_view'),
        ]);

        final events = mockAnalyticsService.getTrackedEvents();
        expect(events.length, equals(5));
      });
    });

    group('Data Validation', () {
      test('should include required parameters in events', () async {
        mockAnalyticsService.clearTrackedEvents();

        await analyticsController.trackPageView('home');

        final pageViewEvents =
            mockAnalyticsService.getEventsByType('page_view');
        expect(pageViewEvents.length, equals(1));

        final event = pageViewEvents.first;
        expect(event['page_name'], equals('home'));
        expect(event['timestamp'], isNotNull);
        expect(event['event_type'], equals('page_view'));
      });

      test('should include timestamps in all events', () async {
        mockAnalyticsService.clearTrackedEvents();

        await analyticsController.trackButtonClick(buttonName: 'test_button');
        await analyticsController.trackProjectClick(
          projectName: 'test',
          action: 'click',
        );

        final events = mockAnalyticsService.getTrackedEvents();

        for (final event in events) {
          expect(event['timestamp'], isNotNull);
          expect(event['timestamp'], isA<String>());
        }
      });
    });
  });
}
