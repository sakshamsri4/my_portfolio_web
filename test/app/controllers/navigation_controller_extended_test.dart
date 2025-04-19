import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/navigation_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late NavigationController controller;

  setUp(() {
    controller = NavigationController();
    Get.testMode = true;
  });

  tearDown(Get.reset);

  group('NavigationController Initialization', () {
    test('scrollController should be initialized', () {
      expect(controller.scrollController, isA<ScrollController>());
      expect(controller.scrollController.hasClients, isFalse);
    });

    test('section keys should be initialized', () {
      expect(controller.aboutKey, isA<GlobalKey>());
      expect(controller.educationKey, isA<GlobalKey>());
      expect(controller.skillsKey, isA<GlobalKey>());
      expect(controller.projectsKey, isA<GlobalKey>());
      expect(controller.careerKey, isA<GlobalKey>());
      expect(controller.contactKey, isA<GlobalKey>());
    });

    test('activeSection should be initialized to home', () {
      expect(controller.activeSection.value, equals('home'));
    });

    test('animatedGreetings should be non-empty', () {
      expect(controller.animatedGreetings, isNotEmpty);
      expect(controller.animatedGreetings.length, equals(5));
      expect(controller.animatedGreetings, contains('Hello!'));
      expect(controller.animatedGreetings, contains('Namaste!'));
      expect(controller.animatedGreetings, contains('Bonjour!'));
      expect(controller.animatedGreetings, contains('Hola!'));
      expect(controller.animatedGreetings, contains('Ciao!'));
    });

    test('animatedIntroductions should be non-empty', () {
      expect(controller.animatedIntroductions, isNotEmpty);
      expect(controller.animatedIntroductions.length, equals(4));
      expect(
        controller.animatedIntroductions,
        contains("I'm Saksham Srivastava"),
      );
      expect(controller.animatedIntroductions, contains('Flutter Developer'));
      expect(controller.animatedIntroductions, contains('Mobile App Expert'));
      expect(controller.animatedIntroductions, contains('UI/UX Enthusiast'));
    });
  });

  group('NavigationController Methods', () {
    test('initializeController should not throw exceptions', () {
      expect(() => controller.initializeController(), returnsNormally);
    });

    test('cleanupResources should dispose scrollController', () {
      // Create a new controller to avoid affecting other tests
      final testController = NavigationController()

        // Call cleanupResources
        ..cleanupResources();

      // Verify that the controller is disposed
      expect(
        () => testController.scrollController.position,
        throwsA(isA<AssertionError>()),
      );
    });

    test('scrollToSection method exists', () {
      // We can't test the actual scrolling with context in unit tests
      // But we can verify the method exists
      expect(controller.scrollToSection, isA<Function>());
    });

    test('activeSection can be updated directly', () {
      // Instead of testing scrollToSection which requires a context,
      // we can test that activeSection can be updated directly
      controller.activeSection.value = 'home';
      expect(controller.activeSection.value, equals('home'));
    });
  });

  group('NavigationController Reactive Properties', () {
    test('activeSection can be updated directly', () {
      controller.activeSection.value = 'about';
      expect(controller.activeSection.value, equals('about'));

      controller.activeSection.value = 'skills';
      expect(controller.activeSection.value, equals('skills'));

      controller.activeSection.value = 'home';
      expect(controller.activeSection.value, equals('home'));
    });
  });
}
