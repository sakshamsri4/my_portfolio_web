import 'package:flutter/material.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

class AboutSection extends StatelessWidget {
  final HomeController controller;

  const AboutSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Me',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: 16),
        // Professional summary with visual enhancements
        Container(
          padding: const EdgeInsets.all(24),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Quote icon at the top
              Icon(
                Icons.format_quote,
                size: 32,
                color: Theme.of(context).colorScheme.primary.withAlpha(100),
              ),
              const SizedBox(height: 8),
              // Professional summary text with improved typography
              Text(
                controller.professionalSummary,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  letterSpacing: 0.3,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
