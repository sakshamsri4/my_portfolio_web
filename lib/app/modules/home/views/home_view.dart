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
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                controller: controller.scrollController,
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1180),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Hero section
                        HeroSection(controller: controller),
                        const SizedBox(height: 56),

                        // About Me section
                        KeyedSubtree(
                          key: controller.aboutKey,
                          child: AboutSection(controller: controller),
                        ),
                        const SizedBox(height: 56),

                        // Projects section
                        KeyedSubtree(
                          key: controller.projectsKey,
                          child: ProjectsSection(controller: controller),
                        ),
                        const SizedBox(height: 56),

                        // Career Timeline section
                        KeyedSubtree(
                          key: controller.careerKey,
                          child: CareerTimelineSection(controller: controller),
                        ),
                        const SizedBox(height: 56),

                        // Skills section
                        KeyedSubtree(
                          key: controller.skillsKey,
                          child: SkillsSection(controller: controller),
                        ),
                        const SizedBox(height: 56),

                        // Contact section
                        KeyedSubtree(
                          key: controller.contactKey,
                          child: ContactSection(controller: controller),
                        ),
                        const SizedBox(height: 56),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // Fixed social media sidebar
          SocialSidebar(controller: controller),
        ],
      ),
    );
  }
}
