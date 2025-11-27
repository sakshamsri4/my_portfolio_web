import 'package:flutter/material.dart';

import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:my_portfolio_web/app/modules/home/widgets/glassmorphic_project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({
    required this.controller,
    super.key,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final projects = controller.projects;

    return Padding(
      padding: const EdgeInsets.only(top: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header with underline
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Featured Work',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 8),
              Container(
                width: 88,
                height: 2,
                color: primaryColor,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Selected product builds that balance interaction design, engineering rigor, and measurable outcomes.',
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Theme.of(context).colorScheme.onSurface.withAlpha(222),
            ),
          ),
          const SizedBox(height: 32),

          if (projects.isEmpty)
            const Text('No projects available right now.')
          else
            LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final columns = width >= 1100
                    ? 3
                    : width >= 820
                        ? 2
                        : 1;
                final aspectRatio = columns == 1 ? 1.05 : 1.1;
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: projects.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: aspectRatio,
                  ),
                  itemBuilder: (context, index) {
                    final project = projects[index];
                    return GlassmorphicProjectCard(
                      title: project['title']!,
                      description: project['description']!,
                      imageUrl:
                          controller.getImageWithFallback(project['image']!),
                      tileImageUrl: project['tileImage']!,
                      externalUrl: project['url']!,
                    );
                  },
                );
              },
            ),

          // CTA
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Row(
              children: [
                TextButton.icon(
                  onPressed: () => controller
                      .launchProjectUrl('https://github.com/sakshamsri4'),
                  icon: Icon(Icons.open_in_new,
                      color: primaryColor.withAlpha(220), size: 18),
                  label: Text(
                    'Browse the full portfolio on GitHub',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
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
}
