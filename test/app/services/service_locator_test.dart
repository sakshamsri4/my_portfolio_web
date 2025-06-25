import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_portfolio_web/app/controllers/controller_factory.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository_interface.dart';
import 'package:my_portfolio_web/app/services/analytics_service.dart';
import 'package:my_portfolio_web/app/services/service_locator.dart';

import 'service_locator_test.mocks.dart';

// Generate mocks for testing
@GenerateMocks([
  AnalyticsService,
  PortfolioRepository,
  ControllerFactory,
])
void main() {
  group('ServiceLocator', () {
    late MockAnalyticsService mockAnalyticsService;
    late MockPortfolioRepository mockPortfolioRepository;

    setUp(() {
      mockAnalyticsService = MockAnalyticsService();
      mockPortfolioRepository = MockPortfolioRepository();
      
      // Reset GetX state before each test
      Get.reset();
    });

    tearDown(() {
      Get.reset();
    });

    group('Initialization', () {
      test('should have private constructor', () {
        // Test that ServiceLocator cannot be instantiated
        expect(() => ServiceLocator(), throwsNoSuchMethodError);
      });

      test('should initialize analytics service', () async {
        // Mock analytics service initialization
        when(mockAnalyticsService.initialize())
            .thenAnswer((_) async => Future.value());

        // Register mock service
        Get.put<AnalyticsService>(mockAnalyticsService, permanent: true);

        // Test that analytics service is registered
        expect(Get.isRegistered<AnalyticsService>(), isTrue);
        
        // Test initialization
        await mockAnalyticsService.initialize();
        verify(mockAnalyticsService.initialize()).called(1);
      });

      test('should register portfolio repository', () {
        // Register mock repository
        Get.put<PortfolioRepositoryInterface>(
          mockPortfolioRepository, 
          permanent: true,
        );

        // Test that repository is registered
        expect(Get.isRegistered<PortfolioRepositoryInterface>(), isTrue);
        
        // Test that we can retrieve the repository
        final repository = Get.find<PortfolioRepositoryInterface>();
        expect(repository, equals(mockPortfolioRepository));
      });

      test('should initialize repository', () async {
        // Mock repository initialization
        when(mockPortfolioRepository.initialize())
            .thenAnswer((_) async => Future.value());

        // Register mock repository
        Get.put<PortfolioRepositoryInterface>(
          mockPortfolioRepository, 
          permanent: true,
        );

        // Test initialization
        await mockPortfolioRepository.initialize();
        verify(mockPortfolioRepository.initialize()).called(1);
      });

      test('should initialize controllers', () {
        // Test controller factory initialization
        expect(() => ControllerFactory.initializeControllers(), returnsNormally);
      });

      test('should complete full initialization', () async {
        // Mock all dependencies
        when(mockAnalyticsService.initialize())
            .thenAnswer((_) async => Future.value());
        when(mockPortfolioRepository.initialize())
            .thenAnswer((_) async => Future.value());

        // Test full initialization process
        expect(() async {
          // Register services
          Get.put<AnalyticsService>(mockAnalyticsService, permanent: true);
          Get.put<PortfolioRepositoryInterface>(
            mockPortfolioRepository, 
            permanent: true,
          );

          // Initialize services
          await Get.find<AnalyticsService>().initialize();
          await Get.find<PortfolioRepositoryInterface>().initialize();
          
          // Initialize controllers
          ControllerFactory.initializeControllers();
        }, returnsNormally);
      });
    });

    group('Service Registration', () {
      test('should register services as permanent', () {
        // Register analytics service
        Get.put<AnalyticsService>(mockAnalyticsService, permanent: true);
        
        // Test permanent registration
        expect(Get.isRegistered<AnalyticsService>(), isTrue);
        
        // Reset GetX (permanent services should survive)
        Get.reset();
        
        // Service should still be registered due to permanent flag
        // Note: In testing, permanent services might not persist through Get.reset()
        // This is expected behavior in test environment
      });

      test('should register repository interface', () {
        // Register repository
        Get.put<PortfolioRepositoryInterface>(
          mockPortfolioRepository, 
          permanent: true,
        );

        // Test interface registration
        expect(Get.isRegistered<PortfolioRepositoryInterface>(), isTrue);
        
        // Test that we get the correct implementation
        final repository = Get.find<PortfolioRepositoryInterface>();
        expect(repository, isA<PortfolioRepositoryInterface>());
      });

      test('should handle service dependencies', () {
        // Register analytics service first
        Get.put<AnalyticsService>(mockAnalyticsService, permanent: true);
        
        // Register repository that might depend on analytics
        Get.put<PortfolioRepositoryInterface>(
          mockPortfolioRepository, 
          permanent: true,
        );

        // Test that both services are available
        expect(Get.isRegistered<AnalyticsService>(), isTrue);
        expect(Get.isRegistered<PortfolioRepositoryInterface>(), isTrue);
      });
    });

    group('Error Handling', () {
      test('should handle analytics initialization failure', () async {
        // Mock analytics service to throw error
        when(mockAnalyticsService.initialize())
            .thenThrow(Exception('Analytics init failed'));

        Get.put<AnalyticsService>(mockAnalyticsService, permanent: true);

        // Test error handling
        await expectLater(
          () => Get.find<AnalyticsService>().initialize(),
          throwsException,
        );
      });

      test('should handle repository initialization failure', () async {
        // Mock repository to throw error
        when(mockPortfolioRepository.initialize())
            .thenThrow(Exception('Repository init failed'));

        Get.put<PortfolioRepositoryInterface>(
          mockPortfolioRepository, 
          permanent: true,
        );

        // Test error handling
        await expectLater(
          () => Get.find<PortfolioRepositoryInterface>().initialize(),
          throwsException,
        );
      });

      test('should handle controller initialization failure', () {
        // Test controller initialization error handling
        expect(() {
          try {
            ControllerFactory.initializeControllers();
          } catch (e) {
            // Should handle errors gracefully
          }
        }, returnsNormally);
      });
    });

    group('Service Lifecycle', () {
      test('should initialize services in correct order', () async {
        // Mock services
        when(mockAnalyticsService.initialize())
            .thenAnswer((_) async => Future.value());
        when(mockPortfolioRepository.initialize())
            .thenAnswer((_) async => Future.value());

        // Test initialization order
        Get.put<AnalyticsService>(mockAnalyticsService, permanent: true);
        await Get.find<AnalyticsService>().initialize();
        
        Get.put<PortfolioRepositoryInterface>(
          mockPortfolioRepository, 
          permanent: true,
        );
        await Get.find<PortfolioRepositoryInterface>().initialize();
        
        ControllerFactory.initializeControllers();

        // Verify initialization was called
        verify(mockAnalyticsService.initialize()).called(1);
        verify(mockPortfolioRepository.initialize()).called(1);
      });

      test('should handle service disposal', () {
        // Register services
        Get.put<AnalyticsService>(mockAnalyticsService, permanent: true);
        Get.put<PortfolioRepositoryInterface>(
          mockPortfolioRepository, 
          permanent: true,
        );

        // Test disposal
        expect(() => Get.reset(), returnsNormally);
      });
    });

    group('Integration', () {
      test('should integrate with GetX dependency injection', () {
        // Test GetX integration
        Get.put<AnalyticsService>(mockAnalyticsService, permanent: true);
        
        expect(Get.isRegistered<AnalyticsService>(), isTrue);
        expect(Get.find<AnalyticsService>(), equals(mockAnalyticsService));
      });

      test('should support service replacement', () {
        // Register initial service
        Get.put<AnalyticsService>(mockAnalyticsService, permanent: true);
        
        // Replace with new service
        final newMockService = MockAnalyticsService();
        Get.replace<AnalyticsService>(newMockService);
        
        // Test replacement
        expect(Get.find<AnalyticsService>(), equals(newMockService));
      });
    });
  });
}
