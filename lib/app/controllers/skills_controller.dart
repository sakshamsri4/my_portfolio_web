import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/base_controller.dart';
import 'package:my_portfolio_web/app/data/models/tech_stack_item.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository_interface.dart';

/// Controller responsible for managing skills and tech stack data
class SkillsController extends BaseController {
  /// Creates a skills controller with the portfolio repository
  SkillsController({PortfolioRepositoryInterface? repository})
      : _repository = repository ?? Get.find<PortfolioRepositoryInterface>();

  final PortfolioRepositoryInterface _repository;

  /// Tech stack items
  late final List<TechStackItem> techStack = _repository.getTechStack();

  /// Skills organized by category
  late final List<Map<String, dynamic>> skillCategories =
      _repository.getSkillCategories();

  // Flat skills list for backward compatibility
  late final List<String> _cachedSkills = _computeSkills();

  /// Get all skills as a flat list
  List<String> get skills => _cachedSkills;

  // Compute skills once and cache the result
  List<String> _computeSkills() {
    final allSkills = <String>[];
    for (final category in skillCategories) {
      allSkills.addAll(category['skills']! as List<String>);
    }
    return allSkills;
  }

  @override
  void initializeController() {
    // Initialize any resources needed for skills data
  }

  @override
  void cleanupResources() {
    // Clean up any resources
  }
}
