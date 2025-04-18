import 'package:my_portfolio_web/app/data/models/tech_stack_item.dart';
import 'package:my_portfolio_web/app/data/repositories/repository_interface.dart';

/// Interface for portfolio data repository
abstract class PortfolioRepositoryInterface extends RepositoryInterface {
  /// Get tech stack items
  List<TechStackItem> getTechStack();

  /// Get social media links
  Map<String, Map<String, dynamic>> getSocialLinks();

  /// Get animated greeting texts
  List<String> getAnimatedGreetings();

  /// Get animated introduction texts
  List<String> getAnimatedIntroductions();

  /// Get skills categories
  List<Map<String, dynamic>> getSkillCategories();

  /// Get projects data
  List<Map<String, String>> getProjects();

  /// Get career timeline data
  List<Map<String, String>> getCareerTimeline();

  /// Get contact information
  Map<String, String> getContactInfo();

  /// Get education information
  List<Map<String, String>> getEducationInfo();

  /// Get professional summary
  String getProfessionalSummary();
}
