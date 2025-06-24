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
    await _analyticsService.trackPageView(pageName, 'portfolio_page');
  }

  /// Track navigation button clicks
  Future<void> trackNavigationClick(String destination) async {
    await _analyticsService.trackButtonClick('navigation_$destination', 'header_navigation');
  }

  /// Track button clicks (generic method for tests and widgets)
  Future<void> trackButtonClick({
    required String buttonName,
    String? section,
    Map<String, Object>? parameters,
  }) async {
    await _analyticsService.trackButtonClick(buttonName, section);
  }

  /// Track hero section interactions
  Future<void> trackHeroInteraction(String action) async {
    await _analyticsService.trackButtonClick('hero_$action', 'hero_section');
  }

  /// Track project interactions
  Future<void> trackProjectClick({
    required String projectName,
    required String action,
  }) async {
    await _analyticsService.trackEvent('project_interaction', {
      'project_name': projectName,
      'action': action,
    });
  }

  /// Track skill interactions
  Future<void> trackSkillClick({
    required String skillName,
    String? category,
  }) async {
    await _analyticsService.trackEvent('skill_interaction', {
      'skill_name': skillName,
      'category': category ?? 'unknown',
    });
  }

  /// Track contact actions
  Future<void> trackContactAction(String action, {String? method}) async {
    await _analyticsService.trackContactSubmission(method ?? action);
  }

  /// Track CV download
  Future<void> trackCVDownload({String? source}) async {
    await _analyticsService.trackDownload('cv.pdf', 'pdf');
  }

  /// Track theme changes
  Future<void> trackThemeChange(String themeName) async {
    await _analyticsService.trackEvent('theme_change', {
      'theme_name': themeName,
    });
  }

  /// Track errors
  Future<void> trackError({
    required String errorType,
    required String errorMessage,
    String? context,
  }) async {
    await _analyticsService.trackError(errorType, errorMessage);
  }

  /// Track section views
  Future<void> trackSectionView(String sectionName) async {
    await _analyticsService.trackSectionView(sectionName);
  }

  /// Track social media clicks
  Future<void> trackSocialClick(String platform) async {
    await _analyticsService.trackButtonClick('social_$platform', 'social_links');
  }

  /// Track external link clicks
  Future<void> trackExternalLink(String url, String context) async {
    await _analyticsService.trackEvent('external_link_click', {
      'url': url,
      'context': context,
    });
  }

  /// Track form interactions
  Future<void> trackFormInteraction(String formName, String action) async {
    await _analyticsService.trackEvent('form_interaction', {
      'form_name': formName,
      'action': action,
    });
  }

  /// Track search actions
  Future<void> trackSearch(String query, String context) async {
    await _analyticsService.trackEvent('search', {
      'query': query,
      'context': context,
    });
  }

  /// Track scroll depth
  Future<void> trackScrollDepth(int percentage) async {
    await _analyticsService.trackEvent('scroll_depth', {
      'percentage': percentage,
    });
  }

  /// Track time spent on page
  Future<void> trackTimeOnPage(String pageName, int seconds) async {
    await _analyticsService.trackEvent('time_on_page', {
      'page_name': pageName,
      'seconds': seconds,
    });
  }

  /// Track user engagement
  Future<void> trackEngagement(String type, String value) async {
    await _analyticsService.trackEvent('user_engagement', {
      'engagement_type': type,
      'value': value,
    });
  }

  /// Track performance metrics
  Future<void> trackPerformance(String metric, double value) async {
    await _analyticsService.trackEvent('performance_metric', {
      'metric': metric,
      'value': value,
    });
  }

  /// Track feature usage
  Future<void> trackFeatureUsage(String featureName) async {
    await _analyticsService.trackEvent('feature_usage', {
      'feature_name': featureName,
    });
  }

  /// Track user preferences
  Future<void> trackUserPreference(String preference, String value) async {
    await _analyticsService.trackEvent('user_preference', {
      'preference': preference,
      'value': value,
    });
  }

  /// Track conversion events
  Future<void> trackConversion(String conversionType, String value) async {
    await _analyticsService.trackEvent('conversion', {
      'conversion_type': conversionType,
      'value': value,
    });
  }

  /// Track custom events
  Future<void> trackCustomEvent(String eventName, Map<String, dynamic> parameters) async {
    await _analyticsService.trackEvent(eventName, parameters);
  }

  /// Get analytics service for direct access if needed
  AnalyticsService get analyticsService => _analyticsService;

  /// Check if analytics is initialized
  bool get isAnalyticsInitialized => _analyticsService.isInitialized;

  /// Get debug events (for testing)
  List<Map<String, dynamic>> get debugEvents => _analyticsService.debugEvents;
}
