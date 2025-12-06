import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';
import 'package:my_portfolio_web/app/data/models/tech_stack_item.dart';
import 'package:my_portfolio_web/app/data/repositories/portfolio_repository_interface.dart';

/// Repository for portfolio data
class PortfolioRepository implements PortfolioRepositoryInterface {
  @override
  Future<void> initialize() async {}

  @override
  void dispose() {}

  @override
  List<TechStackItem> getTechStack() {
    return [
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
        name: 'Firebase',
        svgName: 'Firebase',
        color: AppColors.firebase,
        iconType: IconType.svg,
      ),
      const TechStackItem(
        name: 'Python',
        svgName: 'Python',
        color: Color(0xFF3776AB),
        iconType: IconType.svg,
      ),
      const TechStackItem(
        name: 'TensorFlow',
        svgName: 'TensorFlow',
        color: Color(0xFFFF6F00),
        iconType: IconType.svg,
      ),
      const TechStackItem(
        name: 'OpenAI',
        svgName: 'OpenAI',
        color: Color(0xFF10B981),
        iconType: IconType.svg,
      ),
      const TechStackItem(
        name: 'LangChain',
        svgName: 'LangChain',
        color: Color(0xFF111827),
        iconType: IconType.svg,
      ),
      const TechStackItem(
        name: 'Next.js',
        svgName: 'Next.js',
        color: Color(0xFF000000),
        iconType: IconType.svg,
      ),
      const TechStackItem(
        name: 'Docker',
        svgName: 'Docker',
        color: Color(0xFF2496ED),
        iconType: IconType.svg,
      ),
      const TechStackItem(
        name: 'GitHub Actions',
        icon: FontAwesomeIcons.github,
        color: AppColors.github,
      ),
    ];
  }

  @override
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
    };
  }

  @override
  List<String> getAnimatedGreetings() {
    return [
      'Senior AI × Mobile Engineer',
      'Flutter + ML integrations',
      'Agentic workflows on mobile',
      'Reliable shipping across platforms',
    ];
  }

  @override
  List<String> getAnimatedIntroductions() {
    return [
      'Building Flutter apps with AI/ML features that are production-ready.',
      'Designing mobile architectures that stay reliable at scale.',
      'Integrating on-device ML and agent backends with FastAPI.',
    ];
  }

  @override
  List<String> getDesignPhilosophyQuotes() {
    return [
      'Mobile reliability beats novelty.',
      'Edge + cloud AI only works with solid UX affordances.',
      'Good delivery pairs CI/CD with strict performance budgets.',
    ];
  }

  @override
  List<Map<String, dynamic>> getSkillCategories() {
    return [
      {
        'category': 'AI & Agents',
        'iconType': 'svg',
        'skills': [
          'AutoGen',
          'CrewAI basics',
          'RAG pipelines',
          'LangChain tools',
          'MCP',
        ],
      },
      {
        'category': 'Mobile',
        'iconType': 'svg',
        'skills': [
          'Flutter',
          'Platform channels',
          'Animations',
          'Accessibility',
          'Offline-first',
        ],
      },
      {
        'category': 'Backend',
        'iconType': 'svg',
        'skills': [
          'FastAPI',
          'Firebase',
          'REST',
          'GraphQL',
          'Supabase',
        ],
      },
      {
        'category': 'Delivery',
        'iconType': 'svg',
        'skills': [
          'CI/CD',
          'GitHub Actions',
          'Monitoring',
          'Rollout guards',
          'Testing',
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
            'Led Flutter development for a wellness app serving vitality members with reliable activity tracking.',
        'image': 'assets/images/project1.jpg',
        'tileImage': 'assets/tile_images/John_hancock.webp',
        'url':
            'https://apps.apple.com/us/app/john-hancock-vitality/id1192577836',
      },
      {
        'title': 'Manulife Vitality App',
        'description':
            'Engineered a bilingual health app with HealthKit integration and accessibility compliance.',
        'image': 'assets/images/project2.jpg',
        'tileImage': 'assets/tile_images/manulife.webp',
        'url': 'https://apps.apple.com/ca/app/manulife-vitality/id1198760352',
      },
    ];
  }

  @override
  Map<String, dynamic> getFlagshipCaseStudy() {
    return {
      'title': 'Algomash Vitality + Radiance Web',
      'whatThisWas':
          'Wellness platform with daily health scoring, face verification, and telemetry feeding personalised insights across mobile and web.',
      'summary':
          'AI-enabled wellness companion with health scoring, camera-based checks, and analytics shipped across iOS, Android, and web.',
      'role': [
        'Lead mobile engineer',
        'Integrated 9s face capture pipeline',
        'Scoped on-device validation',
        'Built full Flutter client',
        'Integrated Algomash API',
        'Designed data model',
        'Implemented image pipeline + upload validation',
        'Delivered full multi-platform release',
      ],
      'stack': [
        'Flutter',
        'Firebase',
        'CameraAwesome',
        'TensorFlow Lite',
        'Groq / Gemini / OpenAI (planned)',
        'HealthKit / Health Connect',
        'FastAPI (prototype backend)',
      ],
      'links': [
        {
          'label': 'iOS App Store',
          'url':
              'https://apps.apple.com/in/app/algomash-vitality-and-fitness/id6747969871',
        },
        {
          'label': 'Google Play',
          'url': 'https://play.google.com/store/apps/details?id=com.algomash',
        },
        {
          'label': 'Radiance Web',
          'url': 'https://radiance-app-f0e85.web.app/#/home',
        },
      ],
    };
  }

  @override
  List<Map<String, dynamic>> getMiniAIProjects() {
    return [
      {
        'title': 'Research Summarizer Agent',
        'description':
            'Summarizes PRDs and tech specs into action items with linked sources.',
        'status': 'Prototype',
        'stack': ['LangChain', 'MCP', 'FastAPI'],
      },
      {
        'title': 'Face Age Estimation Model',
        'description':
            'On-device TFLite study for age/face estimation to pre-validate uploads.',
        'status': 'Study project',
        'stack': ['TensorFlow Lite', 'Flutter', 'CameraAwesome'],
      },
      {
        'title': 'Voice-to-Task Agent',
        'description':
            'Speech-to-action flow that turns voice notes into tasks for mobile teams.',
        'status': 'In progress',
        'stack': ['Whisper', 'FastAPI', 'Flutter'],
      },
    ];
  }

  @override
  List<String> getAISkills() {
    return [
      'AutoGen and CrewAI basics',
      'RAG pipelines with embeddings',
      'LangChain tool creation',
      'Model Context Protocol (MCP)',
      'FastAPI backends for agents',
      'On-device ML with TensorFlow Lite',
    ];
  }

  @override
  List<Map<String, dynamic>> getMobileAppsShowcase() {
    return [
      {
        'title': 'Algomash Vitality',
        'domain': 'Wellness · Analytics',
        'platforms': ['iOS', 'Android', 'Web'],
        'description':
            'Health scoring, face checks, and telemetry across mobile + web.',
        'metric': 'Production release',
        'url': 'https://play.google.com/store/apps/details?id=com.algomash',
        'altUrl':
            'https://apps.apple.com/in/app/algomash-vitality-and-fitness/id6747969871',
        'webUrl': 'https://radiance-app-f0e85.web.app/#/home',
      },
      {
        'title': 'Nudron Water Metering',
        'domain': 'IoT · Utilities',
        'platforms': ['Android'],
        'description':
            'IoT meter readings with near-realtime updates for water ops teams.',
        'metric': 'Play Store live',
        'url':
            'https://play.google.com/store/apps/details?id=com.nudron.water_meter2',
      },
      {
        'title': 'RailOps',
        'domain': 'Logistics',
        'platforms': ['Android'],
        'description': 'Mobile control room for rail network operations.',
        'metric': 'Play Store live',
        'url':
            'https://play.google.com/store/apps/details?id=com.biputri.railops',
      },
      {
        'title': 'John Hancock Vitality',
        'domain': 'Health · Insurance',
        'platforms': ['Android'],
        'description': 'Wellness companion for vitality members in the US.',
        'metric': 'Play Store live',
        'url':
            'https://play.google.com/store/apps/details?id=com.thevitalitygroup.johnhancock',
      },
      {
        'title': 'Manulife Vitality',
        'domain': 'Health · Insurance',
        'platforms': ['Android'],
        'description': 'Bilingual vitality experience for Canada.',
        'metric': 'Play Store live',
        'url':
            'https://play.google.com/store/apps/details?id=com.thevitalitygroup.manulife',
      },
      {
        'title': 'ProRanked EV',
        'domain': 'EV · Energy',
        'platforms': ['Web', 'Mobile'],
        'description': 'EV station monitoring and booking experience.',
        'metric': 'Live product',
        'url': 'https://proranked.com/',
      },
      {
        'title': 'OnSite',
        'domain': 'Construction',
        'platforms': ['Android'],
        'description': 'Offline-first field operations and invoicing.',
        'metric': 'Play Store live',
        'url': 'https://play.google.com/store/apps/details?id=com.app.onsite',
      },
      {
        'title': 'eZTrade',
        'domain': 'Pharma',
        'platforms': ['Android'],
        'description': 'Order management and targeting for pharma reps.',
        'metric': 'Play Store live',
        'url':
            'https://play.google.com/store/apps/details?id=com.zuelligpharma.eztrade',
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
        'description':
            'Leading mobile work for wellness products with emphasis on reliability and AI integrations.',
      },
      {
        'company': 'SpaceVox Ltd.',
        'role': 'Lead Flutter Developer',
        'period': 'Aug 2023 - Dec 2023',
        'description':
            'Delivered EV platform mobile stack with real-time monitoring and reactive UI.',
      },
      {
        'company': 'ABEYAANTRIX Tech',
        'role': 'Senior Flutter Developer',
        'period': 'Jan 2023 - July 2023',
        'description':
            'Built offline-first construction field app with multilingual support.',
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
    ];
  }

  @override
  String getProfessionalSummary() {
    return '6+ years building Flutter applications and 3 years integrating ML/AI into production mobile stacks. Comfortable across iOS, Android, and web with CI/CD, accessibility, and performance budgets in place.';
  }
}
