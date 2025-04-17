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
    return Center(
      child: Column(
        children: [
          const CircleAvatar(
            radius: 70,
            backgroundColor: Color(0xFF675AF2),
            child: Icon(Icons.person, size: 70, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(
            'Saksham Srivastava',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Senior Flutter Developer',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: controller.launchEmail,
                icon: const Icon(Icons.email),
                label: const Text('Contact Me'),
              ),
              ElevatedButton.icon(
                onPressed: controller.downloadCV,
                icon: const Icon(Icons.download),
                label: const Text('Download CV'),
              ),
            ],
          ),
          const SizedBox(height: 8),
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
              const SizedBox(width: 8),
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
