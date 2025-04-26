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
      'Senior Flutter Developer',
      'Cross-Platform Expert',
      'Mobile Architecture Specialist',
      'UI/UX Craftsman',
      'AI Integration Engineer',
    ];
  }

  @override

  /// Get animated introduction texts
  List<String> getAnimatedIntroductions() {
    return [
      'Crafting pixel-perfect, blazing-fast mobile experiences\nthat captivate and delight users.',
      'Transforming complex business challenges into\nintuitive, elegant mobile solutions since 2019.',
      'Specializing in Flutter architecture that scales\nfrom startup MVPs to enterprise-grade applications.',
      'Blending cutting-edge AI capabilities with\nbeautiful interfaces for next-gen mobile experiences.',
      'Building apps that users rave about,\nwith 4.8+ star ratings across app stores.',
    ];
  }

  @override

  /// Get design philosophy quotes
  List<String> getDesignPhilosophyQuotes() {
    return [
      "Performance isn't just a feature, it's the foundation of exceptional UX",
      'The best mobile experiences are invisible—users focus on their goals, not the interface',
      'Great Flutter architecture balances code elegance with runtime efficiency',
      'Every millisecond of app startup time costs you user engagement',
      "Accessibility isn't optional—it's the mark of truly professional development",
      'The most impressive animations are the ones that enhance functionality, not distract from it',
      'Thoughtful error handling separates professional apps from amateur projects',
      'Mobile excellence is measured in the details users never consciously notice',
      'The best code is both maintainable by developers and delightful to users',
    ];
  }

  @override
  List<Map<String, dynamic>> getSkillCategories() {
    return [
      {
        'category': 'Flutter',
        'iconType': 'svg',
        'skills': [
          'Dart',
          'Widgets',
          'Animations',
          'Custom UI',
          'Responsive',
        ],
      },
      {
        'category': 'Mobile Development',
        'iconType': 'svg',
        'skills': [
          'Android',
          'iOS',
          'Material Design',
          'Cupertino',
          'Platform Channels',
        ],
      },
      {
        'category': 'State Management',
        'iconType': 'svg',
        'skills': [
          'GetX',
          'BLoC',
          'Provider',
          'Riverpod',
          'Streams',
        ],
      },
      {
        'category': 'Backend',
        'iconType': 'svg',
        'skills': [
          'Firebase',
          'REST API',
          'GraphQL',
          'Authentication',
          'Cloud Functions',
        ],
      },
      {
        'category': 'Database',
        'iconType': 'svg',
        'skills': [
          'Firestore',
          'Realtime DB',
          'Hive',
          'SQLite',
          'MongoDB',
        ],
      },
      {
        'category': 'UI/UX Design',
        'iconType': 'svg',
        'skills': [
          'Figma',
          'Prototyping',
          'Animations',
          'Micro-interactions',
          'Design Systems',
        ],
      },
      {
        'category': 'AI Integration',
        'iconType': 'svg',
        'skills': [
          'TensorFlow',
          'OpenAI API',
          'ML Models',
          'Computer Vision',
          'NLP',
        ],
      },
      {
        'category': 'AI Tools',
        'iconType': 'svg',
        'skills': [
          'GitHub Copilot',
          'Cursor',
          'Relay',
          'Claude',
          'ChatGPT',
        ],
      },
      {
        'category': 'DevOps',
        'iconType': 'svg',
        'skills': [
          'CI/CD',
          'GitHub Actions',
          'Codemagic',
          'Firebase Deploy',
          'App Distribution',
        ],
      },
      {
        'category': 'Testing',
        'iconType': 'svg',
        'skills': [
          'Unit Tests',
          'Widget Tests',
          'Integration Tests',
          'Mocking',
          'Test Coverage',
        ],
      },
      {
        'category': 'Performance',
        'iconType': 'svg',
        'skills': [
          'Profiling',
          'Memory Management',
          'App Size Reduction',
          'Render Optimization',
          'Frame Debugging',
        ],
      },
      {
        'category': 'Automation',
        'iconType': 'svg',
        'skills': [
          'Python',
          'Bash Scripting',
          'Fastlane',
          'Workflow Automation',
          'Build Scripts',
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
            'Led Flutter development for this 4.7-star wellness app serving 200K+ users. '
                'Architected a high-performance activity tracking system with 99.9% sync reliability '
                'and implemented an AI-powered health insights engine that increased user engagement by 35%. '
                'Optimized battery usage by 40% while maintaining GPS accuracy.',
        'image': 'assets/images/project1.jpg',
        'tileImage': 'assets/tile_images/John_hancock.webp',
        'url':
            'https://apps.apple.com/us/app/john-hancock-vitality/id1192577836',
      },
      {
        'title': 'Manulife Vitality App',
        'description': 'Engineered a fully WCAG 2.1 compliant bilingual health app '
            'that achieved a 4.8-star rating and 98% user retention. Implemented custom '
            'HealthKit integration that synced 15+ data types with 99.7% accuracy. '
            'Reduced crash rate to <0.1% while serving 150K+ Canadian users.',
        'image': 'assets/images/project2.jpg',
        'tileImage': 'assets/tile_images/manulife.webp',
        'url': 'https://apps.apple.com/ca/app/manulife-vitality/id1198760352',
      },
      {
        'title': 'Pro Ranked App',
        'description':
            'Architected and delivered a Flutter/Firebase EV charging platform in just 10 weeks, '
                'featuring real-time monitoring of 500+ charging stations with 99.99% uptime. '
                'Implemented a custom geospatial indexing system that reduced query times by 75% '
                'and a reactive UI that updates within 250ms of backend changes.',
        'image': 'assets/images/project3.jpg',
        'tileImage': 'assets/tile_images/pro_ranked.webp',
        'url': 'https://proranked.com',
      },
      {
        'title': 'OnSite Construction App',
        'description': 'Designed a robust offline-first Flutter architecture for construction sites '
            'with limited connectivity, achieving 100% data integrity across sync events. '
            r'Built a custom PDF generation engine for invoices that processed $2.5M in transactions '
            'monthly. Implemented a multilingual system supporting 6 languages with 99% translation accuracy.',
        'image': 'assets/images/project4.jpg',
        'tileImage': 'assets/tile_images/onsite.webp',
        'url':
            'https://play.google.com/store/apps/details?id=com.abeyaantrix.onsite',
      },
      {
        'title': 'eZHealth',
        'description': 'Developed a HIPAA-compliant healthcare platform with end-to-end encryption '
            'that securely manages 75K+ patient records. Engineered a telemedicine system '
            'that handled 1,000+ daily consultations with 99.8% connection reliability. '
            'Reduced app size by 40% while adding offline access to critical health data.',
        'image': 'assets/images/project5.jpg',
        'tileImage': 'assets/tile_images/ezHealth.webp',
        'url': 'https://play.google.com/store/apps/details?id='
            'com.zuelligpharma.ezhealth',
      },
      {
        'title': 'eZTrade App',
        'description': 'Built a high-performance Flutter app with native C++ modules that achieved '
            '60% faster data processing than the previous solution. Created a custom '
            'analytics dashboard that helped medical reps increase sales by 28%. '
            'Implemented an AI-powered recommendation engine with 92% accuracy for product targeting.',
        'image': 'assets/images/project6.jpg',
        'tileImage': 'assets/tile_images/ezTrade.webp',
        'url': 'https://play.google.com/store/apps/details?id='
            'com.zuelligpharma.eztrade',
      },
      {
        'title': 'Covid-19 App',
        'description': 'Rapidly developed and deployed a critical public health app in just 3 weeks '
            'during the pandemic. Engineered a data synchronization system that provided '
            'real-time statistics to 50K+ users with 99.5% accuracy. Implemented an '
            'emergency resource locator that helped users find testing and vaccination centers.',
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
            'Leading a team of 5 developers to architect and deliver wellness apps '
                'with 350K+ active users. Implemented CI/CD pipelines that reduced deployment '
                'time by 60% and introduced AI-powered health insights that increased '
                'user engagement by 35%. Achieved 99.9% crash-free sessions.',
      },
      {
        'company': 'SpaceVox Ltd.',
        'role': 'Flutter Developer',
        'period': 'Aug 2023 - Dec 2023',
        'description': 'Delivered the Pro Ranked EV charging platform in just 10 weeks, '
            'exceeding client expectations. Designed a custom geospatial system '
            'that reduced query times by 75% and implemented a reactive architecture '
            'that handled 10K+ simultaneous device connections with minimal latency.',
      },
      {
        'company': 'ABEYAANTRIX Tech',
        'role': 'Flutter Developer',
        'period': 'Jan 2023 - July 2023',
        'description': 'Engineered the OnSite construction app with a robust offline-first architecture '
            'that maintained 100% data integrity in challenging field conditions. '
            r'Developed a custom PDF invoice engine that processed $2.5M+ in monthly transactions '
            'and implemented a multilingual system supporting 6 languages with 99% accuracy.',
      },
      {
        'company': 'CBNITS',
        'role': 'Flutter Developer',
        'period': 'Jan 2021 - Dec 2022',
        'description': 'Built HIPAA-compliant healthcare platforms for Zuellig Pharma that securely '
            'managed 75K+ patient records with end-to-end encryption. Engineered a '
            'telemedicine system handling 1,000+ daily consultations and developed '
            'an AI-powered recommendation engine with 92% accuracy for product targeting.',
      },
      {
        'company': 'Wipro Tech',
        'role': 'Flutter Developer',
        'period': 'June 2019 - March 2020',
        'description': 'Rapidly developed and deployed a critical public health app in just 3 weeks '
            'during the early pandemic. Created a data synchronization system that provided '
            'real-time statistics to 50K+ users with 99.5% accuracy and implemented an '
            'emergency resource locator that became a vital tool for the community.',
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
    return 'Senior Mobile Application Architect with 6+ years of expertise in '
        'creating exceptional Flutter applications that consistently achieve 4.8+ '
        "star ratings. I've architected and delivered 15+ production apps across "
        'healthcare, fintech, and enterprise sectors, serving over 500,000 users globally. '
        '\n\nMy technical toolkit includes advanced Flutter state management (GetX, BLoC, '
        'Riverpod), comprehensive Firebase integration, and custom UI/UX development '
        "that balances aesthetic excellence with performance optimization. I've reduced "
        'app startup times by 40% and decreased memory usage by 35% through strategic '
        'architecture decisions and performance tuning. '
        '\n\nI excel at translating complex business requirements into elegant technical '
        'solutions, having successfully implemented real-time synchronization systems, '
        'offline-first architectures, and sophisticated data visualization components. '
        'My apps have passed rigorous security audits and compliance reviews for '
        'healthcare and financial applications. '
        "\n\nRecently, I've pioneered AI integration in mobile apps, implementing "
        'on-device ML models, computer vision features, and OpenAI API integrations '
        'that provide intelligent, context-aware experiences while maintaining privacy. '
        "I've also established robust CI/CD pipelines that reduced deployment time by 60% "
        'and automated 85% of the QA process. '
        "\n\nI'm passionate about creating mobile experiences that feel magical to users "
        'while solving real business problems through thoughtful architecture and '
        'attention to detail.';
  }
}
