import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero section
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, size: 70, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Saksham Srivastava',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Flutter Developer',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.email),
                        label: const Text('Contact Me'),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.download),
                        label: const Text('Download CV'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // About Me section
            const Text(
              'About Me',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'I am a passionate Flutter developer with experience in building '
              'cross-platform mobile applications. I specialize in creating '
              'beautiful, responsive, and user-friendly interfaces.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),

            // Skills section
            const Text(
              'Skills',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildSkillChip('Flutter'),
                _buildSkillChip('Dart'),
                _buildSkillChip('Firebase'),
                _buildSkillChip('GetX'),
                _buildSkillChip('BLoC'),
                _buildSkillChip('REST API'),
                _buildSkillChip('Git'),
              ],
            ),
            const SizedBox(height: 32),

            // Projects section
            const Text(
              'Projects',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildProjectCard(
              'Portfolio Website',
              'A personal portfolio website built with Flutter and GetX.',
              ['Flutter', 'GetX', 'Web'],
            ),
            const SizedBox(height: 16),
            _buildProjectCard(
              'E-Commerce App',
              'A mobile application for online shopping with user '
                  'authentication and payment integration.',
              ['Flutter', 'Firebase', 'Stripe'],
            ),
            const SizedBox(height: 32),

            // Contact section
            const Text(
              'Contact',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('s.saksham@mufin.co.kr'),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('+91 1234567890'),
            ),
            const ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Location'),
              subtitle: Text('India'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.blue.shade100,
    );
  }

  Widget _buildProjectCard(
    String title,
    String description,
    List<String> technologies,
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
