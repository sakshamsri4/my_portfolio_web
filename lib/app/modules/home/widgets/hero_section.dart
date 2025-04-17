import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

class HeroSection extends StatelessWidget {
  final HomeController controller;

  const HeroSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.primary.withAlpha(30),
            Theme.of(context).scaffoldBackgroundColor,
          ],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          // Profile image with animated border
          Container(
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
              radius: 70,
              backgroundColor: Color(0xFF675AF2),
              child: Icon(Icons.person, size: 70, color: Colors.white),
            ),
          ),
          const SizedBox(height: 24),
          // Name with larger font and bold weight
          Text(
            'Saksham Srivastava',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
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
          const SizedBox(height: 32),
          // Action buttons with improved spacing
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: controller.launchEmail,
                icon: const Icon(Icons.email),
                label: const Text('Contact Me'),
              ),
              OutlinedButton.icon(
                onPressed: controller.downloadCV,
                icon: const Icon(Icons.download),
                label: const Text('Download CV'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Social links with improved visual appearance
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.link),
                tooltip: 'LinkedIn',
                onPressed: () => controller.launchProjectUrl(
                  'https://linkedin.com/in/sakshamsri/',
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.code),
                tooltip: 'GitHub',
                onPressed: () => controller.launchProjectUrl(
                  'https://github.com/sakshamsri4',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
