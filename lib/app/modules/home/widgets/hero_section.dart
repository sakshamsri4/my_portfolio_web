import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
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
              animatedTexts: [
                ColorizeAnimatedText(
                  '"Turning ideas into exceptional mobile experiences"',
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
              ],
              repeatForever: true,
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

  // Profile image with animated border
  Widget _buildProfileImage(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withAlpha(60),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: const CircleAvatar(
        radius: 80,
        backgroundColor: Color(0xFF675AF2),
        backgroundImage: AssetImage('assets/images/myself.jpeg'),
      ),
    );
  }

  // Introduction text with role and brief description
  Widget _buildIntroduction(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Role with accent color
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withAlpha(20),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Senior Flutter Developer',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        const SizedBox(height: 24),
        // Brief introduction that shows personality
        SizedBox(
          height: 80, // Fixed height to prevent layout shifts
          child: DefaultTextStyle(
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Theme.of(context).colorScheme.onSurface.withAlpha(204),
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
        const SizedBox(height: 24),
        // Social links with improved visual appearance
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.link),
              tooltip: 'LinkedIn',
              onPressed: () => controller.launchProjectUrl(
                'https://linkedin.com/in/sakshamsri/',
              ),
              style: IconButton.styleFrom(
                backgroundColor: Colors.blue.withAlpha(25),
                foregroundColor: Colors.blue,
              ),
            ),
            const SizedBox(width: 16),
            IconButton(
              icon: const Icon(Icons.code),
              tooltip: 'GitHub',
              onPressed: () => controller.launchProjectUrl(
                'https://github.com/sakshamsri4',
              ),
              style: IconButton.styleFrom(
                backgroundColor: Colors.black.withAlpha(25),
                foregroundColor: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Call to action buttons with improved design
  Widget _buildCallToAction(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: controller.launchEmail,
          icon: const Icon(Icons.email),
          label: const Text("Let's Work Together"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        OutlinedButton.icon(
          onPressed: controller.downloadCV,
          icon: const Icon(Icons.download),
          label: const Text('Download CV'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  // Scroll indicator that suggests there's more content below
  Widget _buildScrollIndicator(BuildContext context) {
    return Column(
      children: [
        Text(
          'Scroll to explore',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(153),
          ),
        ),
        const SizedBox(height: 8),
        Icon(
          Icons.keyboard_arrow_down,
          color: Theme.of(context).colorScheme.primary,
          size: 28,
        ),
      ],
    );
  }
}
