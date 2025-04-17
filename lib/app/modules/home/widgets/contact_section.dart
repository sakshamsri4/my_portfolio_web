import 'package:flutter/material.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

class ContactSection extends StatelessWidget {
  final HomeController controller;

  const ContactSection({
    super.key,
    required this.controller,
  });

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
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text('Email'),
                  subtitle: Text(controller.contactInfo['email']!),
                  trailing: IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () => controller.copyToClipboard(
                      controller.contactInfo['email']!,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text('Phone'),
                  subtitle: Text(controller.contactInfo['phone']!),
                  trailing: IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () => controller.copyToClipboard(
                      controller.contactInfo['phone']!,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: const Text('Location'),
                  subtitle: Text(controller.contactInfo['location']!),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
