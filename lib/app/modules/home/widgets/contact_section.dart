import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({
    required this.controller,
    super.key,
  });
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      // Column is centered by default
      children: [
        // Centered section header
        Text(
          "Let's Connect",
          style: Theme.of(context).textTheme.displaySmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        // Centered divider
        Container(
          width: 80,
          height: 2,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(height: 24),

        // Introduction text
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Text(
            "Have a project in mind or just want to say hello? I'd love to "
            "hear from you! Let's discuss how we can work together to bring "
            'your ideas to life.',
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.9),
            ),
            textAlign: TextAlign.center,
          ),
        ),

        // Modern contact buttons
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              children: [
                // Contact buttons row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Say Hello (Email) button
                    _buildContactButton(
                      context,
                      icon: Icons.email_outlined,
                      label: 'Say Hello',
                      onTap: controller.launchEmail,
                      isPrimary: true,
                    ),
                    const SizedBox(width: 16),
                    // WhatsApp button
                    _buildContactButton(
                      context,
                      icon: FontAwesomeIcons.whatsapp,
                      label: 'WhatsApp',
                      onTap: controller.launchWhatsApp,
                      color: const Color(0xFF25D366),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Final call to action
        Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 16),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Ready to start a project?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: controller.launchEmail,
                  icon: const Icon(Icons.send),
                  label: const Text('Send Me a Message'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color? color,
    bool isPrimary = false,
  }) {
    final theme = Theme.of(context);
    final buttonColor = color ?? theme.colorScheme.primary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isPrimary ? buttonColor : buttonColor.withAlpha(25),
            boxShadow: isPrimary
                ? [
                    BoxShadow(
                      color: buttonColor.withAlpha(75),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                icon,
                size: 18,
                color: isPrimary ? Colors.white : buttonColor,
              ),
              const SizedBox(width: 12),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isPrimary ? Colors.white : buttonColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
