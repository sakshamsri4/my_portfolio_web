import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';
import 'package:my_portfolio_web/app/common/ui/neo_pop_social_button.dart';
import 'package:my_portfolio_web/app/common/utils/responsive_helper.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

class SocialSidebar extends StatelessWidget {
  const SocialSidebar({
    required this.controller,
    super.key,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final isMobile = ResponsiveHelper.isMobile(context);

    // Don't show the sidebar on very small screens
    if (isMobile) return const SizedBox.shrink();

    return Positioned(
      left: 32,
      top: 0,
      bottom: 0,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NeoPOPSocialButton(
              icon: FontAwesomeIcons.linkedin,
              color: AppColors.linkedin,
              onPressed: () =>
                  controller.launchProjectUrl(AppConstants.linkedInUrl),
            ),
            const SizedBox(height: 24),
            NeoPOPSocialButton(
              icon: FontAwesomeIcons.github,
              color: AppColors.github,
              onPressed: () =>
                  controller.launchProjectUrl(AppConstants.githubUrl),
            ),
            const SizedBox(height: 24),
            NeoPOPSocialButton(
              icon: FontAwesomeIcons.xTwitter,
              color: AppColors.twitter,
              onPressed: () =>
                  controller.launchProjectUrl(AppConstants.twitterUrl),
            ),
            const SizedBox(height: 24),
            NeoPOPSocialButton(
              icon: FontAwesomeIcons.whatsapp,
              color: AppColors.whatsapp,
              onPressed: controller.launchWhatsApp,
            ),
            const SizedBox(height: 24),
            // Vertical line with gradient
            Container(
              width: 2,
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    primaryColor,
                    primaryColor.withAlpha(25),
                  ],
                ),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
