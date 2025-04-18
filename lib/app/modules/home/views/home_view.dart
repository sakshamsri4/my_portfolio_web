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
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Determine number of items to show in carousels based on screen width
          final carouselItemCount = constraints.maxWidth >= 1024
              ? 3
              : constraints.maxWidth >= 600
                  ? 2
                  : 1;

          return SingleChildScrollView(
            controller: controller.scrollController,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero section
                HeroSection(controller: controller),
                const SizedBox(height: 32),

                // About Me section
                KeyedSubtree(
                  key: controller.aboutKey,
                  child: AboutSection(controller: controller),
                ),
                const SizedBox(height: 32),

                // // Education section
                // KeyedSubtree(
                //   key: controller.educationKey,
                //   child: EducationSection(controller: controller),
                // ),
                // const SizedBox(height: 32),

                // Skills section
                KeyedSubtree(
                  key: controller.skillsKey,
                  child: SkillsSection(controller: controller),
                ),
                const SizedBox(height: 32),

                // Projects section
                KeyedSubtree(
                  key: controller.projectsKey,
                  child: ProjectsSection(
                    controller: controller,
                    carouselItemCount: carouselItemCount,
                  ),
                ),
                const SizedBox(height: 32),

                // Career Timeline section
                KeyedSubtree(
                  key: controller.careerKey,
                  child: CareerTimelineSection(controller: controller),
                ),
                const SizedBox(height: 32),

                // Contact section
                KeyedSubtree(
                  key: controller.contactKey,
                  child: ContactSection(controller: controller),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
