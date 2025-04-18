import 'package:flutter/material.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    required this.controller,
    super.key,
  });
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'About Me',
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
        const SizedBox(height: 32),

        // Two-column layout for wider screens
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return _buildWideLayout(context);
            } else {
              return _buildNarrowLayout(context);
            }
          },
        ),
      ],
    );
  }

  // Layout for wider screens
  Widget _buildWideLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side - Story and passion
        Expanded(
          flex: 3,
          child: _buildStorySection(context),
        ),
        const SizedBox(width: 32),
        // Right side - What I do
        Expanded(
          flex: 2,
          child: _buildWhatIDoSection(context),
        ),
      ],
    );
  }

  // Layout for narrow screens
  Widget _buildNarrowLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStorySection(context),
        const SizedBox(height: 32),
        _buildWhatIDoSection(context),
      ],
    );
  }

  // My story section with personal touch
  Widget _buildStorySection(BuildContext context) {
    return Container(
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
          // Section title
          Text(
            'My Story',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 16),
          // Quote icon
          Icon(
            Icons.format_quote,
            size: 32,
            color: Theme.of(context).colorScheme.primary.withAlpha(100),
          ),
          const SizedBox(height: 8),
          // Professional summary with personal touch
          Text(
            controller.professionalSummary,
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              letterSpacing: 0.3,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 24),
          // Passion statement
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withAlpha(10),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary.withAlpha(30),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    "I'm passionate about creating apps that not only look "
                    'beautiful but also solve real problems and deliver '
                    'exceptional user experiences.',
                    style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // What I do section with services
  Widget _buildWhatIDoSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).cardTheme.color,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withAlpha(20),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Text(
            'What I Do',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 24),
          // Services list
          _buildServiceItem(
            context,
            icon: Icons.phone_android,
            title: 'Mobile App Development',
            description:
                'Cross-platform apps with Flutter that work seamlessly '
                'on iOS and Android.',
          ),
          const SizedBox(height: 16),
          _buildServiceItem(
            context,
            icon: Icons.design_services,
            title: 'UI/UX Design',
            description: 'Intuitive interfaces with beautiful animations '
                'and responsive layouts.',
          ),
          const SizedBox(height: 16),
          _buildServiceItem(
            context,
            icon: Icons.cloud,
            title: 'Backend Integration',
            description: 'Seamless integration with Firebase, REST APIs, '
                'and other backend services.',
          ),
          const SizedBox(height: 16),
          _buildServiceItem(
            context,
            icon: Icons.speed,
            title: 'Performance Optimization',
            description:
                'Fast, efficient apps that provide a smooth user experience.',
          ),
        ],
      ),
    );
  }

  // Service item with icon and description
  Widget _buildServiceItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Service icon
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withAlpha(20),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        // Service details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(200),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
