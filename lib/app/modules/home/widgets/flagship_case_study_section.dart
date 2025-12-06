import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

class FlagshipCaseStudySection extends StatelessWidget {
  const FlagshipCaseStudySection({required this.controller, super.key});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final data = controller.flagshipCaseStudy;
    final role = data['role'] as List<String>;
    final stack = data['stack'] as List<String>;
    final links = data['links'] as List<Map<String, String>>;

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF0B1221),
            Color(0xFF0F172A),
          ],
        ),
        border: Border.all(color: Colors.white.withAlpha(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const _SectionChip(label: 'Flagship AI Case Study'),
              const SizedBox(width: 12),
              Text(
                data['title'] as String,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            data['whatThisWas'] as String,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white70,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            data['summary'] as String,
            style: theme.textTheme.bodyLarge?.copyWith(
              height: 1.6,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          _CardShell(
            title: 'What I owned',
            child: Column(
              children: role
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.check_circle, size: 18),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              item,
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(height: 1.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _CardShell(
                  title: 'Stack',
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: stack.map((tech) => _Chip(text: tech)).toList(),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _CardShell(
                  title: 'Links',
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: links
                        .map(
                          (link) => OutlinedButton.icon(
                            onPressed: () => controller.launchProjectUrl(
                              link['url']!,
                            ),
                            icon: const FaIcon(
                              FontAwesomeIcons.arrowUpRightFromSquare,
                              size: 12,
                            ),
                            label: Text(link['label']!),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionChip extends StatelessWidget {
  const _SectionChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(16),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primary.withAlpha(18),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}

class _CardShell extends StatelessWidget {
  const _CardShell({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(40),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 16,
            offset: const Offset(0, 8),
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
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}
