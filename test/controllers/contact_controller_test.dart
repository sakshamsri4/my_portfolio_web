import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/contact_controller.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ContactController', () {
    late ContactController contactController;
    late PortfolioRepositoryInterface repository;

    setUp(() {
      // Register the repository
      repository = PortfolioRepository();
      Get.put<PortfolioRepositoryInterface>(repository);

      // Create the controller with the repository
      contactController = ContactController(repository: repository);
    });

    tearDown(Get.reset);

    test('contactInfo should be populated from repository', () {
      // Verify that contactInfo is populated correctly
      expect(contactController.contactInfo, isA<Map<String, String>>());
      expect(contactController.contactInfo, isNotEmpty);

      // Verify that contactInfo matches repository data
      final repoContactInfo = repository.getContactInfo();
      expect(
        contactController.contactInfo.length,
        equals(repoContactInfo.length),
      );

      // Check a few entries to ensure they match
      expect(
        contactController.contactInfo['email'],
        equals(repoContactInfo['email']),
      );
      expect(
        contactController.contactInfo['phone'],
        equals(repoContactInfo['phone']),
      );
    });

    test('socialLinks should be populated from repository', () {
      // Verify that socialLinks is populated correctly
      expect(
        contactController.socialLinks,
        isA<Map<String, Map<String, dynamic>>>(),
      );
      expect(contactController.socialLinks, isNotEmpty);

      // Verify that socialLinks matches repository data
      final repoSocialLinks = repository.getSocialLinks();
      expect(
        contactController.socialLinks.length,
        equals(repoSocialLinks.length),
      );

      // Check a few entries to ensure they match
      expect(
        contactController.socialLinks.containsKey('linkedin'),
        isTrue,
      );
      expect(
        contactController.socialLinks.containsKey('github'),
        isTrue,
      );
    });

    // Skip this test as it requires a GetMaterialApp context for snackbars
    test(
      'copyToClipboard should not throw exceptions',
      () {
        // Skip this test as it requires a GetMaterialApp context for snackbars
      },
      skip: 'Requires GetMaterialApp context for snackbars',
    );

    test('initializeController should not throw exceptions', () {
      // This method should complete without throwing exceptions
      expect(() => contactController.initializeController(), returnsNormally);
    });

    test('cleanupResources should not throw exceptions', () {
      // This method should complete without throwing exceptions
      expect(() => contactController.cleanupResources(), returnsNormally);
    });
  });
}
