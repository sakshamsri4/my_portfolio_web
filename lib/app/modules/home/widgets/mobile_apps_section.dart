import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

class MobileAppsSection extends StatelessWidget {
  const MobileAppsSection({required this.controller, super.key});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final apps = controller.mobileAppsShowcase;
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Mobile Apps',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Shipped mobile apps (real production)',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = constraints.maxWidth > 1100
                ? 3
                : constraints.maxWidth > 800
                    ? 2
                    : 1;
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.4,
              ),
              itemCount: apps.length,
              itemBuilder: (context, index) {
                final app = apps[index];
                return _AppCard(
                  title: app['title']! as String,
                  domain: app['domain']! as String,
                  description: app['description']! as String,
                  metric: app['metric']! as String,
                  platforms:
                      (app['platforms']! as List<dynamic>).cast<String>(),
                  url: app['url']! as String,
                  altUrl: app['altUrl'] as String?,
                  webUrl: app['webUrl'] as String?,
                  controller: controller,
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class _AppCard extends StatelessWidget {
  const _AppCard({
    required this.title,
    required this.domain,
    required this.description,
    required this.metric,
    required this.platforms,
    required this.url,
    required this.controller,
    this.altUrl,
    this.webUrl,
  });

  final String title;
  final String domain;
  final String description;
  final String metric;
  final List<String> platforms;
  final String url;
  final String? altUrl;
  final String? webUrl;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xFF0F172A),
        border: Border.all(color: Colors.white.withAlpha(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(18),
            blurRadius: 16,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            domain,
            style: theme.textTheme.bodySmall?.copyWith(
              color: Colors.white70,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: platforms.map((p) => _PlatformChip(label: p)).toList(),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Text(
              description,
              style: theme.textTheme.bodyMedium?.copyWith(
                height: 1.5,
                color: Colors.white70,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            metric,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 6,
            children: [
              TextButton.icon(
                onPressed: () => controller.launchProjectUrl(url),
                icon: const FaIcon(FontAwesomeIcons.arrowUpRightFromSquare,
                    size: 14),
                label: const Text('Store'),
                style: TextButton.styleFrom(foregroundColor: Colors.white),
              ),
              if (altUrl != null)
                TextButton.icon(
                  onPressed: () => controller.launchProjectUrl(altUrl!),
                  icon: const FaIcon(FontAwesomeIcons.apple, size: 14),
                  label: const Text('iOS'),
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                ),
              if (webUrl != null)
                TextButton.icon(
                  onPressed: () => controller.launchProjectUrl(webUrl!),
                  icon: const FaIcon(FontAwesomeIcons.globe, size: 14),
                  label: const Text('Web'),
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PlatformChip extends StatelessWidget {
  const _PlatformChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}
