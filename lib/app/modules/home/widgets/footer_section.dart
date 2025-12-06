import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({required this.controller, super.key});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          const Text('© 2025 Saksham Srivastava · AI × Mobile Engineer'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            children: [
              _LinkButton(
                icon: FontAwesomeIcons.github,
                label: 'GitHub',
                onTap: () => controller.launchProjectUrl(
                  'https://github.com/sakshamsri4',
                ),
              ),
              _LinkButton(
                icon: FontAwesomeIcons.linkedin,
                label: 'LinkedIn',
                onTap: () => controller.launchProjectUrl(
                  'https://linkedin.com/in/sakshamsri/',
                ),
              ),
              _LinkButton(
                icon: FontAwesomeIcons.filePdf,
                label: 'Resume',
                onTap: controller.downloadCV,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Built in Flutter · Space Grotesk + Inter · Light/Dark ready',
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class _LinkButton extends StatelessWidget {
  const _LinkButton(
      {required this.icon, required this.label, required this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton.icon(
      onPressed: onTap,
      icon: FaIcon(icon, size: 14, color: theme.colorScheme.primary),
      label: Text(label),
    );
  }
}
