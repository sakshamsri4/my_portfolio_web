import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:my_portfolio_web/app/controllers/contact_controller.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository_interface.dart';

class MockPortfolioRepository extends Mock
    implements PortfolioRepositoryInterface {
  @override
  Map<String, String> getContactInfo() => {
        'email': 'test@example.com',
        'phone': '+1234567890',
        'location': 'Test City, Country',
      };

  @override
  Map<String, Map<String, dynamic>> getSocialLinks() => {
        'linkedin': {'url': 'https://linkedin.com/test'},
        'github': {'url': 'https://github.com/test'},
        'twitter': {'url': 'https://twitter.com/test'},
        'whatsapp': {'url': 'https://whatsapp.com'},
      };
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ContactController controller;
  late MockPortfolioRepository mockRepository;

  setUp(() {
    mockRepository = MockPortfolioRepository();
    Get.testMode = true;

    // Register the mock repository
    Get.put<PortfolioRepositoryInterface>(mockRepository);

    // Create the controller
    controller = ContactController(repository: mockRepository);
  });

  tearDown(Get.reset);

  group('ContactController Initialization', () {
    test('contactInfo should be populated from repository', () {
      expect(controller.contactInfo, equals(mockRepository.getContactInfo()));
      expect(controller.contactInfo['email'], equals('test@example.com'));
      expect(controller.contactInfo['phone'], equals('+1234567890'));
      expect(controller.contactInfo['location'], equals('Test City, Country'));
    });

    test('socialLinks should be populated from repository', () {
      expect(controller.socialLinks, equals(mockRepository.getSocialLinks()));
      expect(controller.socialLinks['linkedin'], isNotNull);
      expect(controller.socialLinks['github'], isNotNull);
      expect(controller.socialLinks['twitter'], isNotNull);
      expect(controller.socialLinks['whatsapp'], isNotNull);

      expect(
        controller.socialLinks['linkedin']?['url'],
        equals('https://linkedin.com/test'),
      );
      expect(
        controller.socialLinks['github']?['url'],
        equals('https://github.com/test'),
      );
      expect(
        controller.socialLinks['twitter']?['url'],
        equals('https://twitter.com/test'),
      );
      expect(
        controller.socialLinks['whatsapp']?['url'],
        equals('https://whatsapp.com'),
      );
    });
  });

  group('ContactController Methods', () {
    test('initializeController should not throw exceptions', () {
      expect(() => controller.initializeController(), returnsNormally);
    });

    test('cleanupResources should not throw exceptions', () {
      expect(() => controller.cleanupResources(), returnsNormally);
    });

    test('launchEmail is a function', () {
      expect(controller.launchEmail, isA<Function>());
    });

    test('launchWhatsApp is a function', () {
      expect(controller.launchWhatsApp, isA<Function>());
    });

    test('downloadCV is a function', () {
      expect(controller.downloadCV, isA<Function>());
    });

    test('copyToClipboard is a function', () {
      expect(controller.copyToClipboard, isA<Function>());
    });
  });

  group('ContactController Phone Number Formatting', () {
    test('contactInfo contains phone number', () {
      // We can't directly test the phone number formatting in launchWhatsApp
      // without mocking url_launcher, but we can verify the method exists
      // and that the controller has access to the phone number
      expect(controller.contactInfo['phone'], isNotNull);
      expect(controller.launchWhatsApp, isA<Function>());
    });
  });
}
