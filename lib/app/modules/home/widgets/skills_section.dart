import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_web/app/common/ui/tech_chip.dart';
import 'package:my_portfolio_web/app/data/models/tech_stack_item.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:my_portfolio_web/app/utils/skill_icons.dart';
import 'package:my_portfolio_web/app/utils/svg_icon_helper.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({
    required this.controller,
    super.key,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header with divider
        Row(
          children: [
            Text(
              'Skills & Expertise',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Divider(
                color: Theme.of(context).colorScheme.primary.withAlpha(100),
                thickness: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Introduction text
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Text(
            "I've developed expertise in various technologies and "
            'methodologies throughout my career. Here are the key skills '
            'that enable me to deliver exceptional mobile applications:',
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Theme.of(context).colorScheme.onSurface.withAlpha(230),
            ),
            softWrap: true,
          ),
        ),

        // Skills categories grid
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final cardWidth = width >= 1100
                ? 340.0
                : width >= 820
                    ? 300.0
                    : 280.0;
            return Column(
              children: [
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: controller.skillCategories.map((category) {
                    return _buildSkillCategory(
                      context,
                      category: category['category']! as String,
                      skills: category['skills']! as List<String>,
                      width: cardWidth,
                    );
                  }).toList(),
                ),
                const SizedBox(height: 40),
                // Tech Stack section title
                Center(
                  child: Column(
                    children: [
                      Text(
                        'TECH STACK',
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Technologies I rely on day to day',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(190),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Tech stack icons without hidden scroll
                _buildTechIcons(context),
              ],
            );
          },
        ),
      ],
    );
  }

  // Build a skill category card
  Widget _buildSkillCategory(
    BuildContext context, {
    required String category,
    required List<String> skills,
    required double width,
  }) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withAlpha(20),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withAlpha(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Category header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withAlpha(15),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withAlpha(30),
                    shape: BoxShape.circle,
                  ),
                  child: SkillIcons.getSvgIcon(
                    category,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    category,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Theme.of(context).colorScheme.primary,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),

          // Skills list
          Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills
                  .map((skill) => _buildSkillChip(context, skill))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  // Build a skill chip
  Widget _buildSkillChip(BuildContext context, String skill) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TechChip(
      label: skill,
      isDarkMode: isDarkMode,
    );
  }

  // Technology icons with CRED-inspired design
  Widget _buildTechIcons(BuildContext context) {
    final techStack = controller.techStack;

    return Wrap(
      spacing: 24,
      runSpacing: 20,
      children: techStack.map((tech) {
        return tech.iconType == IconType.fontAwesome
            ? _buildTechIcon(
                context: context,
                icon: tech.icon!,
                name: tech.name,
                color: tech.color,
              )
            : _buildSvgTechIcon(
                context: context,
                svgName: tech.svgName!,
                name: tech.name,
                color: tech.color,
              );
      }).toList(),
    );
  }

  // Helper method to create CRED-style tech icons with FontAwesome icons
  Widget _buildTechIcon({
    required BuildContext context,
    required IconData icon,
    required String name,
    required Color color,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final size = isMobile ? 50.0 : 60.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Icon with NeoPOP effect
        Stack(
          clipBehavior: Clip.none,
          children: [
            // Shadow container with offset
            Positioned(
              left: 3,
              top: 3,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            // Main container
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: color.withAlpha(40),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
                border: Border.all(
                  color: color.withAlpha(50),
                ),
              ),
              child: Center(
                child: FaIcon(
                  icon,
                  color: color,
                  size: size * 0.5,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Tech name with CRED-style typography
        Text(
          name,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(180),
          ),
        ),
      ],
    );
  }

  // Helper method to create CRED-style tech icons with SVG icons
  Widget _buildSvgTechIcon({
    required BuildContext context,
    required String svgName,
    required String name,
    required Color color,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final size = isMobile ? 50.0 : 60.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Icon with NeoPOP effect
        Stack(
          clipBehavior: Clip.none,
          children: [
            // Shadow container with offset
            Positioned(
              left: 3,
              top: 3,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            // Main container
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: color.withAlpha(40),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
                border: Border.all(
                  color: color.withAlpha(50),
                ),
              ),
              child: Center(
                child: SvgIconHelper.getSvgIcon(
                  svgName,
                  size: size * 0.5,
                  color: color,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Tech name with CRED-style typography
        Text(
          name,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(180),
          ),
        ),
      ],
    );
  }
}
