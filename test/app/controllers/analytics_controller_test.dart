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
    late AnalyticsController analyticsController;
    late MockAnalyticsService mockAnalyticsService;

    setUp(() {
      Get.testMode = true;
      mockAnalyticsService = MockAnalyticsService();
      
      // Register the mock service
      Get.put<AnalyticsService>(mockAnalyticsService);
      
      // Mock all analytics service methods
      when(mockAnalyticsService.trackPageView(
        pageName: anyNamed('pageName'),
        pageClass: anyNamed('pageClass'),
        parameters: anyNamed('parameters'),
      )).thenAnswer((_) async {});
      
      when(mockAnalyticsService.trackButtonClick(
        buttonName: anyNamed('buttonName'),
        section: anyNamed('section'),
        parameters: anyNamed('parameters'),
      )).thenAnswer((_) async {});
      
      when(mockAnalyticsService.trackProjectInteraction(
        projectName: anyNamed('projectName'),
        action: anyNamed('action'),
        parameters: anyNamed('parameters'),
      )).thenAnswer((_) async {});
      
      when(mockAnalyticsService.trackContactInteraction(
        action: anyNamed('action'),
        method: anyNamed('method'),
        parameters: anyNamed('parameters'),
      )).thenAnswer((_) async {});
      
      when(mockAnalyticsService.trackSkillInteraction(
        skillName: anyNamed('skillName'),
        action: anyNamed('action'),
        category: anyNamed('category'),
        parameters: anyNamed('parameters'),
      )).thenAnswer((_) async {});
      
      when(mockAnalyticsService.trackCVDownload(
        source: anyNamed('source'),
        parameters: anyNamed('parameters'),
      )).thenAnswer((_) async {});
      
      when(mockAnalyticsService.trackSocialMediaClick(
        platform: anyNamed('platform'),
        source: anyNamed('source'),
        parameters: anyNamed('parameters'),
      )).thenAnswer((_) async {});
      
      when(mockAnalyticsService.trackCustomEvent(
        eventName: anyNamed('eventName'),
        parameters: anyNamed('parameters'),
      )).thenAnswer((_) async {});

      analyticsController = AnalyticsController();
    });

    tearDown(() {
      Get.reset();
    });

    group('Initialization', () {
      test('should initialize successfully', () {
        expect(analyticsController, isNotNull);
        expect(analyticsController, isA<AnalyticsController>());
      });

      test('should call onInit without errors', () {
        expect(() => analyticsController.onInit(), returnsNormally);
      });
    });

    group('Page Tracking', () {
      test('should track page view with correct parameters', () async {
        await analyticsController.trackPageView('home');
        
        verify(mockAnalyticsService.trackPageView(
          pageName: 'home',
          pageClass: 'portfolio_page',
          parameters: argThat(
            isA<Map<String, dynamic>>()
                .having((m) => m['timestamp'], 'timestamp', isA<int>()),
            named: 'parameters',
          ),
        )).called(1);
      });
    });

    group('Navigation Tracking', () {
      test('should track navigation click with destination', () async {
        await analyticsController.trackNavigationClick('about');
        
        verify(mockAnalyticsService.trackButtonClick(
          buttonName: 'navigation_about',
          section: 'header_navigation',
          parameters: {'destination': 'about'},
        )).called(1);
      });
    });

    group('Hero Section Tracking', () {
      test('should track hero interaction', () async {
        await analyticsController.trackHeroInteraction('cta_click');
        
        verify(mockAnalyticsService.trackButtonClick(
          buttonName: 'hero_cta_click',
          section: 'hero_section',
          parameters: {'action': 'cta_click'},
        )).called(1);
      });
    });

    group('Project Tracking', () {
      test('should track project click with project name and action', () async {
        await analyticsController.trackProjectClick(
          projectName: 'portfolio_app',
          action: 'view_demo',
        );
        
        verify(mockAnalyticsService.trackProjectInteraction(
          projectName: 'portfolio_app',
          action: 'view_demo',
          parameters: {'section': 'projects_section'},
        )).called(1);
      });
    });

    group('Skills Tracking', () {
      test('should track skill click with skill name', () async {
        await analyticsController.trackSkillClick(
          skillName: 'Flutter',
          category: 'mobile',
        );
        
        verify(mockAnalyticsService.trackSkillInteraction(
          skillName: 'Flutter',
          action: 'click',
          category: 'mobile',
          parameters: {'section': 'skills_section'},
        )).called(1);
      });

      test('should track skill click without category', () async {
        await analyticsController.trackSkillClick(skillName: 'Dart');
        
        verify(mockAnalyticsService.trackSkillInteraction(
          skillName: 'Dart',
          action: 'click',
          category: null,
          parameters: {'section': 'skills_section'},
        )).called(1);
      });
    });

    group('Contact Tracking', () {
      test('should track contact action with method', () async {
        await analyticsController.trackContactAction(
          'email_click',
          method: 'email',
        );
        
        verify(mockAnalyticsService.trackContactInteraction(
          action: 'email_click',
          method: 'email',
          parameters: {'section': 'contact_section'},
        )).called(1);
      });

      test('should track contact action without method', () async {
        await analyticsController.trackContactAction('form_view');
        
        verify(mockAnalyticsService.trackContactInteraction(
          action: 'form_view',
          method: null,
          parameters: {'section': 'contact_section'},
        )).called(1);
      });
    });

    group('CV Download Tracking', () {
      test('should track CV download with source', () async {
        await analyticsController.trackCVDownload(source: 'header_button');
        
        verify(mockAnalyticsService.trackCVDownload(
          source: 'header_button',
          parameters: argThat(
            isA<Map<String, dynamic>>()
                .having((m) => m['file_type'], 'file_type', equals('pdf'))
                .having((m) => m['timestamp'], 'timestamp', isA<int>()),
            named: 'parameters',
          ),
        )).called(1);
      });

      test('should track CV download without source', () async {
        await analyticsController.trackCVDownload();
        
        verify(mockAnalyticsService.trackCVDownload(
          source: null,
          parameters: argThat(
            isA<Map<String, dynamic>>()
                .having((m) => m['file_type'], 'file_type', equals('pdf'))
                .having((m) => m['timestamp'], 'timestamp', isA<int>()),
            named: 'parameters',
          ),
        )).called(1);
      });
    });

    group('Social Media Tracking', () {
      test('should track social click with platform and source', () async {
        await analyticsController.trackSocialClick(
          platform: 'linkedin',
          source: 'contact_section',
        );
        
        verify(mockAnalyticsService.trackSocialMediaClick(
          platform: 'linkedin',
          source: 'contact_section',
          parameters: argThat(
            isA<Map<String, dynamic>>()
                .having((m) => m['timestamp'], 'timestamp', isA<int>()),
            named: 'parameters',
          ),
        )).called(1);
      });
    });

    group('Carousel Tracking', () {
      test('should track carousel interaction', () async {
        await analyticsController.trackCarouselInteraction(
          carouselType: 'projects',
          action: 'swipe_left',
          itemIndex: 2,
        );
        
        verify(mockAnalyticsService.trackCustomEvent(
          eventName: 'carousel_interaction',
          parameters: {
            'carousel_type': 'projects',
            'action': 'swipe_left',
            'item_index': 2,
          },
        )).called(1);
      });

      test('should track carousel interaction without item index', () async {
        await analyticsController.trackCarouselInteraction(
          carouselType: 'skills',
          action: 'auto_play',
        );
        
        verify(mockAnalyticsService.trackCustomEvent(
          eventName: 'carousel_interaction',
          parameters: {
            'carousel_type': 'skills',
            'action': 'auto_play',
          },
        )).called(1);
      });
    });
  });
}
