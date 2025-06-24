import 'package:get/get.dart';
import 'package:my_portfolio_web/app/common/constants/string_constants.dart';
import 'package:my_portfolio_web/app/common/utils/error_utils.dart';
import 'package:my_portfolio_web/app/controllers/base_controller.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository_interface.dart';
import 'package:url_launcher/url_launcher.dart';

/// Controller responsible for managing projects data and interactions
class ProjectsController extends BaseController {
  /// Creates a projects controller with the portfolio repository
  ProjectsController({PortfolioRepositoryInterface? repository})
      : _repository = repository ?? Get.find<PortfolioRepositoryInterface>();

  final PortfolioRepositoryInterface _repository;

  /// Observable for carousel auto-play
  final isCarouselPlaying = true.obs;

  /// Fallback image URL if project image is not found
  final String fallbackImageUrl = 'images/placeholder.jpg';

  // Projects list for carousel
  late final List<Map<String, String>> projects = _repository.getProjects();

  @override
  void initializeController() {
    // Initialize any resources needed for projects
  }

  @override
  void cleanupResources() {
    // Clean up any resources
  }

  /// Get image with fallback
  String getImageWithFallback(String imagePath) {
    // For empty project images, use the fallback
    if (imagePath.isEmpty || imagePath.contains('project')) {
      return fallbackImageUrl;
    }
    return imagePath;
  }

  /// Launch URL for a project
  Future<void> launchProjectUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ErrorUtils.showErrorSnackbar(
        'Error',
        AppStrings.errorLaunchingUrl,
      );
    }
  }

  /// Toggle carousel auto-play
  void toggleCarouselPlay() {
    isCarouselPlaying.value = !isCarouselPlaying.value;
  }
}
