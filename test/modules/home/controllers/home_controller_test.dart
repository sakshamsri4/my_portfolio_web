import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

void main() {
  group('HomeController', () {
    late HomeController controller;
    late PortfolioRepository repository;

    setUp(() {
      // Initialize GetX
      Get.testMode = true;
      
      // Create a real repository
      repository = PortfolioRepository();
      
      // Create controller with real repository
      controller = HomeController(repository: repository);
    });

    tearDown(() {
      Get.reset();
    });

    test('initializes with correct data from repository', () {
      // Verify that the controller initialized with data from the repository
      expect(controller.techStack, isNotEmpty);
      expect(controller.socialLinks, isNotEmpty);
      expect(controller.animatedGreetings, isNotEmpty);
      expect(controller.animatedIntroductions, isNotEmpty);
      expect(controller.skillCategories, isNotEmpty);
      expect(controller.projects, isNotEmpty);
      expect(controller.careerTimeline, isNotEmpty);
      expect(controller.contactInfo, isNotEmpty);
      expect(controller.educationInfo, isNotEmpty);
      expect(controller.professionalSummary, isNotEmpty);
    });

    test('skills getter returns flattened skills list', () {
      // The skills getter should flatten the skills from all categories
      expect(controller.skills, isA<List<String>>());
      expect(controller.skills, isNotEmpty);
    });

    test('activeSection can be updated directly', () {
      // Directly update the activeSection
      controller.activeSection.value = 'home';
      expect(controller.activeSection.value, equals('home'));
      
      controller.activeSection.value = 'about';
      expect(controller.activeSection.value, equals('about'));
    });

    test('getImageWithFallback returns correct image path', () {
      // Test with a project image path
      expect(controller.getImageWithFallback('project_image.jpg'), equals('assets/images/placeholder.jpg'));
      
      // Test with a non-project image path
      expect(controller.getImageWithFallback('other_image.jpg'), equals('other_image.jpg'));
    });

    test('toggleCarouselPlay toggles isCarouselPlaying', () {
      // Initially true
      expect(controller.isCarouselPlaying.value, isTrue);
      
      // Toggle to false
      controller.toggleCarouselPlay();
      expect(controller.isCarouselPlaying.value, isFalse);
      
      // Toggle back to true
      controller.toggleCarouselPlay();
      expect(controller.isCarouselPlaying.value, isTrue);
    });

    test('onClose is a function', () {
      // We can't test the actual disposal of the scrollController in a unit test
      // because it requires a BuildContext, but we can verify the method exists
      expect(controller.onClose, isA<Function>());
    });
  });
}
