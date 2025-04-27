import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/modules/about/controllers/about_controller.dart';
import 'package:my_portfolio_web/app/routes/app_pages.dart';

// Extracted widgets for better performance
class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class _EducationCard extends StatelessWidget {
  const _EducationCard();

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bachelor of Technology in Computer Science',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text('University Name, 2018-2022'),
          ],
        ),
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  const _ExperienceCard();

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Flutter Developer',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text('Company Name, 2022-Present'),
            SizedBox(height: 8),
            Text(
              'Developed and maintained multiple Flutter applications\n'
              'for clients. Implemented complex UI designs and\n'
              'integrated with various APIs.',
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationButtons extends StatelessWidget {
  const _NavigationButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () => Get.toNamed<void>(Routes.home),
          icon: const Icon(Icons.home),
          label: const Text('Home'),
        ),
        ElevatedButton.icon(
          onPressed: () => Get.toNamed<void>(Routes.projects),
          icon: const Icon(Icons.work),
          label: const Text('Projects'),
        ),
        ElevatedButton.icon(
          onPressed: () => Get.toNamed<void>(Routes.contact),
          icon: const Icon(Icons.email),
          label: const Text('Contact'),
        ),
      ],
    );
  }
}

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back<void>(),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Me',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'I am a passionate Flutter developer with experience in building '
              'cross-platform mobile applications. I specialize in creating '
              'optimized, responsive, and user-friendly interfaces.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            _SectionTitle('Education'),
            SizedBox(height: 8),
            _EducationCard(),
            SizedBox(height: 24),
            _SectionTitle('Experience'),
            SizedBox(height: 8),
            _ExperienceCard(),
            SizedBox(height: 24),
            _NavigationButtons(),
          ],
        ),
      ),
    );
  }
}
