import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:my_portfolio_web/app/modules/home/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  final HomeController controller;
  final int carouselItemCount;

  const ProjectsSection({
    super.key,
    required this.controller,
    required this.carouselItemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Projects',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 300,
          child: FlutterCarousel(
            items: controller.projects.map((project) {
              return Builder(
                builder: (BuildContext context) {
                  return ProjectCard(
                    title: project['title']!,
                    description: project['description']!,
                    imageUrl: project['image']!,
                    externalUrl: project['url']!,
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 300,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              viewportFraction: carouselItemCount == 1
                  ? 0.8
                  : carouselItemCount == 2
                      ? 0.5
                      : 0.33,
            ),
          ),
        ),
      ],
    );
  }
}
