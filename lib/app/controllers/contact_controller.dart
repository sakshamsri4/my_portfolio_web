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
import 'package:my_portfolio_web/app/common/utils/error_utils.dart';
import 'package:my_portfolio_web/app/controllers/base_controller.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository_interface.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
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
  Future<void> downloadCV() async {
    // For web platform
    if (kIsWeb) {
      html.AnchorElement(
        href: AppConstants.cvPath,
      )
        ..setAttribute('download', AppStrings.cvFileName)
        ..click();
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
            // Close loading dialog
            Get.back<void>();
            ErrorUtils.showErrorSnackbar(
              'Permission Denied',
              'Storage permission is required to download the CV',
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
          ErrorUtils.showErrorSnackbar(
            'Error',
            'Could not access storage directory',
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
        ErrorUtils.showErrorSnackbar(
          'Error',
          'Failed to download CV: ${e.message}',
        );
      } on Exception catch (e) {
        // Close loading dialog if open
        if (Get.isDialogOpen ?? false) Get.back<void>();

        // Show error message
        ErrorUtils.showErrorSnackbar(
          'Error',
          'Failed to download CV: $e',
        );
      }
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
