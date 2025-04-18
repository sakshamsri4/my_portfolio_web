// Import dart:html conditionally only for web
// ignore: avoid_web_libraries_in_flutter
import 'dart:html'
    if (dart.library.io) 'package:my_portfolio_web/app/utils/html_stub.dart'
    as html;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';
import 'package:my_portfolio_web/app/common/constants/string_constants.dart';
import 'package:my_portfolio_web/app/common/utils/error_utils.dart';
import 'package:my_portfolio_web/app/controllers/base_controller.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository_interface.dart';
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
      ErrorUtils.showErrorSnackbar(
        'Error',
        AppStrings.errorLaunchingEmail,
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
      ErrorUtils.showErrorSnackbar(
        'Error',
        AppStrings.errorLaunchingWhatsApp,
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
        ..setAttribute('download', AppStrings.cvFileName)
        ..click();
    } else {
      // For mobile platforms, use a different approach
      // This is a placeholder - implement mobile download if needed
      ErrorUtils.showInfoSnackbar(
        'Download',
        AppStrings.cvDownloadWebOnly,
      );
    }
  }

  /// Copy to clipboard
  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ErrorUtils.showSuccessSnackbar(
      'Copied',
      AppStrings.copiedToClipboard,
    );
  }
}
