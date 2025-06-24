import 'package:get/get.dart';
import 'package:my_portfolio_web/app/services/analytics_service.dart';

/// Controller for managing analytics events throughout the app
class AnalyticsController extends GetxController {
  late final AnalyticsService _analyticsService;

  @override
  void onInit() {
    super.onInit();
    _analyticsService = Get.find<AnalyticsService>();
  }

  /// Track page navigation
  Future<void> trackPageView(String pageName) async {
    await _analyticsService.trackPageView(
      pageName: pageName,
      pageClass: 'portfolio_page',
      parameters: {
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  /// Track navigation button clicks
  Future<void> trackNavigationClick(String destination) async {
    await _analyticsService.trackButtonClick(
      buttonName: 'navigation_$destination',
      section: 'header_navigation',
      parameters: {
        'destination': destination,
      },
    );
  }

  /// Track button clicks (generic method for tests and widgets)
  Future<void> trackButtonClick({
    required String buttonName,
    String? section,
    Map<String, Object>? parameters,
  }) async {
    await _analyticsService.trackButtonClick(
      buttonName: buttonName,
      section: section,
      parameters: parameters,
    );
  }

  /// Track hero section interactions
  Future<void> trackHeroInteraction(String action) async {
    await _analyticsService.trackButtonClick(
      buttonName: 'hero_$action',
      section: 'hero_section',
      parameters: {
        'action': action,
      },
    );
  }

  /// Track project card interactions
  Future<void> trackProjectClick({
    required String projectName,
    required String action,
  }) async {
    await _analyticsService.trackProjectInteraction(
      projectName: projectName,
      action: action,
      parameters: {
        'section': 'projects_section',
      },
    );
  }

  /// Track skill chip interactions
  Future<void> trackSkillClick({
    required String skillName,
    String? category,
  }) async {
    await _analyticsService.trackSkillInteraction(
      skillName: skillName,
      action: 'click',
      category: category,
      parameters: {
        'section': 'skills_section',
      },
    );
  }

  /// Track contact form interactions
  Future<void> trackContactAction(String action, {String? method}) async {
    await _analyticsService.trackContactInteraction(
      action: action,
      method: method,
      parameters: {
        'section': 'contact_section',
      },
    );
  }

  /// Track CV download
  Future<void> trackCVDownload({String? source}) async {
    await _analyticsService.trackCVDownload(
      source: source,
      parameters: {
        'file_type': 'pdf',
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  /// Track social media clicks
  Future<void> trackSocialClick({
    required String platform,
    String? source,
  }) async {
    await _analyticsService.trackSocialMediaClick(
      platform: platform,
      source: source,
      parameters: {
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  /// Track carousel interactions
  Future<void> trackCarouselInteraction({
    required String carouselType,
    required String action,
    int? itemIndex,
  }) async {
    await _analyticsService.trackCustomEvent(
      eventName: 'carousel_interaction',
      parameters: {
        'carousel_type': carouselType,
        'action': action,
        if (itemIndex != null) 'item_index': itemIndex,
      },
    );
  }

  /// Track scroll events
  Future<void> trackScrollEvent({
    required String section,
    required double scrollPercentage,
  }) async {
    await _analyticsService.trackCustomEvent(
      eventName: 'scroll_event',
      parameters: {
        'section': section,
        'scroll_percentage': scrollPercentage.round(),
      },
    );
  }

  /// Track theme changes
  Future<void> trackThemeChange(String theme) async {
    await _analyticsService.trackCustomEvent(
      eventName: 'theme_change',
      parameters: {
        'theme': theme,
      },
    );
  }

  /// Track search interactions (if applicable)
  Future<void> trackSearchInteraction({
    required String query,
    int? resultsCount,
  }) async {
    await _analyticsService.trackCustomEvent(
      eventName: 'search_interaction',
      parameters: {
        'query': query,
        if (resultsCount != null) 'results_count': resultsCount,
      },
    );
  }

  /// Track error events
  Future<void> trackError({
    required String errorType,
    required String errorMessage,
    String? context,
  }) async {
    await _analyticsService.trackCustomEvent(
      eventName: 'error_event',
      parameters: {
        'error_type': errorType,
        'error_message': errorMessage,
        if (context != null) 'context': context,
      },
    );
  }

  /// Track performance metrics
  Future<void> trackPerformance({
    required String metricName,
    required double value,
    String? unit,
  }) async {
    await _analyticsService.trackCustomEvent(
      eventName: 'performance_metric',
      parameters: {
        'metric_name': metricName,
        'value': value,
        if (unit != null) 'unit': unit,
      },
    );
  }

  /// Track user engagement time
  Future<void> trackEngagementTime({
    required String section,
    required int timeSpentSeconds,
  }) async {
    await _analyticsService.trackCustomEvent(
      eventName: 'engagement_time',
      parameters: {
        'section': section,
        'time_spent_seconds': timeSpentSeconds,
      },
    );
  }
}
