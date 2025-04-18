// Import dart:html conditionally only for web
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';
import 'package:my_portfolio_web/app/controllers/base_controller.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository_interface.dart';
import 'package:my_portfolio_web/app/utils/html_stub.dart' as html;
import 'package:url_launcher/url_launcher.dart';

/// Controller responsible for managing contact information and actions
class ContactController extends BaseController {
  /// Creates a contact controller with the portfolio repository
  ContactController({PortfolioRepositoryInterface? repository})
      : _repository = repository ?? Get.find<PortfolioRepositoryInterface>();

  final PortfolioRepositoryInterface _repository;

  /// Contact information
  late final Map<String, String> contactInfo = _repository.getContactInfo();

  /// Social media links
  late final Map<String, Map<String, dynamic>> socialLinks =
      _repository.getSocialLinks();

  @override
  void initializeController() {
    // Initialize any resources needed for contact functionality
  }

  @override
  void cleanupResources() {
    // Clean up any resources
  }

  /// Launch email client
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

  /// Launch WhatsApp chat
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
    if (kIsWeb) {
      html.AnchorElement(
        href: AppConstants.cvPath,
      )
        ..setAttribute('download', 'Saksham_Srivastava_CV.pdf')
        ..click();
    } else {
      // For mobile platforms, use a different approach
      // This is a placeholder - implement mobile download if needed
      Get.snackbar(
        'Download',
        'CV download is only available on web platform',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// Copy to clipboard
  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    Get.snackbar(
      'Copied',
      'Text copied to clipboard',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }
}
