import 'package:flutter/material.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CareerTimelineSection extends StatelessWidget {
  final HomeController controller;

  const CareerTimelineSection({
    super.key,
    required this.controller,
  });

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
                startChild: isLeft
                    ? _buildTimelineContent(context, index)
                    : null,
                endChild: isLeft
                    ? null
                    : _buildTimelineContent(context, index),
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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.careerTimeline[index]['company']!,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Text(
                controller.careerTimeline[index]['role']!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              Text(
                controller.careerTimeline[index]['period']!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              Text(
                controller.careerTimeline[index]['description']!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
