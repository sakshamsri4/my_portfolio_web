import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/career_controller.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository_interface.dart';

void main() {
  group('CareerController', () {
    late CareerController careerController;
    late PortfolioRepositoryInterface repository;

    setUp(() {
      // Register the repository
      repository = PortfolioRepository();
      Get.put<PortfolioRepositoryInterface>(repository);

      // Create the controller with the repository
      careerController = CareerController(repository: repository);
    });

    tearDown(Get.reset);

    test('careerTimeline should be populated from repository', () {
      // Verify that careerTimeline is populated correctly
      expect(careerController.careerTimeline, isA<List<Map<String, String>>>());
      expect(careerController.careerTimeline, isNotEmpty);

      // Verify that careerTimeline matches repository data
      final repoTimeline = repository.getCareerTimeline();
      expect(
        careerController.careerTimeline.length,
        equals(repoTimeline.length),
      );

      // Check a few entries to ensure they match
      expect(
        careerController.careerTimeline.first['company'],
        equals(repoTimeline.first['company']),
      );
      expect(
        careerController.careerTimeline.last['company'],
        equals(repoTimeline.last['company']),
      );
    });

    test('educationInfo should be populated from repository', () {
      // Verify that educationInfo is populated correctly
      expect(careerController.educationInfo, isA<List<Map<String, String>>>());
      expect(careerController.educationInfo, isNotEmpty);

      // Verify that educationInfo matches repository data
      final repoEducation = repository.getEducationInfo();
      expect(
        careerController.educationInfo.length,
        equals(repoEducation.length),
      );

      // Check a few entries to ensure they match
      expect(
        careerController.educationInfo.first['institution'],
        equals(repoEducation.first['institution']),
      );
      expect(
        careerController.educationInfo.last['institution'],
        equals(repoEducation.last['institution']),
      );
    });

    test('professionalSummary should be populated from repository', () {
      // Verify that professionalSummary is populated correctly
      expect(careerController.professionalSummary, isA<String>());
      expect(careerController.professionalSummary, isNotEmpty);

      // Verify that professionalSummary matches repository data
      final repoSummary = repository.getProfessionalSummary();
      expect(careerController.professionalSummary, equals(repoSummary));
      expect(
        careerController.professionalSummary
            .contains('Experienced Mobile Application Developer'),
        isTrue,
      );
    });

    test('initializeController should not throw exceptions', () {
      // This method should complete without throwing exceptions
      expect(() => careerController.initializeController(), returnsNormally);
    });

    test('cleanupResources should not throw exceptions', () {
      // This method should complete without throwing exceptions
      expect(() => careerController.cleanupResources(), returnsNormally);
    });
  });
}
