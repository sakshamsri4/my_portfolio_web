import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/base_controller.dart';

/// Controller responsible for handling navigation and scrolling
class NavigationController extends BaseController {
  /// Scroll controller for the main page
  final ScrollController scrollController = ScrollController();

  /// Section keys for scrolling
  final aboutKey = GlobalKey();
  final educationKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final careerKey = GlobalKey();
  final contactKey = GlobalKey();

  /// Active section
  final RxString activeSection = 'home'.obs;

  /// Animated greeting texts
  final List<String> animatedGreetings = [
    'Hello!',
    'Namaste!',
    'Bonjour!',
    'Hola!',
    'Ciao!',
  ];

  /// Animated introduction texts
  final List<String> animatedIntroductions = [
    "I'm Saksham Srivastava",
    'Flutter Developer',
    'Mobile App Expert',
    'UI/UX Enthusiast',
  ];

  @override
  void initializeController() {
    // Initialize any resources needed for navigation
  }

  @override
  void cleanupResources() {
    scrollController.dispose();
  }

  /// Scroll to section
  void scrollToSection(String section) {
    GlobalKey? key;

    switch (section) {
      case 'about':
        key = aboutKey;
      case 'education':
        key = educationKey;
      case 'skills':
        key = skillsKey;
      case 'projects':
        key = projectsKey;
      case 'career':
        key = careerKey;
      case 'contact':
        key = contactKey;
      default:
        // Scroll to top for home
        scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
        activeSection.value = 'home';
        return;
    }

    if (key.currentContext != null) {
      activeSection.value = section;
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }
}
