import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:my_portfolio_web/app/modules/home/widgets/widgets.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Determine number of items to show in carousels based on screen width
          final carouselItemCount = constraints.maxWidth >= 1024
              ? 3
              : constraints.maxWidth >= 600
                  ? 2
                  : 1;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero section
                HeroSection(controller: controller),
                const SizedBox(height: 32),

                // About Me section
                AboutSection(controller: controller),
                const SizedBox(height: 32),

                // Education section
                EducationSection(controller: controller),
                const SizedBox(height: 32),

                // Skills section
                SkillsSection(controller: controller),
                const SizedBox(height: 32),

                // Projects section
                ProjectsSection(
                  controller: controller,
                  carouselItemCount: carouselItemCount,
                ),
                const SizedBox(height: 32),

                // Career Timeline section
                CareerTimelineSection(controller: controller),
                const SizedBox(height: 32),

                // Contact section
                ContactSection(controller: controller),
              ],
            ),
          );
        },
      ),
    );
  }
}
