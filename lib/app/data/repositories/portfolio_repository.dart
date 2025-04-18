import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';
import 'package:my_portfolio_web/app/data/models/tech_stack_item.dart';

/// Repository for portfolio data
class PortfolioRepository {
  /// Get the list of tech stack items
  List<TechStackItem> getTechStack() {
    return [
      const TechStackItem(
        name: 'Flutter',
        icon: FontAwesomeIcons.flutter,
        color: AppColors.flutter,
      ),
      const TechStackItem(
        name: 'Firebase',
        icon: FontAwesomeIcons.fire,
        color: AppColors.firebase,
      ),
      const TechStackItem(
        name: 'GitHub',
        icon: FontAwesomeIcons.github,
        color: AppColors.github,
      ),
      const TechStackItem(
        name: 'Android',
        icon: FontAwesomeIcons.android,
        color: AppColors.android,
      ),
      const TechStackItem(
        name: 'iOS',
        icon: FontAwesomeIcons.apple,
        color: AppColors.ios,
      ),
      const TechStackItem(
        name: 'React',
        icon: FontAwesomeIcons.react,
        color: AppColors.react,
      ),
      const TechStackItem(
        name: 'Node.js',
        icon: FontAwesomeIcons.nodeJs,
        color: AppColors.nodejs,
      ),
      const TechStackItem(
        name: 'Database',
        icon: FontAwesomeIcons.database,
        color: AppColors.database,
      ),
    ];
  }

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

  /// Get animated greeting texts
  List<String> getAnimatedGreetings() {
    return [
      'Flutter Developer',
      'Mobile App Specialist',
      'UI/UX Enthusiast',
    ];
  }

  /// Get animated introduction texts
  List<String> getAnimatedIntroductions() {
    return [
      'I create beautiful, high-performance mobile apps\n'
          'that users love.',
      'With 6+ years of Flutter expertise, I transform\n'
          'complex ideas into elegant experiences.',
      'Let me help bring your app idea to life with\n'
          'flawless execution across platforms.',
    ];
  }
}
