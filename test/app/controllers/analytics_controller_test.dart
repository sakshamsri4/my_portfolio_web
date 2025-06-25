import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_portfolio_web/app/controllers/analytics_controller.dart';
import 'package:my_portfolio_web/app/services/analytics_service.dart';

import 'analytics_controller_test.mocks.dart';

@GenerateMocks([AnalyticsService])
void main() {
  group('AnalyticsController', () {
    late AnalyticsController controller;
    late MockAnalyticsService mockAnalyticsService;

    setUp(() {
      mockAnalyticsService = MockAnalyticsService();
      Get.reset();
      Get.put<AnalyticsService>(mockAnalyticsService);
      controller = AnalyticsController();
    });

    tearDown(() {
      Get.reset();
    });

    group('Initialization', () {
      test('should initialize with analytics service', () {
        controller.onInit();
        expect(controller, isA<AnalyticsController>());
      });

      test('should find analytics service on init', () {
        controller.onInit();
        // Verify that the controller initializes without error
        expect(controller, isNotNull);
      });
    });

    group('Page Tracking', () {
      test('should track page views', () async {
        when(mockAnalyticsService.trackPageView(any, any))
            .thenAnswer((_) async => Future.value());

        await controller.trackPageView('home');

        verify(mockAnalyticsService.trackPageView('home', 'portfolio_page'))
            .called(1);
      });

      test('should track navigation clicks', () async {
        when(mockAnalyticsService.trackButtonClick(any, any))
            .thenAnswer((_) async => Future.value());

        await controller.trackNavigationClick('about');

        verify(mockAnalyticsService.trackButtonClick(
          'navigation_about',
          'header_navigation',
        )).called(1);
      });
    });

    group('Project Tracking', () {
      test('should track project views', () async {
        when(mockAnalyticsService.trackEvent(any, any))
            .thenAnswer((_) async => Future.value());

        await controller.trackProjectView(
          projectName: 'Portfolio Website',
          category: 'web',
        );

        verify(mockAnalyticsService.trackEvent('project_view', {
          'project_name': 'Portfolio Website',
          'category': 'web',
        })).called(1);
      });

      test('should track project clicks', () async {
        when(mockAnalyticsService.trackButtonClick(any, any))
            .thenAnswer((_) async => Future.value());

        await controller.trackProjectClick('Portfolio Website');

        verify(mockAnalyticsService.trackButtonClick(
          'project_Portfolio Website',
          'projects_section',
        )).called(1);
      });

      test('should track project filtering', () async {
        when(mockAnalyticsService.trackEvent(any, any))
            .thenAnswer((_) async => Future.value());

        await controller.trackProjectFilter('web');

        verify(mockAnalyticsService.trackEvent('project_filter', {
          'filter_type': 'web',
        })).called(1);
      });
    });

    group('Skill Tracking', () {
      test('should track skill clicks', () async {
        when(mockAnalyticsService.trackEvent(any, any))
            .thenAnswer((_) async => Future.value());

        await controller.trackSkillClick(
          skillName: 'Flutter',
          category: 'mobile',
        );

        verify(mockAnalyticsService.trackEvent('skill_interaction', {
          'skill_name': 'Flutter',
          'category': 'mobile',
        })).called(1);
      });

      test('should track skill clicks without category', () async {
        when(mockAnalyticsService.trackEvent(any, any))
            .thenAnswer((_) async => Future.value());

        await controller.trackSkillClick(skillName: 'Flutter');

        verify(mockAnalyticsService.trackEvent('skill_interaction', {
          'skill_name': 'Flutter',
          'category': 'unknown',
        })).called(1);
      });
    });

    group('Contact Tracking', () {
      test('should track contact actions', () async {
        when(mockAnalyticsService.trackContactSubmission(any))
            .thenAnswer((_) async => Future.value());

        await controller.trackContactAction('submit', method: 'email');

        verify(mockAnalyticsService.trackContactSubmission('email')).called(1);
      });

      test('should track contact actions without method', () async {
        when(mockAnalyticsService.trackContactSubmission(any))
            .thenAnswer((_) async => Future.value());

        await controller.trackContactAction('submit');

        verify(mockAnalyticsService.trackContactSubmission('submit')).called(1);
      });

      test('should track CV downloads', () async {
        when(mockAnalyticsService.trackDownload(any, any))
            .thenAnswer((_) async => Future.value());

        await controller.trackCVDownload(source: 'hero_section');

        verify(mockAnalyticsService.trackDownload('cv.pdf', 'pdf')).called(1);
      });

      test('should track CV downloads without source', () async {
        when(mockAnalyticsService.trackDownload(any, any))
            .thenAnswer((_) async => Future.value());

        await controller.trackCVDownload();

        verify(mockAnalyticsService.trackDownload('cv.pdf', 'pdf')).called(1);
      });
    });

    group('Theme Tracking', () {
      test('should track theme changes', () async {
        when(mockAnalyticsService.trackEvent(any, any))
            .thenAnswer((_) async => Future.value());

        await controller.trackThemeChange('dark');

        verify(mockAnalyticsService.trackEvent('theme_change', {
          'theme_name': 'dark',
        })).called(1);
      });
    });

    group('Social Media Tracking', () {
      test('should track social media clicks', () async {
        when(mockAnalyticsService.trackEvent(any, any))
            .thenAnswer((_) async => Future.value());

        await controller.trackSocialMediaClick('linkedin');

        verify(mockAnalyticsService.trackEvent('social_media_click', {
          'platform': 'linkedin',
        })).called(1);
      });

      test('should track external link clicks', () async {
        when(mockAnalyticsService.trackEvent(any, any))
            .thenAnswer((_) async => Future.value());

        await controller.trackExternalLinkClick(
          'https://github.com/user/repo',
          'GitHub Repository',
        );

        verify(mockAnalyticsService.trackEvent('external_link_click', {
          'url': 'https://github.com/user/repo',
          'link_text': 'GitHub Repository',
        })).called(1);
      });
    });

    group('User Interaction Tracking', () {
      test('should track scroll events', () async {
        when(mockAnalyticsService.trackEvent(any, any))
            .thenAnswer((_) async => Future.value());

        await controller.trackScrollEvent('projects_section');

        verify(mockAnalyticsService.trackEvent('scroll_to_section', {
          'section': 'projects_section',
        })).called(1);
      });

      test('should track form interactions', () async {
        when(mockAnalyticsService.trackEvent(any, any))
            .thenAnswer((_) async => Future.value());

        await controller.trackFormInteraction('contact_form', 'focus');

        verify(mockAnalyticsService.trackEvent('form_interaction', {
          'form_name': 'contact_form',
          'action': 'focus',
        })).called(1);
      });

      test('should track search actions', () async {
        when(mockAnalyticsService.trackEvent(any, any))
            .thenAnswer((_) async => Future.value());

        await controller.trackSearch('flutter', 'projects');

        verify(mockAnalyticsService.trackEvent('search', {
          'query': 'flutter',
          'context': 'projects',
        })).called(1);
      });

      test('should track scroll depth', () async {
        when(mockAnalyticsService.trackEvent(any, any))
            .thenAnswer((_) async => Future.value());

        await controller.trackScrollDepth(75);

        verify(mockAnalyticsService.trackEvent('scroll_depth', {
          'percentage': 75,
        })).called(1);
      });

      test('should track time on page', () async {
        when(mockAnalyticsService.trackEvent(any, any))
            .thenAnswer((_) async => Future.value());

        await controller.trackTimeOnPage('home', 120);

        verify(mockAnalyticsService.trackEvent('time_on_page', {
          'page_name': 'home',
          'seconds': 120,
        })).called(1);
      });
    });

    group('Advanced Tracking', () {
      test('should track user engagement', () async {
        when(mockAnalyticsService.trackEvent(any, any))
            .thenAnswer((_) async => Future.value());

        await controller.trackEngagement('click', 'button');

        verify(mockAnalyticsService.trackEvent('user_engagement', {
          'engagement_type': 'click',
          'value': 'button',
        })).called(1);
      });

      test('should track performance metrics', () async {
        when(mockAnalyticsService.trackEvent(any, any))
            .thenAnswer((_) async => Future.value());

        await controller.trackPerformance('page_load_time', 1.5);

        verify(mockAnalyticsService.trackEvent('performance_metric', {
          'metric': 'page_load_time',
          'value': 1.5,
        })).called(1);
      });

      test('should track feature usage', () async {
        when(mockAnalyticsService.trackEvent(any, any))
            .thenAnswer((_) async => Future.value());

        await controller.trackFeatureUsage('dark_mode');

        verify(mockAnalyticsService.trackEvent('feature_usage', {
          'feature_name': 'dark_mode',
        })).called(1);
      });
    });

    group('Error Handling', () {
      test('should handle analytics service errors', () async {
        when(mockAnalyticsService.trackPageView(any, any))
            .thenThrow(Exception('Analytics error'));

        await expectLater(
          () => controller.trackPageView('home'),
          returnsNormally,
        );
      });

      test('should handle null parameters', () async {
        when(mockAnalyticsService.trackEvent(any, any))
            .thenAnswer((_) async => Future.value());

        await expectLater(
          () => controller.trackSkillClick(skillName: 'Flutter'),
          returnsNormally,
        );
      });

      test('should handle service not found', () {
        Get.reset();
        final newController = AnalyticsController();
        
        expect(() => newController.onInit(), throwsA(isA<Exception>()));
      });
    });

    group('Controller Lifecycle', () {
      test('should initialize properly', () {
        expect(() => controller.onInit(), returnsNormally);
      });

      test('should dispose properly', () {
        controller.onInit();
        expect(() => controller.onClose(), returnsNormally);
      });

      test('should handle multiple initializations', () {
        controller.onInit();
        expect(() => controller.onInit(), returnsNormally);
      });
    });
  });
}
