import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/theme_controller.dart';
import 'package:my_portfolio_web/app/data/models/tech_stack_item.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

class MockThemeController extends GetxController implements ThemeController {
  final Rx<ThemeMode> _themeMode = ThemeMode.light.obs;

  @override
  Rx<ThemeMode> get themeMode => _themeMode;

  @override
  void toggleTheme() {
    _themeMode.value =
        _themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  bool get isDarkMode => _themeMode.value == ThemeMode.dark;

  @override
  void initializeController() {}

  @override
  void cleanupResources() {}
}

class MockHomeController extends GetxController implements HomeController {
  @override
  final ScrollController scrollController = ScrollController();

  @override
  final aboutKey = GlobalKey();

  @override
  final educationKey = GlobalKey();

  @override
  final skillsKey = GlobalKey();

  @override
  final projectsKey = GlobalKey();

  @override
  final careerKey = GlobalKey();

  @override
  final contactKey = GlobalKey();

  @override
  final RxString activeSection = 'home'.obs;

  @override
  final isCarouselPlaying = true.obs;

  @override
  final List<TechStackItem> techStack = [];

  @override
  final Map<String, Map<String, dynamic>> socialLinks = {};

  @override
  final List<String> animatedGreetings = ['Hello', 'Hi', 'Welcome'];

  @override
  final List<String> animatedIntroductions = ['I am a Flutter Developer'];

  @override
  final List<String> designPhilosophyQuotes = ['Design is important'];

  @override
  final List<Map<String, dynamic>> skillCategories = [
    {
      'name': 'Flutter',
      'icon': Icons.flutter_dash,
      'skills': ['Flutter', 'Dart'],
    },
  ];

  @override
  List<String> get skills => ['Flutter', 'Dart', 'GetX'];

  @override
  final List<Map<String, String>> projects = [
    {
      'name': 'Test Project',
      'description': 'A test project',
      'url': 'https://example.com',
    },
  ];

  @override
  final List<Map<String, String>> careerTimeline = [
    {'company': 'Test Company', 'role': 'Developer', 'duration': '2020-2022'},
  ];

  @override
  final Map<String, String> contactInfo = {
    'email': 'test@example.com',
    'phone': '+1234567890',
  };

  @override
  final List<Map<String, String>> educationInfo = [
    {'degree': 'Test Degree', 'institution': 'Test University', 'year': '2020'},
  ];

  @override
  final String professionalSummary = 'Test professional summary';

  @override
  final String fallbackImageUrl = 'assets/images/placeholder.jpg';

  @override
  void scrollToSection(String section) {}

  @override
  String getImageWithFallback(String imagePath) => fallbackImageUrl;

  @override
  Future<void> launchEmail() async {}

  @override
  Future<void> launchWhatsApp() async {}

  @override
  Future<void> downloadCV() async {}

  @override
  Future<void> launchProjectUrl(String url) async {}

  @override
  void copyToClipboard(String text) {}

  @override
  void toggleCarouselPlay() {}
}
