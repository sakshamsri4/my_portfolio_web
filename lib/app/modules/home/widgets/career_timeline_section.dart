import 'package:flutter/material.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CareerTimelineSection extends StatelessWidget {
  const CareerTimelineSection({
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
          'Career Timeline',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 400,
          child: ListView.builder(
            itemCount: controller.careerTimeline.length,
            itemBuilder: (context, index) {
              final isLeft = index.isEven;
              return TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.2,
                isFirst: index == 0,
                isLast: index == controller.careerTimeline.length - 1,
                indicatorStyle: IndicatorStyle(
                  indicator: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                startChild:
                    isLeft ? _buildTimelineContent(context, index) : null,
                endChild: isLeft ? null : _buildTimelineContent(context, index),
                beforeLineStyle: LineStyle(
                  color: Theme.of(context).colorScheme.primary,
                  thickness: 3,
                ),
                afterLineStyle: LineStyle(
                  color: Theme.of(context).colorScheme.primary,
                  thickness: 3,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineContent(BuildContext context, int index) {
    final isFirst = index == 0;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        elevation: 4,
        shadowColor: Theme.of(context).colorScheme.primary.withAlpha(40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: isFirst
                ? LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Theme.of(context).colorScheme.primary.withAlpha(40),
                      Theme.of(context).cardTheme.color ?? Colors.white,
                    ],
                  )
                : null,
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company with badge for current position
              Row(
                children: [
                  Expanded(
                    child: Text(
                      controller.careerTimeline[index]['company']!,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: isFirst
                                ? Theme.of(context).colorScheme.primary
                                : null,
                          ),
                    ),
                  ),
                  if (isFirst)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Current',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              // Role with emphasis
              Text(
                controller.careerTimeline[index]['role']!,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 4),
              // Period with icon
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 14,
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    controller.careerTimeline[index]['period']!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              const Divider(height: 24),
              // Description with improved readability
              Text(
                controller.careerTimeline[index]['description']!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.5,
                      letterSpacing: 0.2,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
