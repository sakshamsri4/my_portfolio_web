// Import dart:html conditionally only for web
// ignore: avoid_web_libraries_in_flutter
import 'dart:html'
    if (dart.library.io) 'package:my_portfolio_web/app/utils/html_stub.dart'
    as html;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';
import 'package:my_portfolio_web/app/common/constants/string_constants.dart';
import 'package:my_portfolio_web/app/controllers/analytics_controller.dart';
import 'package:my_portfolio_web/app/data/models/tech_stack_item.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  /// Creates a home controller with the portfolio repository
  HomeController({PortfolioRepository? repository})
      : _repository = repository ?? PortfolioRepository();

  final PortfolioRepository _repository;

  /// Analytics controller for tracking user interactions
  late final AnalyticsController _analyticsController;

  /// Scroll controller for the main page
  final ScrollController scrollController = ScrollController();

  /// Section keys for scrolling
  final aboutKey = GlobalKey();
  final educationKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final careerKey = GlobalKey();
  final contactKey = GlobalKey();

  /// Active section
  final RxString activeSection = 'home'.obs;

  /// Observable for carousel auto-play
  final isCarouselPlaying = true.obs;

  /// Tech stack items
  late final List<TechStackItem> techStack = _repository.getTechStack();

  /// Social media links
  late final Map<String, Map<String, dynamic>> socialLinks =
      _repository.getSocialLinks();

  /// Animated greeting texts
  late final List<String> animatedGreetings =
      _repository.getAnimatedGreetings();

  /// Animated introduction texts
  late final List<String> animatedIntroductions =
      _repository.getAnimatedIntroductions();

  /// Design philosophy quotes
  late final List<String> designPhilosophyQuotes =
      _repository.getDesignPhilosophyQuotes();
  // Skills organized by category
  late final List<Map<String, dynamic>> skillCategories =
      _repository.getSkillCategories();

  // Flat skills list for backward compatibility
  late final List<String> _cachedSkills = _computeSkills();
  List<String> get skills => _cachedSkills;

  // Compute skills once and cache the result
  List<String> _computeSkills() {
    final allSkills = <String>[];
    for (final category in skillCategories) {
      allSkills.addAll(category['skills']! as List<String>);
    }
    return allSkills;
  }

  // Projects list for carousel
  late final List<Map<String, String>> projects = _repository.getProjects();

  // Career timeline data
  late final List<Map<String, String>> careerTimeline =
      _repository.getCareerTimeline();

  /// Contact information
  late final Map<String, String> contactInfo = _repository.getContactInfo();

  // Education information
  late final List<Map<String, String>> educationInfo =
      _repository.getEducationInfo();

  // Professional summary
  late final String professionalSummary = _repository.getProfessionalSummary();

  @override
  void onInit() {
    super.onInit();
    _analyticsController = Get.find<AnalyticsController>();

    // Track initial page view
    _analyticsController.trackPageView('home');
  }

  // Scroll to section
  void scrollToSection(String section) {
    // Track navigation analytics
    _analyticsController.trackNavigationClick(section);
    GlobalKey? key;

    switch (section) {
      case 'about':
        key = aboutKey;
      case 'education':
        key = educationKey;
      case 'skills':
        key = skillsKey;
      case 'projects':
        key = projectsKey;
      case 'career':
        key = careerKey;
      case 'contact':
        key = contactKey;
      default:
        // Scroll to top for home
        scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
        activeSection.value = 'home';
        return;
    }

    if (key.currentContext != null) {
      activeSection.value = section;
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  // Observable for carousel auto-play is defined at the top

  // Fallback image URL if project image is not found
  final String fallbackImageUrl = 'assets/images/placeholder.jpg';

  // Get image with fallback
  String getImageWithFallback(String imagePath) {
    // For empty project images, use the fallback
    if (imagePath.contains('project')) {
      return fallbackImageUrl;
    }
    return imagePath;
  }

  // No need for empty onInit

  // Launch email client
  Future<void> launchEmail() async {
    // Track email contact interaction
    await _analyticsController.trackContactAction('email_click',
        method: 'email');

    final emailUri = Uri(
      scheme: 'mailto',
      path: contactInfo['email'],
      queryParameters: {
        'subject': 'Contact from Portfolio Website',
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
      // Track successful email launch
      await _analyticsController.trackContactAction('email_launched',
          method: 'email');
    } else {
      // Track email launch error
      await _analyticsController.trackError(
        errorType: 'email_launch_failed',
        errorMessage: 'Could not launch email client',
        context: 'home_controller',
      );
      Get.snackbar(
        'Error',
        'Could not launch email client',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Launch WhatsApp chat
  Future<void> launchWhatsApp() async {
    // Format phone number (remove any non-digit characters)
    final phoneNumber = contactInfo['phone']!.replaceAll(RegExp(r'\D'), '');

    // Create WhatsApp URL
    final whatsappUrl = Uri.parse('https://wa.me/$phoneNumber');

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar(
        'Error',
        'Could not launch WhatsApp',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// Download CV
  Future<void> downloadCV() async {
    // Track CV download attempt
    await _analyticsController.trackCVDownload(source: 'hero_section');

    // For web platform
    if (kIsWeb) {
      // Create a proper URL to the PDF file
      const cvUrl =
          'https://saksham-portfolio-ba828.web.app/${AppConstants.cvPath}';

      try {
        // Check if the browser is a mobile browser
        final userAgent = html.window.navigator.userAgent.toLowerCase();
        final isMobileBrowser = userAgent.contains('mobi') ||
            userAgent.contains('android') ||
            userAgent.contains('iphone') ||
            userAgent.contains('ipad');

        if (isMobileBrowser) {
          // For mobile browsers: Open the PDF in a new tab with a direct link to force download
          // This bypasses the download attribute which doesn't work well on mobile
          html.window.open(cvUrl, '_blank');

          // Show guidance to the user
          Get.snackbar(
            'Download Tip',
            'For mobile browsers: Use the browser menu to download the PDF after it opens',
            duration: const Duration(seconds: 5),
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          // Desktop browser approach - use download attribute
          final anchor = html.AnchorElement(href: cvUrl)
            ..target = '_blank'
            ..download = 'Saksham_CV.pdf'
            ..setAttribute('rel', 'noopener');

          // Add to DOM, click, and remove to trigger download
          html.document.body?.append(anchor);
          anchor
            ..click()
            ..remove();
        }
      } on Exception catch (e) {
        Get.snackbar(
          'Error',
          'Could not download CV. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
        debugPrint('Error downloading CV: $e');
      }
    } else {
      try {
        // Show loading indicator
        await Get.dialog<void>(
          const Center(child: CircularProgressIndicator()),
          barrierDismissible: false,
        );

        // Request storage permission on Android
        if (Platform.isAndroid) {
          final status = await Permission.storage.request();
          if (!status.isGranted) {
            // Close loading dialog and show error
            Get.back<void>();
            // Cannot use cascade here because Get.back() returns void
            // ignore: cascade_invocations
            Get.snackbar(
              'Permission Denied',
              'Storage permission is required to download the CV',
              snackPosition: SnackPosition.BOTTOM,
            );
            return;
          }
        }

        // Get the download directory path
        final directory = Platform.isAndroid
            ? await getExternalStorageDirectory()
            : await getApplicationDocumentsDirectory();

        if (directory == null) {
          // Close loading dialog
          Get.back<void>();
          // Cannot use cascade here because Get.back() returns void
          // ignore: cascade_invocations
          Get.snackbar(
            'Error',
            'Could not access storage directory',
            snackPosition: SnackPosition.BOTTOM,
          );
          return;
        }

        final filePath = '${directory.path}/${AppStrings.cvFileName}';

        // Create a Dio instance
        final dio = Dio();

        // Download the file
        await dio.download(
          // Convert asset path to a network URL for mobile
          // This assumes your CV is also available at a public URL
          // If not, you'll need to bundle the CV with the app and copy it
          'https://saksham-portfolio-ba828.web.app/${AppConstants.cvPath}',
          filePath,
        );

        // Close loading dialog
        Get.back<void>();

        // Show success message with option to open the file
        await Get.dialog<void>(
          AlertDialog(
            title: const Text('Success'),
            content: const Text('CV downloaded successfully'),
            actions: [
              TextButton(
                onPressed: () => Get.back<void>(),
                child: const Text('Close'),
              ),
              TextButton(
                onPressed: () {
                  Get.back<void>();
                  OpenFile.open(filePath);
                },
                child: const Text('Open'),
              ),
            ],
          ),
        );
      } on DioException catch (e) {
        // Close loading dialog if open
        if (Get.isDialogOpen ?? false) Get.back<void>();

        // Show error message
        Get.snackbar(
          'Error',
          'Failed to download CV: ${e.message}',
          snackPosition: SnackPosition.BOTTOM,
        );
      } on Exception catch (e) {
        // Close loading dialog if open
        if (Get.isDialogOpen ?? false) Get.back<void>();

        // Show error message
        Get.snackbar(
          'Error',
          'Failed to download CV: $e',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  // Launch URL
  Future<void> launchProjectUrl(String url) async {
    // Track project URL click
    await _analyticsController.trackProjectClick(
      projectName: 'external_link',
      action: 'url_click',
    );

    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      // Track successful URL launch
      await _analyticsController.trackProjectClick(
        projectName: 'external_link',
        action: 'url_launched',
      );
    } else {
      // Track URL launch error
      await _analyticsController.trackError(
        errorType: 'url_launch_failed',
        errorMessage: 'Could not launch URL: $url',
        context: 'home_controller',
      );
      Get.snackbar(
        'Error',
        'Could not launch URL',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Copy to clipboard
  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    Get.snackbar(
      'Copied',
      'Text copied to clipboard',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  // Toggle carousel auto-play
  void toggleCarouselPlay() {
    isCarouselPlaying.value = !isCarouselPlaying.value;
  }
}
