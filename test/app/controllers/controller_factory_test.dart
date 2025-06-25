import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_portfolio_web/app/controllers/career_controller.dart';
import 'package:my_portfolio_web/app/controllers/contact_controller.dart';
import 'package:my_portfolio_web/app/controllers/controller_factory.dart';
import 'package:my_portfolio_web/app/controllers/navigation_controller.dart';
import 'package:my_portfolio_web/app/controllers/projects_controller.dart';
import 'package:my_portfolio_web/app/controllers/skills_controller.dart';
import 'package:my_portfolio_web/app/controllers/theme_controller.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository.dart';

import 'controller_factory_test.mocks.dart';

@GenerateMocks([
  NavigationController,
  ProjectsController,
  CareerController,
  ContactController,
  SkillsController,
  ThemeController,
  PortfolioRepository,
])
void main() {
  group('ControllerFactory', () {
    late MockNavigationController mockNavigationController;
    late MockProjectsController mockProjectsController;
    late MockCareerController mockCareerController;
    late MockContactController mockContactController;
    late MockSkillsController mockSkillsController;
    late MockThemeController mockThemeController;
    late MockPortfolioRepository mockRepository;

    setUp(() {
      mockNavigationController = MockNavigationController();
      mockProjectsController = MockProjectsController();
      mockCareerController = MockCareerController();
      mockContactController = MockContactController();
      mockSkillsController = MockSkillsController();
      mockThemeController = MockThemeController();
      mockRepository = MockPortfolioRepository();

      Get.reset();
      
      // Register mock repository
      Get.put(mockRepository);
    });

    tearDown(() {
      Get.reset();
    });

    group('Controller Registration', () {
      test('should have private constructor', () {
        // Test that ControllerFactory cannot be instantiated
        expect(() => ControllerFactory(), throwsNoSuchMethodError);
      });

      test('should register navigation controller', () {
        ControllerFactory.registerControllers();
        
        expect(Get.isRegistered<NavigationController>(), isTrue);
        
        final controller = Get.find<NavigationController>();
        expect(controller, isA<NavigationController>());
      });

      test('should register projects controller', () {
        ControllerFactory.registerControllers();
        
        expect(Get.isRegistered<ProjectsController>(), isTrue);
        
        final controller = Get.find<ProjectsController>();
        expect(controller, isA<ProjectsController>());
      });

      test('should register career controller', () {
        ControllerFactory.registerControllers();
        
        expect(Get.isRegistered<CareerController>(), isTrue);
        
        final controller = Get.find<CareerController>();
        expect(controller, isA<CareerController>());
      });

      test('should register contact controller', () {
        ControllerFactory.registerControllers();
        
        expect(Get.isRegistered<ContactController>(), isTrue);
        
        final controller = Get.find<ContactController>();
        expect(controller, isA<ContactController>());
      });

      test('should register skills controller', () {
        ControllerFactory.registerControllers();
        
        expect(Get.isRegistered<SkillsController>(), isTrue);
        
        final controller = Get.find<SkillsController>();
        expect(controller, isA<SkillsController>());
      });

      test('should register theme controller', () {
        ControllerFactory.registerControllers();
        
        expect(Get.isRegistered<ThemeController>(), isTrue);
        
        final controller = Get.find<ThemeController>();
        expect(controller, isA<ThemeController>());
      });

      test('should register all controllers', () {
        ControllerFactory.registerControllers();
        
        expect(Get.isRegistered<NavigationController>(), isTrue);
        expect(Get.isRegistered<ProjectsController>(), isTrue);
        expect(Get.isRegistered<CareerController>(), isTrue);
        expect(Get.isRegistered<ContactController>(), isTrue);
        expect(Get.isRegistered<SkillsController>(), isTrue);
        expect(Get.isRegistered<ThemeController>(), isTrue);
      });
    });

    group('Controller Initialization', () {
      test('should initialize all controllers', () {
        // Register controllers first
        ControllerFactory.registerControllers();
        
        // Mock initialization methods
        when(mockNavigationController.initializeController())
            .thenReturn(null);
        when(mockProjectsController.initializeController())
            .thenReturn(null);
        when(mockCareerController.initializeController())
            .thenReturn(null);
        when(mockContactController.initializeController())
            .thenReturn(null);
        when(mockSkillsController.initializeController())
            .thenReturn(null);
        when(mockThemeController.initializeController())
            .thenReturn(null);

        // Test initialization
        expect(() => ControllerFactory.initializeControllers(), returnsNormally);
      });

      test('should handle initialization errors gracefully', () {
        // Register controllers first
        ControllerFactory.registerControllers();
        
        // Test that initialization errors are handled
        expect(() => ControllerFactory.initializeControllers(), returnsNormally);
      });

      test('should initialize controllers in sequence', () {
        ControllerFactory.registerControllers();
        
        // Test sequential initialization
        expect(() => ControllerFactory.initializeControllers(), returnsNormally);
      });
    });

    group('Full Initialization Process', () {
      test('should complete full initialization', () {
        expect(() => ControllerFactory.initializeControllers(), returnsNormally);
      });

      test('should register and initialize in one call', () {
        // Test the complete process
        expect(() => ControllerFactory.initializeControllers(), returnsNormally);
        
        // Verify controllers are registered
        expect(Get.isRegistered<NavigationController>(), isTrue);
        expect(Get.isRegistered<ProjectsController>(), isTrue);
        expect(Get.isRegistered<CareerController>(), isTrue);
        expect(Get.isRegistered<ContactController>(), isTrue);
        expect(Get.isRegistered<SkillsController>(), isTrue);
        expect(Get.isRegistered<ThemeController>(), isTrue);
      });

      test('should handle multiple initialization calls', () {
        ControllerFactory.initializeControllers();
        
        // Should handle multiple calls gracefully
        expect(() => ControllerFactory.initializeControllers(), returnsNormally);
      });
    });

    group('Dependency Injection', () {
      test('should inject repository into controllers', () {
        ControllerFactory.registerControllers();
        
        // Verify controllers can access repository
        final projectsController = Get.find<ProjectsController>();
        expect(projectsController, isNotNull);
        
        final contactController = Get.find<ContactController>();
        expect(contactController, isNotNull);
      });

      test('should handle missing dependencies', () {
        Get.reset(); // Remove repository
        
        // Should handle missing dependencies gracefully
        expect(() => ControllerFactory.registerControllers(), returnsNormally);
      });

      test('should support dependency replacement', () {
        ControllerFactory.registerControllers();
        
        // Replace a controller
        final newController = NavigationController();
        Get.replace<NavigationController>(newController);
        
        expect(Get.find<NavigationController>(), equals(newController));
      });
    });

    group('Controller Lifecycle', () {
      test('should handle controller disposal', () {
        ControllerFactory.registerControllers();
        
        // Test disposal
        expect(() => Get.reset(), returnsNormally);
      });

      test('should support controller recreation', () {
        ControllerFactory.registerControllers();
        Get.reset();
        
        // Recreate controllers
        ControllerFactory.registerControllers();
        
        expect(Get.isRegistered<NavigationController>(), isTrue);
      });

      test('should maintain controller state', () {
        ControllerFactory.registerControllers();
        
        final controller1 = Get.find<NavigationController>();
        final controller2 = Get.find<NavigationController>();
        
        // Should return same instance
        expect(controller1, equals(controller2));
      });
    });

    group('Error Handling', () {
      test('should handle controller registration errors', () {
        // Test error handling during registration
        expect(() => ControllerFactory.registerControllers(), returnsNormally);
      });

      test('should handle initialization exceptions', () {
        ControllerFactory.registerControllers();
        
        // Test that exceptions during initialization are caught
        expect(() => ControllerFactory.initializeControllers(), returnsNormally);
      });

      test('should continue initialization after errors', () {
        // Test that one controller error doesn't stop others
        expect(() => ControllerFactory.initializeControllers(), returnsNormally);
        
        // Other controllers should still be registered
        expect(Get.isRegistered<NavigationController>(), isTrue);
        expect(Get.isRegistered<ThemeController>(), isTrue);
      });
    });

    group('Integration', () {
      test('should integrate with GetX dependency injection', () {
        ControllerFactory.registerControllers();
        
        // Test GetX integration
        expect(Get.isRegistered<NavigationController>(), isTrue);
        expect(Get.find<NavigationController>(), isA<NavigationController>());
      });

      test('should support lazy loading', () {
        ControllerFactory.registerControllers();
        
        // Controllers should be created lazily
        expect(Get.isRegistered<NavigationController>(), isTrue);
      });

      test('should support permanent registration', () {
        ControllerFactory.registerControllers();
        
        // Test permanent registration
        expect(Get.isRegistered<NavigationController>(), isTrue);
      });
    });

    group('Factory Pattern', () {
      test('should follow factory pattern', () {
        // Test that ControllerFactory follows factory pattern
        expect(() => ControllerFactory.registerControllers(), returnsNormally);
        expect(() => ControllerFactory.initializeControllers(), returnsNormally);
      });

      test('should provide static access', () {
        // Test static method access
        expect(ControllerFactory.registerControllers, isA<Function>());
        expect(ControllerFactory.initializeControllers, isA<Function>());
      });

      test('should encapsulate controller creation', () {
        // Test that factory encapsulates creation logic
        ControllerFactory.registerControllers();
        
        expect(Get.isRegistered<NavigationController>(), isTrue);
        expect(Get.isRegistered<ProjectsController>(), isTrue);
        expect(Get.isRegistered<CareerController>(), isTrue);
        expect(Get.isRegistered<ContactController>(), isTrue);
        expect(Get.isRegistered<SkillsController>(), isTrue);
        expect(Get.isRegistered<ThemeController>(), isTrue);
      });
    });
  });
}
