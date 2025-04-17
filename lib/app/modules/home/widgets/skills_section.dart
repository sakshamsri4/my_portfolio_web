import 'package:flutter/material.dart';
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
            "I've developed expertise in various technologies and methodologies throughout my career. Here are the key skills that enable me to deliver exceptional mobile applications:",
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Theme.of(context).colorScheme.onSurface.withAlpha(230),
            ),
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

            return Wrap(
              spacing: 24,
              runSpacing: 24,
              children: controller.skillCategories.map((category) {
                return _buildSkillCategory(
                  context,
                  category: category['category']! as String,
                  skills: category['skills']! as List<String>,
                  width: columns == 1
                      ? constraints.maxWidth
                      : (constraints.maxWidth - (24 * (columns - 1))) / columns,
                );
              }).toList(),
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
      ),
    );
  }
}
