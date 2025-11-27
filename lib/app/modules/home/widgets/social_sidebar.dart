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
            _SidebarButton(
              label: 'LinkedIn',
              icon: FontAwesomeIcons.linkedin,
              color: AppColors.linkedin,
              onPressed: () =>
                  controller.launchProjectUrl(AppConstants.linkedInUrl),
            ),
            const SizedBox(height: 24),
            _SidebarButton(
              label: 'GitHub',
              icon: FontAwesomeIcons.github,
              color: AppColors.github,
              onPressed: () =>
                  controller.launchProjectUrl(AppConstants.githubUrl),
            ),
            const SizedBox(height: 24),
            _SidebarButton(
              label: 'Twitter / X',
              icon: FontAwesomeIcons.xTwitter,
              color: AppColors.twitter,
              onPressed: () =>
                  controller.launchProjectUrl(AppConstants.twitterUrl),
            ),
            const SizedBox(height: 24),
            _SidebarButton(
              label: 'WhatsApp',
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

class _SidebarButton extends StatelessWidget {
  const _SidebarButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      preferBelow: false,
      child: FocusableActionDetector(
        mouseCursor: SystemMouseCursors.click,
        onShowFocusHighlight: (_) {},
        child: Semantics(
          button: true,
          label: label,
          child: NeoPOPSocialButton(
            icon: icon,
            color: color,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
