import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/routes/app_pages.dart';
import 'package:my_portfolio_web/app/modules/about/controllers/about_controller.dart';

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
          onPressed: Get.back,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            const SizedBox(height: 24),
            const Text(
              'Education',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bachelor of Technology in Computer Science',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text('University Name, 2018-2022'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Experience',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Flutter Developer',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text('Company Name, 2022-Present'),
                    SizedBox(height: 8),
                    Text(
                      'Developed and maintained multiple Flutter applications for clients. '
                      'Implemented complex UI designs and integrated with various APIs.',
                    ),
                  ],
                ),
              ),
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
                  onPressed: () => Get.toNamed(Routes.PROJECTS),
                  icon: const Icon(Icons.work),
                  label: const Text('Projects'),
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
}
