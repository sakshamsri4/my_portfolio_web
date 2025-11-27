import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_web/app/common/constants/app_constants.dart';
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
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary.withAlpha(18),
            Theme.of(context).scaffoldBackgroundColor,
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withAlpha(24),
            blurRadius: 24,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nameplate and role
          _buildPreamble(context),
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

          const SizedBox(height: 36),

          // Call to action buttons with improved design
          _buildCallToAction(context),

          const SizedBox(height: 28),

          // Scroll indicator
          _buildScrollIndicator(context),
        ],
      ),
    );
  }

  // Calm preamble instead of constant animation
  Widget _buildPreamble(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Saksham Srivastava',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
              ),
        ),
        const SizedBox(height: 12),
        Text(
          'Principal Flutter Engineer · Product-minded builder',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppConstants.profileImagePath),
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Building reliable Flutter products that balance polish, performance, and longevity.',
          style: TextStyle(
            fontSize: isMobile ? 26 : 32,
            fontWeight: FontWeight.w700,
            height: 1.2,
            color: Theme.of(context).colorScheme.onSurface,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '6+ years shipping cross-platform apps for founders and teams that care about craft. '
          'I translate fuzzy product goals into calm interfaces, scalable architecture, and steady delivery.',
          style: TextStyle(
            fontSize: isMobile ? 15 : 16,
            height: 1.6,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(210),
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: const [
            _Pill(label: 'Product-minded delivery'),
            _Pill(label: 'Design systems & accessibility'),
            _Pill(label: 'Performance-first Flutter'),
            _Pill(label: 'Analytics with intent'),
          ],
        ),
      ],
    );
  }

  // Call to action buttons with CRED-inspired NeoPOP design
  Widget _buildCallToAction(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    return Wrap(
      spacing: 16,
      runSpacing: 12,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        FilledButton.icon(
          onPressed: controller.launchEmail,
          style: FilledButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 18 : 22,
              vertical: isMobile ? 12 : 14,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          icon: const FaIcon(FontAwesomeIcons.envelope, size: 16),
          label: const Text(
            "Let's work together",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        OutlinedButton.icon(
          onPressed: () => controller.scrollToSection('projects'),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 20,
              vertical: isMobile ? 12 : 14,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary.withAlpha(180),
              width: 1.5,
            ),
          ),
          icon: const FaIcon(FontAwesomeIcons.codeBranch, size: 16),
          label: const Text(
            'See recent work',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
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
        // Arrow with reduced ornamentation
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: primaryColor.withAlpha(24),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: primaryColor.withAlpha(120)),
          ),
          child: const Center(
            child: FaIcon(
              FontAwesomeIcons.angleDown,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withAlpha(20),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withAlpha(120),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
