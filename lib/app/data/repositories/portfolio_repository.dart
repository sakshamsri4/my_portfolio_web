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
      'Senior Mobile Architect',
      'Flutter Performance Expert',
      'Enterprise App Specialist',
      'Mobile AI Integration Lead',
      'Cross-Platform Strategist',
    ];
  }

  @override

  /// Get animated introduction texts
  List<String> getAnimatedIntroductions() {
    return [
      'Architecting high-performance Flutter apps\nserving 500K+ users with 99.9% crash-free sessions.',
      'Delivering enterprise-grade mobile solutions\nthat reduced app startup times by 40%.',
      'Leading teams that transformed complex requirements\ninto optimized apps with 4.8+ star ratings.',
      'Pioneering on-device ML and AI integrations\nthat increased user engagement by 35%.',
      'Engineering healthcare and fintech apps\nthat passed rigorous security audits and compliance reviews.',
    ];
  }

  @override

  /// Get design philosophy quotes
  List<String> getDesignPhilosophyQuotes() {
    return [
      "In mobile, performance isn't just a feature—it's the foundation of user retention",
      "Flutter's true power lies in composition: complex UIs from simple, reusable components",
      'The thumb zone dictates mobile UX success more than any design trend',
      'Stateful architecture decisions in Flutter determine both user experience and developer velocity',
      'The best mobile animations provide spatial context and improve usability, not just visual appeal',
      "Offline-first isn't a feature—it's the baseline for professional mobile applications",
      "Flutter's widget tree should mirror your mental model of the UI's logical structure",
      'Mobile excellence is measured in the milliseconds between user intent and app response',
      'The best Flutter code balances abstraction with performance at the widget level',
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
        'image': 'images/project1.jpg',
        'tileImage': 'tile_images/John_hancock.webp',
        'url':
            'https://apps.apple.com/us/app/john-hancock-vitality/id1192577836',
      },
      {
        'title': 'Manulife Vitality App',
        'description': 'Engineered a fully WCAG 2.1 compliant bilingual health app '
            'that achieved a 4.8-star rating and 98% user retention. Implemented custom '
            'HealthKit integration that synced 15+ data types with 99.7% accuracy. '
            'Reduced crash rate to <0.1% while serving 150K+ Canadian users.',
        'image': 'images/project2.jpg',
        'tileImage': 'tile_images/manulife.webp',
        'url': 'https://apps.apple.com/ca/app/manulife-vitality/id1198760352',
      },
      {
        'title': 'Pro Ranked App',
        'description':
            'Architected and delivered a Flutter/Firebase EV charging platform in just 10 weeks, '
                'featuring real-time monitoring of 500+ charging stations with 99.99% uptime. '
                'Implemented a custom geospatial indexing system that reduced query times by 75% '
                'and a reactive UI that updates within 250ms of backend changes.',
        'image': 'images/project3.jpg',
        'tileImage': 'tile_images/pro_ranked.webp',
        'url': 'https://proranked.com',
      },
      {
        'title': 'OnSite Construction App',
        'description': 'Designed a robust offline-first Flutter architecture for construction sites '
            'with limited connectivity, achieving 100% data integrity across sync events. '
            r'Built a custom PDF generation engine for invoices that processed $2.5M in transactions '
            'monthly. Implemented a multilingual system supporting 6 languages with 99% translation accuracy.',
        'image': 'images/project4.jpg',
        'tileImage': 'tile_images/onsite.webp',
        'url':
            'https://play.google.com/store/apps/details?id=com.abeyaantrix.onsite',
      },
      {
        'title': 'eZHealth',
        'description': 'Developed a HIPAA-compliant healthcare platform with end-to-end encryption '
            'that securely manages 75K+ patient records. Engineered a telemedicine system '
            'that handled 1,000+ daily consultations with 99.8% connection reliability. '
            'Reduced app size by 40% while adding offline access to critical health data.',
        'image': 'images/project5.jpg',
        'tileImage': 'tile_images/ezHealth.webp',
        'url': 'https://play.google.com/store/apps/details?id='
            'com.zuelligpharma.ezhealth',
      },
      {
        'title': 'eZTrade App',
        'description': 'Built a high-performance Flutter app with native C++ modules that achieved '
            '60% faster data processing than the previous solution. Created a custom '
            'analytics dashboard that helped medical reps increase sales by 28%. '
            'Implemented an AI-powered recommendation engine with 92% accuracy for product targeting.',
        'image': 'images/project6.jpg',
        'tileImage': 'tile_images/ezTrade.webp',
        'url': 'https://play.google.com/store/apps/details?id='
            'com.zuelligpharma.eztrade',
      },
      {
        'title': 'Covid-19 App',
        'description': 'Rapidly developed and deployed a critical public health app in just 3 weeks '
            'during the pandemic. Engineered a data synchronization system that provided '
            'real-time statistics to 50K+ users with 99.5% accuracy. Implemented an '
            'emergency resource locator that helped users find testing and vaccination centers.',
        'image': 'images/project7.jpg',
        'tileImage': 'tile_images/covid.webp',
        'url': 'https://github.com/sakshamsri4/Covid-19-App',
      },
    ];
  }

  @override
  List<Map<String, String>> getCareerTimeline() {
    return [
      {
        'company': 'mPhatek Systems',
        'role': 'Senior Mobile Architect',
        'period': 'March 2024 - Present',
        'description': 'Leading a team of 5 developers as Technical Lead for wellness apps '
            'serving 350K+ active users. Established architecture standards that reduced '
            'technical debt by 40%, implemented CI/CD pipelines that cut deployment time by 60%, '
            'and pioneered AI-powered health insights that increased user engagement by 35% '
            'while maintaining 99.9% crash-free sessions.',
      },
      {
        'company': 'SpaceVox Ltd.',
        'role': 'Lead Flutter Developer',
        'period': 'Aug 2023 - Dec 2023',
        'description': 'Led development of the Pro Ranked EV charging platform, delivering in just 10 weeks '
            'with a team of 3 developers. Architected a custom geospatial indexing system '
            'that reduced query times by 75% and designed a reactive architecture '
            'that scaled to handle 10K+ simultaneous device connections with <100ms latency, '
            'resulting in a 5-star client satisfaction rating.',
      },
      {
        'company': 'ABEYAANTRIX Tech',
        'role': 'Senior Flutter Developer',
        'period': 'Jan 2023 - July 2023',
        'description': 'Spearheaded the OnSite construction app development, engineering a robust offline-first '
            'architecture that maintained 100% data integrity in challenging field conditions with '
            'intermittent connectivity. Developed a custom PDF invoice engine that processed '
            r'$2.5M+ in monthly transactions and implemented a multilingual system supporting '
            '6 languages with 99% translation accuracy, increasing international adoption by 45%.',
      },
      {
        'company': 'CBNITS',
        'role': 'Flutter Team Lead',
        'period': 'Jan 2021 - Dec 2022',
        'description': 'Led a team of 4 developers building HIPAA-compliant healthcare platforms for Zuellig Pharma '
            'that securely managed 75K+ patient records with end-to-end encryption. Architected a '
            'telemedicine system handling 1,000+ daily consultations with 99.8% uptime and developed '
            'an AI-powered recommendation engine with 92% accuracy that increased sales by 28% '
            'for pharmaceutical representatives.',
      },
      {
        'company': 'Wipro Tech',
        'role': 'Flutter Developer',
        'period': 'June 2019 - March 2020',
        'description': 'Rapidly developed and deployed a critical public health app in just 3 weeks '
            'during the early pandemic, receiving recognition from senior management. '
            'Created a data synchronization system that provided real-time statistics to 50K+ users '
            'with 99.5% accuracy and implemented an emergency resource locator that became a vital '
            'community tool, featured in local news media for its impact.',
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
        'Riverpod), comprehensive Firebase integration, and advanced UI/UX development '
        "that balances technical precision with performance optimization. I've reduced "
        'app startup times by 40% and decreased memory usage by 35% through strategic '
        'architecture decisions and performance tuning. '
        '\n\nI excel at translating complex business requirements into efficient technical '
        'solutions, having successfully implemented real-time synchronization systems with '
        '99.9% reliability, offline-first architectures that maintain 100% data integrity, '
        'and sophisticated data visualization components that process millions of data points. '
        'My apps have passed rigorous security audits (HIPAA, SOC2) and compliance reviews for '
        'healthcare and financial applications, with zero critical vulnerabilities found. '
        "\n\nRecently, I've pioneered AI integration in mobile apps, implementing "
        'on-device ML models that reduced cloud processing costs by 70%, computer vision features '
        'with 95% accuracy, and OpenAI API integrations that increased user engagement by 40% '
        'while maintaining strict privacy standards. '
        "I've also established robust CI/CD pipelines that reduced deployment time by 60%, "
        'automated 85% of the QA process, and decreased regression bugs by 75%. '
        "\n\nI'm passionate about creating mobile experiences that deliver exceptional value to users "
        'while solving real business problems through systematic architecture and '
        'meticulous attention to detail. My leadership has helped teams increase velocity by 45% '
        'while maintaining code quality standards that exceed industry benchmarks.';
  }
}
