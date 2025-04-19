import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    required this.controller,
    super.key,
  });
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary.withAlpha(40),
            Theme.of(context).scaffoldBackgroundColor,
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withAlpha(20),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          // Animated greeting text
          _buildAnimatedGreeting(context),
          const SizedBox(height: 32),

          // Two-column layout for wider screens
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return _buildWideLayout(context);
              } else {
                return _buildNarrowLayout(context);
              }
            },
          ),

          const SizedBox(height: 40),

          // Tagline that shows personality
          DefaultTextStyle(
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            child: AnimatedTextKit(
              animatedTexts: controller.designPhilosophyQuotes
                  .map(
                    (text) => ColorizeAnimatedText(
                      '"$text"',
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.secondary,
                        Theme.of(context).colorScheme.primary.withAlpha(150),
                        Theme.of(context).colorScheme.primary,
                      ],
                    ),
                  )
                  .toList(),
              repeatForever: true,
              pause: const Duration(milliseconds: 2000),
              displayFullTextOnTap: true,
            ),
          ),

          const SizedBox(height: 40),

          // Call to action buttons with improved design
          _buildCallToAction(context),

          const SizedBox(height: 32),

          // Scroll indicator
          _buildScrollIndicator(context),
        ],
      ),
    );
  }

  // Animated greeting text that cycles through different phrases
  Widget _buildAnimatedGreeting(BuildContext context) {
    return Column(
      children: [
        Text(
          "Hello, I'm",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(179),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Saksham Srivastava',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        DefaultTextStyle(
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Flutter Developer',
                speed: const Duration(milliseconds: 100),
              ),
              TypewriterAnimatedText(
                'Mobile App Specialist',
                speed: const Duration(milliseconds: 100),
              ),
              TypewriterAnimatedText(
                'UI/UX Enthusiast',
                speed: const Duration(milliseconds: 100),
              ),
            ],
            repeatForever: true,
            displayFullTextOnTap: true,
          ),
        ),
      ],
    );
  }

  // Layout for wider screens with image and text side by side
  Widget _buildWideLayout(BuildContext context) {
    return Row(
      children: [
        // Left side - Profile image
        Expanded(
          flex: 2,
          child: _buildProfileImage(context),
        ),
        const SizedBox(width: 40),
        // Right side - Introduction text
        Expanded(
          flex: 3,
          child: _buildIntroduction(context),
        ),
      ],
    );
  }

  // Layout for narrow screens with image and text stacked
  Widget _buildNarrowLayout(BuildContext context) {
    return Column(
      children: [
        _buildProfileImage(context),
        const SizedBox(height: 32),
        _buildIntroduction(context),
      ],
    );
  }

  // Profile image with CRED-inspired NeoPOP design
  Widget _buildProfileImage(BuildContext context) {
    // Determine if we're in mobile or desktop view
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    // Adjust radius based on screen size
    final radius = isMobile ? 80.0 : 100.0;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Stack(
      alignment: Alignment.center,
      children: [
        // Background shape with offset for NeoPOP effect
        Container(
          width: radius * 2 + 16,
          height: radius * 2 + 16,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          margin: const EdgeInsets.only(left: 8, top: 8),
        ),

        // Main container with shadow
        Container(
          width: radius * 2 + 12,
          height: radius * 2 + 12,
          decoration: BoxDecoration(
            color: primaryColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: primaryColor.withAlpha(60),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
        ),

        // Image container
        ClipOval(
          child: Container(
            width: radius * 2,
            height: radius * 2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/myself.jpeg'),
                fit: BoxFit.cover,
                alignment: Alignment(0, -0.5), // Center on face
              ),
            ),
            // Add subtle inner border
            foregroundDecoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withAlpha(75),
                width: 2,
              ),
            ),
          ),
        ),

        // Accent element removed
      ],
    );
  }

  // Introduction text with CRED-inspired NeoPOP design
  Widget _buildIntroduction(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Role with NeoPOP style
        Stack(
          clipBehavior: Clip.none,
          children: [
            // Shadow container with offset
            Positioned(
              left: 4,
              top: 4,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Senior Flutter Developer',
                  style: TextStyle(
                    color: Colors.transparent,
                    fontSize: isMobile ? 18 : 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Main container
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withAlpha(40),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Text(
                'Senior Flutter Developer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 18 : 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        // Name with bold typography
        Text(
          'Saksham Srivastava',
          style: TextStyle(
            fontSize: isMobile ? 32 : 48,
            fontWeight: FontWeight.w800,
            letterSpacing: -1,
            height: 0.9,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        // Brief introduction with CRED-style typography
        SizedBox(
          height: 100, // Increased height for better readability
          child: DefaultTextStyle(
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              height: 1.4,
              letterSpacing: 0.2,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black54,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                FadeAnimatedText(
                  'I create beautiful, high-performance mobile apps\n'
                  'that users love.',
                  duration: const Duration(milliseconds: 3000),
                  fadeInEnd: 0.2,
                ),
                FadeAnimatedText(
                  'With 6+ years of Flutter expertise, I transform\n'
                  'complex ideas into elegant experiences.',
                  duration: const Duration(milliseconds: 3000),
                  fadeInEnd: 0.2,
                ),
                FadeAnimatedText(
                  'Let me help bring your app idea to life with\n'
                  'flawless execution across platforms.',
                  duration: const Duration(milliseconds: 3000),
                  fadeInEnd: 0.2,
                ),
              ],
              repeatForever: true,
              pause: const Duration(milliseconds: 500),
            ),
          ),
        ),
      ],
    );
  }

  // Call to action buttons with CRED-inspired NeoPOP design
  Widget _buildCallToAction(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: [
        // Primary CTA with NeoPOP effect
        _buildNeoPOPCTA(
          context: context,
          label: "Let's Work Together",
          icon: FontAwesomeIcons.envelope,
          isPrimary: true,
          onPressed: controller.launchEmail,
        ),
        // Secondary CTA with NeoPOP effect
        _buildNeoPOPCTA(
          context: context,
          label: 'Download CV',
          icon: FontAwesomeIcons.fileArrowDown,
          isPrimary: false,
          onPressed: controller.downloadCV,
        ),
      ],
    );
  }

  // Helper method to create NeoPOP style CTA buttons
  Widget _buildNeoPOPCTA({
    required BuildContext context,
    required String label,
    required IconData icon,
    required bool isPrimary,
    required VoidCallback onPressed,
  }) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Shadow container with offset
          Positioned(
            left: 4,
            top: 4,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 28,
                vertical: isMobile ? 12 : 16,
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(
                    icon,
                    color: Colors.transparent,
                    size: isMobile ? 18 : 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.transparent,
                      fontSize: isMobile ? 14 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Main container
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 28,
              vertical: isMobile ? 12 : 16,
            ),
            decoration: BoxDecoration(
              color: isPrimary ? primaryColor : Colors.white,
              borderRadius: BorderRadius.circular(4),
              border:
                  isPrimary ? null : Border.all(color: primaryColor, width: 2),
              boxShadow: isPrimary
                  ? [
                      BoxShadow(
                        color: primaryColor.withAlpha(40),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ]
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  icon,
                  color: isPrimary ? Colors.white : primaryColor,
                  size: isMobile ? 18 : 20,
                ),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    color: isPrimary ? Colors.white : primaryColor,
                    fontSize: isMobile ? 14 : 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Scroll indicator with CRED-inspired NeoPOP design
  Widget _buildScrollIndicator(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Column(
      children: [
        // Text with CRED-style typography
        Text(
          'SCROLL TO EXPLORE',
          style: TextStyle(
            fontSize: 12,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white70
                : Colors.black54,
          ),
        ),
        const SizedBox(height: 12),
        // Arrow with NeoPOP effect
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            // Shadow container with offset
            Positioned(
              left: 3,
              top: 3,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            // Main container
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.angleDown,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
