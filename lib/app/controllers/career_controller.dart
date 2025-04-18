import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/base_controller.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository_interface.dart';

/// Controller responsible for managing career and education data
class CareerController extends BaseController {
  /// Creates a career controller with the portfolio repository
  CareerController({PortfolioRepositoryInterface? repository})
      : _repository = repository ?? Get.find<PortfolioRepositoryInterface>();

  final PortfolioRepositoryInterface _repository;

  /// Career timeline data
  late final List<Map<String, String>> careerTimeline =
      _repository.getCareerTimeline();

  /// Education information
  late final List<Map<String, String>> educationInfo =
      _repository.getEducationInfo();

  /// Professional summary
  late final String professionalSummary = _repository.getProfessionalSummary();

  @override
  void initializeController() {
    // Initialize any resources needed for career data
  }

  @override
  void cleanupResources() {
    // Clean up any resources
  }
}
