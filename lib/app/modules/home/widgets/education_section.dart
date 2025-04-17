import 'package:flutter/material.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({
    required this.controller,
    super.key,
  });
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Education',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: 16),
        // Education cards with visual hierarchy
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.educationInfo.length,
          itemBuilder: (context, index) {
            final education = controller.educationInfo[index];
            final isFirst = index == 0;

            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: isFirst ? 4 : 2,
              shadowColor: isFirst
                  ? Theme.of(context).colorScheme.primary.withAlpha(40)
                  : null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: isFirst
                      ? LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Theme.of(context).colorScheme.primary.withAlpha(20),
                            Theme.of(context).cardTheme.color ?? Colors.white,
                          ],
                        )
                      : null,
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    // Left side with icon
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isFirst
                            ? Theme.of(context)
                                .colorScheme
                                .primary
                                .withAlpha(30)
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withAlpha(15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.school,
                        color: Theme.of(context).colorScheme.primary,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Right side with education details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            education['institution']!,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: isFirst
                                      ? Theme.of(context).colorScheme.primary
                                      : null,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            education['degree']!,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 14,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.color,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                education['period']!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
