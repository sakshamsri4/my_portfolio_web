import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:my_portfolio_web/app/modules/home/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({
    required this.controller,
    required this.carouselItemCount,
    super.key,
  });
  final HomeController controller;
  final int carouselItemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header with divider
        Row(
          children: [
            Text(
              'Featured Projects',
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
        const SizedBox(height: 16),

        // Introduction text
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Text(
            "Here are some of my favorite projects that showcase my skills and passion for creating exceptional mobile experiences. Each project represents a unique challenge that I've tackled with creativity and technical expertise.",
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Theme.of(context).colorScheme.onSurface.withAlpha(230),
            ),
          ),
        ),

        // Projects carousel
        SizedBox(
          height: 380, // Increased height to prevent overflow
          child: FlutterCarousel(
            items: controller.projects.map((project) {
              return Builder(
                builder: (BuildContext context) {
                  return ProjectCard(
                    title: project['title']!,
                    description: project['description']!,
                    imageUrl:
                        controller.getImageWithFallback(project['image']!),
                    externalUrl: project['url']!,
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 380,
              autoPlay: true,
              autoPlayInterval:
                  const Duration(seconds: 4), // Slightly longer interval
              enlargeCenterPage: true, // Emphasize the center item
              viewportFraction: carouselItemCount == 1
                  ? 0.85
                  : carouselItemCount == 2
                      ? 0.55
                      : 0.4,
              enableInfiniteScroll: true,
            ),
          ),
        ),

        // Call to action
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 8),
          child: Center(
            child: OutlinedButton.icon(
              onPressed: () =>
                  controller.launchProjectUrl('https://github.com/sakshamsri4'),
              icon: const Icon(Icons.code),
              label: const Text('View More Projects on GitHub'),
              style: OutlinedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
