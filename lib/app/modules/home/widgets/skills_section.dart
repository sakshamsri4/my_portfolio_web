import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:my_portfolio_web/app/utils/skill_icons.dart';

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
            // Determine number of columns based on screen width
            final columns = constraints.maxWidth > 900
                ? 4
                : constraints.maxWidth > 600
                    ? 2
                    : 1;

            return Column(
              children: [
                Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  children: controller.skillCategories.map((category) {
                    return _buildSkillCategory(
                      context,
                      category: category['category']! as String,
                      skills: category['skills']! as List<String>,
                      width: columns == 1
                          ? constraints.maxWidth
                          : (constraints.maxWidth - (24 * (columns - 1))) /
                              columns,
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
                      const Text(
                        'Technologies I work with',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Tech stack icons with scroll animation
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
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    category,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withAlpha(20),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withAlpha(50),
        ),
      ),
      child: Text(
        skill,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.primary,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }

  // Technology icons with CRED-inspired design
  Widget _buildTechIcons(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    // Define the tech stack with their respective icons
    final techStack = [
      {
        'name': 'Flutter',
        'icon': FontAwesomeIcons.flutter,
        'color': const Color(0xFF02569B),
      },
      {
        'name': 'Firebase',
        'icon': FontAwesomeIcons.fire,
        'color': const Color(0xFFFFA000),
      },
      {
        'name': 'GitHub',
        'icon': FontAwesomeIcons.github,
        'color': const Color(0xFF333333),
      },
      {
        'name': 'Android',
        'icon': FontAwesomeIcons.android,
        'color': const Color(0xFF3DDC84),
      },
      {
        'name': 'iOS',
        'icon': FontAwesomeIcons.apple,
        'color': const Color(0xFF999999),
      },
      {
        'name': 'React',
        'icon': FontAwesomeIcons.react,
        'color': const Color(0xFF61DAFB),
      },
      {
        'name': 'Node.js',
        'icon': FontAwesomeIcons.nodeJs,
        'color': const Color(0xFF339933),
      },
      {
        'name': 'Database',
        'icon': FontAwesomeIcons.database,
        'color': const Color(0xFF336791),
      },
    ];

    return Column(
      children: [
        // Tech icons in a responsive grid with scroll animation
        SizedBox(
          height: 120, // Fixed height for the scrolling area
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: techStack
                  .map(
                    (tech) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: _buildTechIcon(
                        context: context,
                        icon: tech['icon']! as IconData,
                        name: tech['name']! as String,
                        color: tech['color']! as Color,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        // Scroll indicator
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.keyboard_arrow_left,
                color: primaryColor.withAlpha(150),
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                'Scroll to see more',
                style: TextStyle(
                  fontSize: 12,
                  color: primaryColor.withAlpha(150),
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.keyboard_arrow_right,
                color: primaryColor.withAlpha(150),
                size: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Helper method to create CRED-style tech icons
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
}
