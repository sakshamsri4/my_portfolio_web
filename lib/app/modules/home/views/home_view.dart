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
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0B1221),
                    Color(0xFFF8FAFC),
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            controller: controller.scrollController,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1220),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeroSection(controller: controller),
                    const SizedBox(height: 48),
                    KeyedSubtree(
                      key: controller.mobileKey,
                      child: MobileAppsSection(controller: controller),
                    ),
                    const SizedBox(height: 48),
                    KeyedSubtree(
                      key: controller.caseStudyKey,
                      child: FlagshipCaseStudySection(controller: controller),
                    ),
                    const SizedBox(height: 48),
                    KeyedSubtree(
                      key: controller.otherCaseKey,
                      child: OtherCaseStudiesSection(controller: controller),
                    ),
                    const SizedBox(height: 48),
                    KeyedSubtree(
                      key: controller.aiSkillsKey,
                      child: AISkillsSection(controller: controller),
                    ),
                    const SizedBox(height: 48),
                    KeyedSubtree(
                      key: controller.aboutKey,
                      child: AboutSection(controller: controller),
                    ),
                    const SizedBox(height: 48),
                    KeyedSubtree(
                      key: controller.contactKey,
                      child: ContactSection(controller: controller),
                    ),
                    const SizedBox(height: 32),
                    FooterSection(controller: controller),
                  ],
                ),
              ),
            ),
          ),
          SocialSidebar(controller: controller),
        ],
      ),
    );
  }
}
