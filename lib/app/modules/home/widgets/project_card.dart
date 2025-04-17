import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.externalUrl,
    super.key,
  });
  final String title;
  final String description;
  final String imageUrl;
  final String externalUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Theme.of(context).colorScheme.primary.withAlpha(40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Project image with gradient overlay
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  imageUrl,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  // Handle missing images
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 160,
                      color:
                          Theme.of(context).colorScheme.primary.withAlpha(25),
                      child: Center(
                        child: Icon(
                          Icons.image,
                          size: 50,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Gradient overlay for better text visibility
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withAlpha(150),
                      ],
                    ),
                  ),
                ),
              ),
              // Project title on the image
              Positioned(
                bottom: 12,
                left: 16,
                right: 16,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 1),
                        blurRadius: 3,
                        color: Color(0x99000000),
                      ),
                    ],
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          // Project details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Description
                SizedBox(
                  height: 60, // Fixed height for description
                  child: Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withAlpha(220),
                      height: 1.4,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Action button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton.icon(
                      icon: const Icon(Icons.open_in_new, size: 16),
                      label: const Text('View Project'),
                      onPressed: () => Get.find<HomeController>()
                          .launchProjectUrl(externalUrl),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
