import 'dart:html' as html;

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  // Skills list for carousel
  final skills = [
    'Flutter',
    'Dart',
    'Firebase',
    'GetX',
    'BLoC',
    'REST API',
    'Git',
  ];

  // Projects list for carousel
  final projects = [
    {
      'title': 'E-Commerce App',
      'description':
          'A mobile application for online shopping with user authentication and payment integration.',
      'image': 'assets/images/project1.jpg',
      'url': 'https://play.google.com/store',
    },
    {
      'title': 'Task Manager',
      'description':
          'A productivity app for managing tasks and projects with reminders.',
      'image': 'assets/images/project2.jpg',
      'url': 'https://play.google.com/store',
    },
    {
      'title': 'Weather App',
      'description':
          'Real-time weather forecasts with beautiful visualizations.',
      'image': 'assets/images/project3.jpg',
      'url': 'https://play.google.com/store',
    },
    {
      'title': 'Social Media App',
      'description': 'Connect with friends and share your moments.',
      'image': 'assets/images/project4.jpg',
      'url': 'https://play.google.com/store',
    },
  ];

  // Career timeline data
  final careerTimeline = [
    {
      'company': 'mPhatek',
      'role': 'Senior Flutter Developer',
      'period': '2022 - Present',
      'description':
          'Leading the mobile app development team, implementing new features, and optimizing app performance.',
    },
    {
      'company': 'SpaceVox',
      'role': 'Flutter Developer',
      'period': '2020 - 2022',
      'description':
          'Developed and maintained multiple Flutter applications for clients.',
    },
    {
      'company': 'CBNITS',
      'role': 'Mobile Developer',
      'period': '2018 - 2020',
      'description':
          'Worked on cross-platform mobile applications using Flutter and React Native.',
    },
    {
      'company': 'Wipro Tech',
      'role': 'Junior Developer',
      'period': '2016 - 2018',
      'description':
          'Started career as a junior developer working on web and mobile applications.',
    },
  ];

  // Contact information
  final contactInfo = {
    'email': 's.saksham@mufin.co.kr',
    'phone': '+91 1234567890',
    'location': 'India',
  };

  // Observable for carousel auto-play
  final isCarouselPlaying = true.obs;

  // Fallback image URL if project image is not found
  final String fallbackImageUrl = 'assets/images/placeholder.jpg';

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

  // Download CV
  void downloadCV() {
    // For web platform
    html.AnchorElement(
      href: 'assets/cv/CV_3April.pdf',
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
