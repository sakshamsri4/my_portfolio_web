import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

class SkillsSection extends StatelessWidget {
  final HomeController controller;

  const SkillsSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skills',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: 16),
        MouseRegion(
          onEnter: (_) => controller.toggleCarouselPlay(),
          onExit: (_) => controller.toggleCarouselPlay(),
          child: Obx(() {
            return FlutterCarousel(
              items: controller.skills.map((skill) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withAlpha(25),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          skill,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 60,
                autoPlay: controller.isCarouselPlaying.value,
                autoPlayInterval: const Duration(seconds: 2),
                enlargeCenterPage: true,
                viewportFraction: 0.25,
              ),
            );
          }),
        ),
      ],
    );
  }
}
