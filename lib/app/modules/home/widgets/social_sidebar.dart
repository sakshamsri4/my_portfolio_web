import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

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
            _buildSocialButton(
              context: context,
              icon: FontAwesomeIcons.linkedin,
              color: const Color(0xFF0A66C2),
              onPressed: () => controller.launchProjectUrl(
                'https://linkedin.com/in/sakshamsri/',
              ),
            ),
            const SizedBox(height: 24),
            _buildSocialButton(
              context: context,
              icon: FontAwesomeIcons.github,
              color: Colors.black,
              onPressed: () => controller.launchProjectUrl(
                'https://github.com/sakshamsri4',
              ),
            ),
            const SizedBox(height: 24),
            _buildSocialButton(
              context: context,
              icon: FontAwesomeIcons.xTwitter,
              color: Colors.black,
              onPressed: () => controller.launchProjectUrl(
                'https://twitter.com/sakshamsri4',
              ),
            ),
            const SizedBox(height: 24),
            _buildSocialButton(
              context: context,
              icon: FontAwesomeIcons.whatsapp,
              color: const Color(0xFF25D366),
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

  // Helper method to create CRED-style social buttons
  Widget _buildSocialButton({
    required BuildContext context,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: const Duration(milliseconds: 300),
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, -2 * value),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Shadow container with offset
                  Positioned(
                    left: 3,
                    top: 3,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(179),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  // Main container
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: color.withAlpha(40),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Center(
                      child: FaIcon(
                        icon,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
