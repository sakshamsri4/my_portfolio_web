import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';
import 'package:my_portfolio_web/app/data/models/tech_stack_item.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  /// Creates a home controller with the portfolio repository
  HomeController({PortfolioRepository? repository})
      : _repository = repository ?? PortfolioRepository();

  final PortfolioRepository _repository;

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

  // Scroll to section
  void scrollToSection(String section) {
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
    final emailUri = Uri(
      scheme: 'mailto',
      path: contactInfo['email'],
      queryParameters: {
        'subject': 'Contact from Portfolio Website',
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
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
  void downloadCV() {
    // For web platform
    html.AnchorElement(
      href: AppConstants.cvPath,
    )
      ..setAttribute('download', 'Saksham_Srivastava_CV.pdf')
      ..click();
  }

  // Launch URL
  Future<void> launchProjectUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
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
