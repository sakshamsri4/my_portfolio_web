import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/common/ui/neo_pop_social_button.dart';
import 'package:my_portfolio_web/app/data/models/tech_stack_item.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:my_portfolio_web/app/modules/home/widgets/social_sidebar.dart';

// Simple mock class for testing
class _MockHomeController extends GetxController implements HomeController {
  @override
  RxString activeSection = 'home'.obs;

  @override
  List<String> animatedGreetings = [];

  @override
  List<String> animatedIntroductions = [];

  @override
  List<String> designPhilosophyQuotes = [];

  @override
  GlobalKey aboutKey = GlobalKey();

  @override
  GlobalKey careerKey = GlobalKey();

  @override
  GlobalKey contactKey = GlobalKey();

  @override
  List<Map<String, String>> careerTimeline = [];

  @override
  Map<String, String> contactInfo = {};

  @override
  void copyToClipboard(String text) {}

  @override
  Future<void> downloadCV() async {}

  @override
  GlobalKey educationKey = GlobalKey();

  @override
  List<Map<String, String>> educationInfo = [];

  @override
  String fallbackImageUrl = 'assets/images/placeholder.jpg';

  @override
  RxBool isCarouselPlaying = true.obs;

  @override
  Future<void> launchEmail() async {}

  @override
  Future<void> launchProjectUrl(String url) async {}

  @override
  Future<void> launchWhatsApp() async {}

  @override
  String professionalSummary = '';

  @override
  GlobalKey projectsKey = GlobalKey();

  @override
  List<Map<String, String>> projects = [];

  @override
  ScrollController scrollController = ScrollController();

  @override
  void scrollToSection(String section) {}

  @override
  GlobalKey skillsKey = GlobalKey();

  @override
  List<Map<String, dynamic>> skillCategories = [];

  @override
  Map<String, Map<String, dynamic>> socialLinks = {
    'linkedin': {'url': 'https://linkedin.com'},
    'github': {'url': 'https://github.com'},
    'twitter': {'url': 'https://twitter.com'},
    'whatsapp': {'url': 'https://whatsapp.com'},
  };

  @override
  List<TechStackItem> techStack = [];

  @override
  void toggleCarouselPlay() {}

  @override
  List<String> get skills => [];

  @override
  String getImageWithFallback(String imagePath) => imagePath;
}

void main() {
  late _MockHomeController controller;

  setUp(() {
    controller = _MockHomeController();
    Get.testMode = true;
  });

  tearDown(Get.reset);

  group('SocialSidebar', () {
    test('can be instantiated', () {
      // This is a simple test to verify the widget can be created
      final sidebar = SocialSidebar(controller: controller);
      expect(sidebar, isA<Widget>());
    });

    test('controller has required methods', () {
      expect(controller.launchProjectUrl, isA<Function>());
      expect(controller.launchWhatsApp, isA<Function>());
    });

    test('controller has social links', () {
      expect(controller.socialLinks, isA<Map<String, Map<String, dynamic>>>());
      expect(controller.socialLinks.containsKey('linkedin'), isTrue);
      expect(controller.socialLinks.containsKey('github'), isTrue);
      expect(controller.socialLinks.containsKey('twitter'), isTrue);
      expect(controller.socialLinks.containsKey('whatsapp'), isTrue);
    });

    testWidgets('SocialSidebar is hidden on mobile',
        (WidgetTester tester) async {
      // Set up a small screen size (mobile)
      tester.binding.window.physicalSizeTestValue = const Size(320, 600);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                SocialSidebar(controller: controller),
              ],
            ),
          ),
        ),
      );

      // Verify the sidebar is not visible (returns SizedBox.shrink)
      expect(find.byType(NeoPOPSocialButton), findsNothing);

      // Reset the screen size
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
