import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository_interface.dart';
import 'package:my_portfolio_web/app/services/analytics_service.dart';

/// Test utilities and helpers for the portfolio app tests
class TestUtils {
  /// Private constructor to prevent instantiation
  TestUtils._();

  /// Setup GetX for testing
  static void setupGetX() {
    Get.testMode = true;
  }

  /// Clean up GetX after testing
  static void cleanupGetX() {
    Get.reset();
    Get.testMode = false;
  }

  /// Create a test widget with Material app wrapper
  static Widget createTestWidget(Widget child) {
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  /// Create a test widget with GetMaterialApp wrapper
  static Widget createGetTestWidget(Widget child) {
    return GetMaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  /// Pump and settle a widget with default timeout
  static Future<void> pumpAndSettle(
    WidgetTester tester,
    Widget widget, {
    Duration timeout = const Duration(seconds: 10),
  }) async {
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle(timeout);
  }

  /// Create mock analytics service with default behavior
  static MockAnalyticsService createMockAnalyticsService() {
    final mock = MockAnalyticsService();
    
    when(mock.initialize()).thenAnswer((_) async {});
    when(mock.isInitialized).thenReturn(true);
    when(mock.debugEvents).thenReturn([]);
    when(mock.trackEvent(any, any)).thenAnswer((_) async {});
    when(mock.trackPageView(any, any)).thenAnswer((_) async {});
    when(mock.trackButtonClick(any, any)).thenAnswer((_) async {});
    when(mock.trackDownload(any, any)).thenAnswer((_) async {});
    when(mock.trackContactSubmission(any)).thenAnswer((_) async {});
    when(mock.setUserProperty(any, any)).thenAnswer((_) async {});
    when(mock.getAnalyticsStatus()).thenReturn({
      'is_initialized': true,
      'debug_mode': true,
      'debug_events_count': 0,
      'project_id': 'test-project',
      'measurement_id': 'G-TEST123',
      'firebase_app_id': 'test-app-id',
    });
    
    return mock;
  }

  /// Create mock portfolio repository with default data
  static MockPortfolioRepositoryInterface createMockRepository() {
    final mock = MockPortfolioRepositoryInterface();
    
    when(mock.initialize()).thenAnswer((_) async {});
    when(mock.dispose()).thenReturn(null);
    
    when(mock.getContactInfo()).thenReturn({
      'email': 'test@example.com',
      'phone': '+1234567890',
      'location': 'Test City, Test Country',
    });
    
    when(mock.getSocialLinks()).thenReturn({
      'linkedin': {
        'url': 'https://linkedin.com/in/test',
        'icon': 'linkedin_icon',
        'color': 'blue',
      },
      'github': {
        'url': 'https://github.com/test',
        'icon': 'github_icon',
        'color': 'black',
      },
    });
    
    when(mock.getProjects()).thenReturn([
      {
        'title': 'Test Project 1',
        'description': 'Test project description 1',
        'image': 'assets/images/test1.jpg',
        'tileImage': 'assets/tile_images/test1.webp',
        'url': 'https://example.com/project1',
      },
      {
        'title': 'Test Project 2',
        'description': 'Test project description 2',
        'image': 'assets/images/test2.jpg',
        'tileImage': 'assets/tile_images/test2.webp',
        'url': 'https://example.com/project2',
      },
    ]);
    
    when(mock.getCareerTimeline()).thenReturn([
      {
        'company': 'Test Company 1',
        'role': 'Senior Developer',
        'period': 'Jan 2023 - Present',
        'description': 'Test role description 1',
      },
      {
        'company': 'Test Company 2',
        'role': 'Developer',
        'period': 'Jan 2021 - Dec 2022',
        'description': 'Test role description 2',
      },
    ]);
    
    when(mock.getSkillCategories()).thenReturn([
      {
        'category': 'Flutter',
        'iconType': 'svg',
        'skills': ['Dart', 'Widgets', 'Animations'],
      },
      {
        'category': 'Backend',
        'iconType': 'svg',
        'skills': ['Firebase', 'REST API', 'GraphQL'],
      },
    ]);
    
    when(mock.getAnimatedGreetings()).thenReturn([
      'Senior Flutter Developer',
      'Mobile App Architect',
      'UI/UX Enthusiast',
    ]);
    
    when(mock.getAnimatedIntroductions()).thenReturn([
      'Building amazing mobile experiences',
      'Creating performant Flutter apps',
      'Designing beautiful user interfaces',
    ]);
    
    when(mock.getDesignPhilosophyQuotes()).thenReturn([
      'Design is not just what it looks like - design is how it works.',
      'Simplicity is the ultimate sophistication.',
      'Good design is obvious. Great design is transparent.',
    ]);
    
    when(mock.getEducationInfo()).thenReturn([
      {
        'degree': 'Bachelor of Technology',
        'institution': 'Test University',
        'year': '2020',
      },
    ]);
    
    when(mock.getProfessionalSummary()).thenReturn(
      'Experienced Flutter developer with expertise in mobile app development, '
      'UI/UX design, and performance optimization. Passionate about creating '
      'beautiful and functional mobile applications.',
    );
    
    when(mock.getTechStack()).thenReturn([]);
    
    return mock;
  }

  /// Verify that a mock was called with specific parameters
  static void verifyMockCall(
    Mock mock,
    String methodName,
    List<dynamic> positionalArgs, [
    Map<Symbol, dynamic>? namedArgs,
  ]) {
    verify(mock.noSuchMethod(
      Invocation.method(Symbol(methodName), positionalArgs, namedArgs),
    ));
  }

  /// Create a test environment with all necessary mocks
  static TestEnvironment createTestEnvironment() {
    final analyticsService = createMockAnalyticsService();
    final repository = createMockRepository();
    
    Get.put<AnalyticsService>(analyticsService);
    Get.put<PortfolioRepositoryInterface>(repository);
    
    return TestEnvironment(
      analyticsService: analyticsService,
      repository: repository,
    );
  }

  /// Wait for animations to complete
  static Future<void> waitForAnimations(WidgetTester tester) async {
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  /// Find widget by type and verify it exists
  static T findWidgetByType<T extends Widget>(WidgetTester tester) {
    final finder = find.byType(T);
    expect(finder, findsOneWidget);
    return tester.widget<T>(finder);
  }

  /// Find widget by key and verify it exists
  static Widget findWidgetByKey(WidgetTester tester, Key key) {
    final finder = find.byKey(key);
    expect(finder, findsOneWidget);
    return tester.widget(finder);
  }

  /// Tap a widget and wait for animations
  static Future<void> tapAndSettle(
    WidgetTester tester,
    Finder finder,
  ) async {
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  /// Enter text in a text field and wait for changes
  static Future<void> enterTextAndSettle(
    WidgetTester tester,
    Finder finder,
    String text,
  ) async {
    await tester.enterText(finder, text);
    await tester.pumpAndSettle();
  }

  /// Scroll a widget and wait for animations
  static Future<void> scrollAndSettle(
    WidgetTester tester,
    Finder finder,
    Offset offset,
  ) async {
    await tester.drag(finder, offset);
    await tester.pumpAndSettle();
  }

  /// Verify that a snackbar is shown with specific text
  static void verifySnackbar(WidgetTester tester, String text) {
    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text(text), findsOneWidget);
  }

  /// Verify that no snackbar is shown
  static void verifyNoSnackbar(WidgetTester tester) {
    expect(find.byType(SnackBar), findsNothing);
  }

  /// Create a test size for responsive testing
  static Size createTestSize({
    double width = 800,
    double height = 600,
  }) {
    return Size(width, height);
  }

  /// Set up responsive test environment
  static Future<void> setUpResponsiveTest(
    WidgetTester tester,
    Size size,
  ) async {
    await tester.binding.setSurfaceSize(size);
    addTearDown(() => tester.binding.setSurfaceSize(null));
  }
}

/// Test environment container
class TestEnvironment {
  const TestEnvironment({
    required this.analyticsService,
    required this.repository,
  });

  final MockAnalyticsService analyticsService;
  final MockPortfolioRepositoryInterface repository;

  /// Clean up the test environment
  void cleanup() {
    TestUtils.cleanupGetX();
  }
}

/// Mock classes for testing
class MockAnalyticsService extends Mock implements AnalyticsService {}

class MockPortfolioRepositoryInterface extends Mock 
    implements PortfolioRepositoryInterface {}
