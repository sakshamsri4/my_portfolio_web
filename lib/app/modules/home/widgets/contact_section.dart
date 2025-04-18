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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header with divider
        Row(
          children: [
            Text(
              "Let's Connect",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Divider(
                color: Theme.of(context).colorScheme.primary.withAlpha(100),
                thickness: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Introduction text
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Text(
            "Have a project in mind or just want to say hello? I'd love\n"
            "to hear from you! Let's discuss how we can work together to\n"
            'bring your ideas to life.',
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Theme.of(context).colorScheme.onSurface.withAlpha(230),
            ),
          ),
        ),

        // Contact cards
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary.withAlpha(15),
                Theme.of(context).scaffoldBackgroundColor,
              ],
            ),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withAlpha(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withAlpha(10),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              // Email contact card
              _buildContactCard(
                context,
                icon: Icons.email,
                title: 'Email',
                content: controller.contactInfo['email']!,
                onCopy: () => controller.copyToClipboard(
                  controller.contactInfo['email']!,
                ),
                onTap: controller.launchEmail,
                isFirst: true,
              ),

              // Phone contact card
              _buildContactCard(
                context,
                icon: Icons.phone,
                title: 'Phone',
                content: controller.contactInfo['phone']!,
                onCopy: () => controller.copyToClipboard(
                  controller.contactInfo['phone']!,
                ),
                onTap: controller.launchWhatsApp,
              ),

              // Location contact card
              _buildContactCard(
                context,
                icon: Icons.location_on,
                title: 'Location',
                content: controller.contactInfo['location']!,
                showCopy: false,
                isLast: true,
              ),
            ],
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

  Widget _buildContactCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String content,
    VoidCallback? onCopy,
    VoidCallback? onTap,
    bool showCopy = true,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: isFirst ? const Radius.circular(16) : Radius.zero,
          bottom: isLast ? const Radius.circular(16) : Radius.zero,
        ),
        color: isFirst
            ? Theme.of(context).colorScheme.primary.withAlpha(10)
            : null,
      ),
      child: Row(
        children: [
          // Icon with background
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withAlpha(20),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color:
                        Theme.of(context).colorScheme.onSurface.withAlpha(180),
                  ),
                ),
                const SizedBox(height: 4),
                InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          content,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                            decoration:
                                onTap != null ? TextDecoration.underline : null,
                            decorationColor: Theme.of(context)
                                .colorScheme
                                .primary
                                .withAlpha(150),
                            decorationThickness: 1.2,
                          ),
                        ),
                        if (onTap != null) ...[
                          const SizedBox(width: 4),
                          if (title == 'Phone')
                            const FaIcon(
                              FontAwesomeIcons.whatsapp,
                              size: 14,
                              color: Color(0xFF25D366),
                            )
                          else
                            Icon(
                              title == 'Email'
                                  ? Icons.email_outlined
                                  : Icons.open_in_new,
                              size: 14,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Action buttons
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // WhatsApp button for phone
              if (title == 'Phone')
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.whatsapp, size: 18),
                  tooltip: 'Open in WhatsApp',
                  onPressed: onTap,
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xFF25D366).withAlpha(30),
                    foregroundColor: const Color(0xFF25D366),
                  ),
                ),
              // Copy button
              if (showCopy && onCopy != null)
                IconButton(
                  icon: const Icon(Icons.copy, size: 20),
                  tooltip: 'Copy to clipboard',
                  onPressed: onCopy,
                  style: IconButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.primary.withAlpha(10),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
