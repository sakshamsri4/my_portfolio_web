import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';
import 'package:my_portfolio_web/app/data/models/tech_stack_item.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository_interface.dart';

/// Repository for portfolio data
class PortfolioRepository implements PortfolioRepositoryInterface {
  @override
  Future<void> initialize() async {
    // Initialize repository if needed
  }

  @override
  void dispose() {
    // Clean up resources if needed
  }

  @override

  /// Get the list of tech stack items
  List<TechStackItem> getTechStack() {
    return [
      // Mobile Development
      const TechStackItem(
        name: 'Flutter',
        svgName: 'Flutter',
        color: AppColors.flutter,
        iconType: IconType.svg,
      ),
      const TechStackItem(
        name: 'Dart',
        svgName: 'Dart',
        color: Color(0xFF0175C2),
        iconType: IconType.svg,
      ),
      const TechStackItem(
        name: 'Android',
        svgName: 'Android',
        color: AppColors.android,
        iconType: IconType.svg,
      ),
      const TechStackItem(
        name: 'iOS',
        svgName: 'Apple',
        color: AppColors.ios,
        iconType: IconType.svg,
      ),
      const TechStackItem(
        name: 'Xamarin',
        svgName: 'Xamarin',
        color: Color(0xFF3498DB),
        iconType: IconType.svg,
      ),

      // Backend & Cloud
      const TechStackItem(
        name: 'Firebase',
        svgName: 'Firebase',
        color: AppColors.firebase,
        iconType: IconType.svg,
      ),
      const TechStackItem(
        name: 'Node.js',
        svgName: 'Node.js',
        color: AppColors.nodejs,
        iconType: IconType.svg,
      ),
      const TechStackItem(
        name: 'Python',
        svgName: 'Python',
        color: Color(0xFF3776AB),
        iconType: IconType.svg,
      ),

      // AI & ML
      const TechStackItem(
        name: 'TensorFlow',
        svgName: 'TensorFlow',
        color: Color(0xFFFF6F00),
        iconType: IconType.svg,
      ),
      const TechStackItem(
        name: 'PyTorch',
        svgName: 'PyTorch',
        color: Color(0xFFEE4C2C),
        iconType: IconType.svg,
      ),
      const TechStackItem(
        name: 'Keras',
        svgName: 'Keras',
        color: Color(0xFFD00000),
        iconType: IconType.svg,
      ),

      // Web Development
      const TechStackItem(
        name: 'React',
        svgName: 'React',
        color: AppColors.react,
        iconType: IconType.svg,
      ),
      const TechStackItem(
        name: 'Next.js',
        svgName: 'Next.js',
        color: Color(0xFF000000),
        iconType: IconType.svg,
      ),
      const TechStackItem(
        name: 'Django',
        svgName: 'Django',
        color: Color(0xFF092E20),
        iconType: IconType.svg,
      ),

      // DevOps & Tools
      const TechStackItem(
        name: 'GitHub',
        svgName: 'GitHub',
        color: AppColors.github,
        iconType: IconType.svg,
      ),
      const TechStackItem(
        name: 'Docker',
        svgName: 'Docker',
        color: Color(0xFF2496ED),
        iconType: IconType.svg,
      ),
      const TechStackItem(
        name: 'CircleCI',
        svgName: 'CircleCI',
        color: Color(0xFF343434),
        iconType: IconType.svg,
      ),

      // Design
      const TechStackItem(
        name: 'Figma',
        svgName: 'Figma',
        color: Color(0xFFF24E1E),
        iconType: IconType.svg,
      ),
      const TechStackItem(
        name: 'Material UI',
        svgName: 'Material-UI',
        color: Color(0xFF0081CB),
        iconType: IconType.svg,
      ),

      // Database
      const TechStackItem(
        name: 'Database',
        icon: FontAwesomeIcons.database,
        color: AppColors.database,
      ),
    ];
  }

  @override

  /// Get social media links
  Map<String, Map<String, dynamic>> getSocialLinks() {
    return {
      'linkedin': {
        'url': AppConstants.linkedInUrl,
        'icon': FontAwesomeIcons.linkedin,
        'color': AppColors.linkedin,
      },
      'github': {
        'url': AppConstants.githubUrl,
        'icon': FontAwesomeIcons.github,
        'color': AppColors.github,
      },
      'twitter': {
        'url': AppConstants.twitterUrl,
        'icon': FontAwesomeIcons.xTwitter,
        'color': AppColors.twitter,
      },
      'whatsapp': {
        'icon': FontAwesomeIcons.whatsapp,
        'color': AppColors.whatsapp,
      },
    };
  }

  @override

  /// Get animated greeting texts
  List<String> getAnimatedGreetings() {
    return [
      'Flutter Developer',
      'Mobile App Specialist',
      'UI/UX Enthusiast',
    ];
  }

  @override

  /// Get animated introduction texts
  List<String> getAnimatedIntroductions() {
    return [
      'I create beautiful, high-performance mobile apps\nthat users love.',
      'With 6+ years of Flutter expertise, I transform\ncomplex ideas into elegant experiences.',
      'Let me help bring your app idea to life with\nflawless execution across platforms.',
    ];
  }

  @override
  List<Map<String, dynamic>> getSkillCategories() {
    return [
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
  }

  @override
  List<Map<String, String>> getProjects() {
    return [
      {
        'title': 'John Hancock Vitality App',
        'description':
            'A wellness app for tracking fitness activities, logging workouts '
                'via GPS, and managing Vitality Points™ with personalized health '
                'insights and rewards.',
        'image': 'assets/images/project1.jpg',
        'tileImage': 'assets/tile_images/John_hancock.webp',
        'url':
            'https://apps.apple.com/us/app/john-hancock-vitality/id1192577836',
      },
      {
        'title': 'Manulife Vitality App',
        'description': 'A bilingual (English and French) health-focused app with '
            'accessibility features, enabling activity tracking, Apple Health '
            'integration, and rewards through personalized goals.',
        'image': 'assets/images/project2.jpg',
        'tileImage': 'assets/tile_images/manulife.webp',
        'url': 'https://apps.apple.com/ca/app/manulife-vitality/id1198760352',
      },
      {
        'title': 'Pro Ranked App',
        'description':
            'Developed app and business portal using Flutter, Firebase, and '
                'FlutterFlow with bilingual support, enabling real-time EV charger '
                'management and personalized settings.',
        'image': 'assets/images/project3.jpg',
        'tileImage': 'assets/tile_images/pro_ranked.webp',
        'url': 'https://proranked.com',
      },
      {
        'title': 'OnSite Construction App',
        'description':
            'A Flutter-based app for construction professionals, featuring '
                'project management, invoicing, expense tracking, offline access, '
                'and multilingual support.',
        'image': 'assets/images/project4.jpg',
        'tileImage': 'assets/tile_images/onsite.webp',
        'url':
            'https://play.google.com/store/apps/details?id=com.abeyaantrix.onsite',
      },
      {
        'title': 'eZHealth',
        'description':
            'A cross-platform healthcare app for Zuellig Pharma using Flutter, '
                'enabling online consultations, vaccination bookings, lab scheduling, '
                'and personal health record management.',
        'image': 'assets/images/project5.jpg',
        'tileImage': 'assets/tile_images/ezHealth.webp',
        'url': 'https://play.google.com/store/apps/details?id='
            'com.zuelligpharma.ezhealth',
      },
      {
        'title': 'eZTrade App',
        'description':
            'A cross-platform app for medical representatives using Flutter, '
                'GoLang, and C++, featuring real-time product status, activity '
                'management, and progress tracking tools.',
        'image': 'assets/images/project6.jpg',
        'tileImage': 'assets/tile_images/ezTrade.webp',
        'url': 'https://play.google.com/store/apps/details?id='
            'com.zuelligpharma.eztrade',
      },
      {
        'title': 'Covid-19 App',
        'description':
            'A Flutter-based app providing real-time updates, health guidance, '
                'and emergency resources with global and local statistics, news '
                'from health organizations, and symptom checkers.',
        'image': 'assets/images/project7.jpg',
        'tileImage': 'assets/tile_images/covid.webp',
        'url': 'https://github.com/sakshamsri4/Covid-19-App',
      },
    ];
  }

  @override
  List<Map<String, String>> getCareerTimeline() {
    return [
      {
        'company': 'mPhatek Systems',
        'role': 'Senior Flutter Developer',
        'period': 'March 2024 - Present',
        'description':
            'Developing wellness apps including John Hancock Vitality and '
                'Manulife Vitality with features for tracking fitness activities, '
                'health integration, and rewards systems.',
      },
      {
        'company': 'SpaceVox Ltd.',
        'role': 'Flutter Developer',
        'period': 'Aug 2023 - Dec 2023',
        'description':
            'Developed Pro Ranked app and business portal using Flutter, '
                'Firebase, and FlutterFlow with bilingual support for EV charger '
                'management.',
      },
      {
        'company': 'ABEYAANTRIX Tech',
        'role': 'Flutter Developer',
        'period': 'Jan 2023 - July 2023',
        'description':
            'Built the OnSite Flutter-based app for construction professionals '
                'with project management, invoicing, and offline capabilities.',
      },
      {
        'company': 'CBNITS',
        'role': 'Flutter Developer',
        'period': 'Jan 2021 - Dec 2022',
        'description':
            'Developed healthcare apps for Zuellig Pharma including eZHealth '
                'and eZTrade using Flutter with various backend integrations.',
      },
      {
        'company': 'Wipro Tech',
        'role': 'Flutter Developer',
        'period': 'June 2019 - March 2020',
        'description':
            'Developed a Flutter-based Covid-19 App providing real-time updates, '
                'health guidance, and emergency resources during the pandemic.',
      },
    ];
  }

  @override
  Map<String, String> getContactInfo() {
    return {
      'email': AppConstants.emailAddress,
      'phone': AppConstants.phoneNumber,
      'location': 'Bangalore, India',
    };
  }

  @override
  List<Map<String, String>> getEducationInfo() {
    return [
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
  }

  @override
  String getProfessionalSummary() {
    return 'Experienced Mobile Application Developer with 6+ years in designing '
        'and deploying scalable, user-focused applications. Proficient in '
        'Flutter SDK for cross-platform development, Firebase (Firestore, '
        'Authentication, Realtime Database), and advanced UI/UX principles '
        'including Material Design and responsive layouts. Adept at integrating '
        'REST APIs, implementing BLoC architecture for state management, and '
        'delivering high-performance solutions with CI/CD pipelines. '
        'Enthusiastic about leveraging innovative technologies to drive '
        'efficiency and enhance user experiences.';
  }
}
