// Import dart:html conditionally only for web
// ignore: avoid_web_libraries_in_flutter
import 'dart:html'
    if (dart.library.io) 'package:my_portfolio_web/app/utils/html_stub.dart'
    as html;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';
import 'package:my_portfolio_web/app/common/constants/string_constants.dart';
import 'package:my_portfolio_web/app/controllers/analytics_controller.dart';
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
  final contactKey = GlobalKey();
  final mobileKey = GlobalKey();
  final caseStudyKey = GlobalKey();
  final otherCaseKey = GlobalKey();
  final aiSkillsKey = GlobalKey();
  final aboutKey = GlobalKey();

  /// Active section
  final RxString activeSection = 'home'.obs;

  // Flagship case study
  late final Map<String, dynamic> flagshipCaseStudy =
      _repository.getFlagshipCaseStudy();

  // Mini AI demos
  late final List<Map<String, dynamic>> miniAIProjects =
      _repository.getMiniAIProjects();

  // AI skills
  late final List<String> aiSkills = _repository.getAISkills();

  // Mobile apps showcase
  late final List<Map<String, dynamic>> mobileAppsShowcase =
      _repository.getMobileAppsShowcase();

  // Other case studies short format
  late final List<Map<String, String>> otherCaseStudies = [
    {
      'title': 'Nudron',
      'problem': 'Realtime water metering for utilities teams.',
      'ownership': 'Built Android client, IoT data handling, and sync flows.',
      'tech': 'Flutter, Firebase, Realtime APIs',
      'link':
          'https://play.google.com/store/apps/details?id=com.nudron.water_meter2',
    },
    {
      'title': 'RailOps',
      'problem': 'Mobile control for rail operations.',
      'ownership': 'Led Flutter app with offline-first architecture.',
      'tech': 'Flutter, SQLite, Firebase',
      'link':
          'https://play.google.com/store/apps/details?id=com.biputri.railops',
    },
    {
      'title': 'OnSite',
      'problem': 'Field data capture and invoicing for construction.',
      'ownership': 'Engineered offline-first workflows and sync.',
      'tech': 'Flutter, Firebase, Local caching',
      'link': 'https://play.google.com/store/apps/details?id=com.app.onsite',
    },
  ];

  /// Contact information
  late final Map<String, String> contactInfo = _repository.getContactInfo();

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
        break;
      case 'mobile':
        key = mobileKey;
        break;
      case 'case_study':
        key = caseStudyKey;
        break;
      case 'other_cases':
        key = otherCaseKey;
        break;
      case 'ai_skills':
        key = aiSkillsKey;
        break;
      case 'contact':
        key = contactKey;
        break;
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
}
