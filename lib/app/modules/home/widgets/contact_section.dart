import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({required this.controller, super.key});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final info = controller.contactInfo;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: theme.cardColor,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withAlpha(20),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withAlpha(24),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Contact',
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Reach out for roles and conversations',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Happy to discuss senior AI × Mobile roles. Best way: email or LinkedIn.',
            style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              FilledButton.icon(
                onPressed: controller.launchEmail,
                icon: const FaIcon(FontAwesomeIcons.envelope, size: 14),
                label: Text(info['email'] ?? 'Email'),
              ),
              OutlinedButton.icon(
                onPressed: () => controller.launchProjectUrl(
                  'https://www.linkedin.com/in/sakshamsri/',
                ),
                icon: const FaIcon(FontAwesomeIcons.linkedin, size: 14),
                label: const Text('LinkedIn'),
              ),
              OutlinedButton.icon(
                onPressed: () => controller.launchProjectUrl(
                  'https://github.com/sakshamsri4',
                ),
                icon: const FaIcon(FontAwesomeIcons.github, size: 14),
                label: const Text('GitHub'),
              ),
              OutlinedButton.icon(
                onPressed: controller.downloadCV,
                icon: const FaIcon(FontAwesomeIcons.filePdf, size: 14),
                label: const Text('Resume'),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              _ContactLine(
                icon: FontAwesomeIcons.locationDot,
                label: info['location'] ?? 'Remote',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContactLine extends StatelessWidget {
  const _ContactLine({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(icon, size: 14, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}
