import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/modules/projects/controllers/projects_controller.dart';
import 'package:my_portfolio_web/app/routes/app_pages.dart';

class ProjectsView extends GetView<ProjectsController> {
  const ProjectsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Projects'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: Get.back,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Projects',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildProjectCard(
              'Portfolio Website',
              'A personal portfolio website built with Flutter and GetX.',
              ['Flutter', 'GetX', 'Web'],
              'This website showcases my skills and projects in a clean, responsive interface.',
            ),
            const SizedBox(height: 16),
            _buildProjectCard(
              'E-Commerce App',
              'A mobile application for online shopping.',
              ['Flutter', 'Firebase', 'Stripe'],
              'Features include user authentication, product catalog, shopping cart, and payment integration.',
            ),
            const SizedBox(height: 16),
            _buildProjectCard(
              'Task Management App',
              'A productivity app for managing tasks and projects.',
              ['Flutter', 'Hive', 'Provider'],
              'Includes features like task creation, due dates, reminders, and project organization.',
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => Get.toNamed(Routes.HOME),
                  icon: const Icon(Icons.home),
                  label: const Text('Home'),
                ),
                ElevatedButton.icon(
                  onPressed: () => Get.toNamed(Routes.ABOUT),
                  icon: const Icon(Icons.person),
                  label: const Text('About'),
                ),
                ElevatedButton.icon(
                  onPressed: () => Get.toNamed(Routes.CONTACT),
                  icon: const Icon(Icons.email),
                  label: const Text('Contact'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(
    String title,
    String description,
    List<String> technologies,
    String details,
  ) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 8),
            Text(
              details,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 4,
              children: technologies
                  .map(
                    (tech) => Chip(
                      label: Text(tech, style: const TextStyle(fontSize: 12)),
                      padding: const EdgeInsets.all(4),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
