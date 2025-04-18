import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  // Scroll controllers for each section
  final ScrollController scrollController = ScrollController();

  // Section keys for scrolling
  final aboutKey = GlobalKey();
  final educationKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final careerKey = GlobalKey();
  final contactKey = GlobalKey();

  // Active section
  final RxString activeSection = 'home'.obs;

  // Observable for carousel auto-play
  final isCarouselPlaying = true.obs;
  // Skills organized by category
  final skillCategories = [
    {
      'category': 'Mobile Development',
      'iconType': 'svg',
      'skills': [
        'Flutter',
        'Dart',
        'Android',
        'iOS',
        'Responsive Layouts',
        'Material Design',
      ],
    },
    {
      'category': 'State Management',
      'iconType': 'svg',
      'skills': [
        'GetX',
        'BLoC',
        'Provider',
        'MVC',
        'MVVM',
      ],
    },
    {
      'category': 'Backend & Database',
      'iconType': 'svg',
      'skills': [
        'Firebase',
        'Firestore',
        'Authentication',
        'Realtime Database',
        'REST API',
        'Hive',
      ],
    },
    {
      'category': 'Tools & Workflow',
      'iconType': 'svg',
      'skills': [
        'Git',
        'GitHub',
        'BitBucket',
        'Android Studio',
        'VS Code',
        'Unit Testing',
        'Widget Testing',
      ],
    },
  ];

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
  final projects = [
    {
      'title': 'John Hancock Vitality App',
      'description':
          'A wellness app for tracking fitness activities, logging workouts via GPS, and managing Vitality Points™ with personalized health insights and rewards.',
      'image': 'assets/images/project1.jpg',
      'url': 'https://apps.apple.com/us/app/john-hancock-vitality/id1192577836',
    },
    {
      'title': 'Manulife Vitality App',
      'description':
          'A bilingual (English and French) health-focused app with accessibility features, enabling activity tracking, Apple Health integration, and rewards through personalized goals.',
      'image': 'assets/images/project2.jpg',
      'url': 'https://apps.apple.com/ca/app/manulife-vitality/id1198760352',
    },
    {
      'title': 'Pro Ranked App',
      'description':
          'Developed app and business portal using Flutter, Firebase, and FlutterFlow with bilingual support, enabling real-time EV charger management and personalized settings.',
      'image': 'assets/images/project3.jpg',
      'url': 'https://proranked.com',
    },
    {
      'title': 'OnSite Construction App',
      'description':
          'A Flutter-based app for construction professionals, featuring project management, invoicing, expense tracking, offline access, and multilingual support.',
      'image': 'assets/images/project4.jpg',
      'url':
          'https://play.google.com/store/apps/details?id=com.abeyaantrix.onsite',
    },
    {
      'title': 'eZHealth',
      'description':
          'A cross-platform healthcare app for Zuellig Pharma using Flutter, enabling online consultations, vaccination bookings, lab scheduling, and personal health record management.',
      'image': 'assets/images/project5.jpg',
      'url':
          'https://play.google.com/store/apps/details?id=com.zuelligpharma.ezhealth',
    },
    {
      'title': 'eZTrade App',
      'description':
          'A cross-platform app for medical representatives using Flutter, GoLang, and C++, featuring real-time product status, activity management, and progress tracking tools.',
      'image': 'assets/images/project6.jpg',
      'url':
          'https://play.google.com/store/apps/details?id=com.zuelligpharma.eztrade',
    },
    {
      'title': 'Covid-19 App',
      'description':
          'A Flutter-based app providing real-time updates, health guidance, and emergency resources with global and local statistics, news from health organizations, and symptom checkers.',
      'image': 'assets/images/project7.jpg',
      'url': 'https://github.com/sakshamsri4/Covid-19-App',
    },
  ];

  // Career timeline data
  final careerTimeline = [
    {
      'company': 'mPhatek Systems',
      'role': 'Senior Flutter Developer',
      'period': 'March 2024 - Present',
      'description':
          'Developing wellness apps including John Hancock Vitality and Manulife Vitality with features for tracking fitness activities, health integration, and rewards systems.',
    },
    {
      'company': 'SpaceVox Ltd.',
      'role': 'Flutter Developer',
      'period': 'Aug 2023 - Dec 2023',
      'description':
          'Developed Pro Ranked app and business portal using Flutter, Firebase, and FlutterFlow with bilingual support for EV charger management.',
    },
    {
      'company': 'ABEYAANTRIX Tech',
      'role': 'Flutter Developer',
      'period': 'Jan 2023 - July 2023',
      'description':
          'Built the OnSite Flutter-based app for construction professionals with project management, invoicing, and offline capabilities.',
    },
    {
      'company': 'CBNITS',
      'role': 'Flutter Developer',
      'period': 'Jan 2021 - Dec 2022',
      'description':
          'Developed healthcare apps for Zuellig Pharma including eZHealth and eZTrade using Flutter with various backend integrations.',
    },
    {
      'company': 'Wipro Tech',
      'role': 'Flutter Developer',
      'period': 'June 2019 - March 2020',
      'description':
          'Developed a Flutter-based Covid-19 App providing real-time updates, health guidance, and emergency resources during the pandemic.',
    },
  ];

  // Contact information
  final contactInfo = {
    'email': 'sakshamsri4@gmail.com',
    'phone': '+91 8795304811',
    'location': 'Bangalore, India',
  };

  // Education information
  final educationInfo = [
    {
      'institution': 'Amity University, Noida',
      'degree': 'B.Tech in Information Technology',
      'period': '2015 - 2019',
    },
    {
      'institution': 'Saint Ann College',
      'degree': 'ISC (12th)',
      'period': '2013 - 2014',
    },
    {
      'institution': 'Saint Ann College',
      'degree': 'ICSE (10th)',
      'period': '2010 - 2011',
    },
  ];

  // Professional summary
  final professionalSummary =
      'Experienced Mobile Application Developer with 6+ years in designing and deploying scalable, user-focused applications. Proficient in Flutter SDK for cross-platform development, Firebase (Firestore, Authentication, Realtime Database), and advanced UI/UX principles including Material Design and responsive layouts. Adept at integrating REST APIs, implementing BLoC architecture for state management, and delivering high-performance solutions with CI/CD pipelines. Enthusiastic about leveraging innovative technologies to drive efficiency and enhance user experiences.';

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
