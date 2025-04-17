import 'package:flutter/material.dart';
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
        Text(
          'Contact',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: 16),
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
      ],
    );
  }

  Widget _buildContactCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String content,
    VoidCallback? onCopy,
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
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
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
    );
  }
}
