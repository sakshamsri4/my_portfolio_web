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
    // Calculate responsive height based on screen size and content
    final screenHeight = MediaQuery.of(context).size.height;
    final timelineHeight = screenHeight < 600 ? 450.0 : 500.0;

    // Determine if we should use mobile layout
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Career Timeline',
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
        SizedBox(
          height: timelineHeight,
          child: isMobile
              ? _buildMobileTimeline(context)
              : _buildDesktopTimeline(context),
        ),
      ],
    );
  }

  // Mobile timeline with alternating left/right layout (criss-cross)
  Widget _buildMobileTimeline(BuildContext context) {
    return ListView.builder(
      itemCount: controller.careerTimeline.length,
      itemBuilder: (context, index) {
        final isLeft = index.isEven;
        return TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.5, // Center line for equal sides
          isFirst: index == 0,
          isLast: index == controller.careerTimeline.length - 1,
          indicatorStyle: IndicatorStyle(
            indicator: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary.withAlpha(40),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
            padding: const EdgeInsets.all(6),
          ),
          startChild:
              isLeft ? _buildMobileTimelineContent(context, index) : null,
          endChild: isLeft ? null : _buildMobileTimelineContent(context, index),
          beforeLineStyle: LineStyle(
            color: Theme.of(context).colorScheme.primary,
            thickness: 2,
          ),
          afterLineStyle: LineStyle(
            color: Theme.of(context).colorScheme.primary,
            thickness: 2,
          ),
        );
      },
    );
  }

  // Desktop timeline with alternating left/right layout
  Widget _buildDesktopTimeline(BuildContext context) {
    return ListView.builder(
      itemCount: controller.careerTimeline.length,
      itemBuilder: (context, index) {
        final isLeft = index.isEven;
        return TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.5, // Center line for equal sides
          isFirst: index == 0,
          isLast: index == controller.careerTimeline.length - 1,
          indicatorStyle: IndicatorStyle(
            width: 25,
            height: 25,
            indicator: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary.withAlpha(60),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
            padding: const EdgeInsets.all(8),
          ),
          startChild: isLeft ? _buildTimelineContent(context, index) : null,
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
    );
  }

  // Special content builder for mobile timeline to ensure text is fully visible
  Widget _buildMobileTimelineContent(BuildContext context, int index) {
    final isFirst = index == 0;
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate appropriate width for the content
    // Leave space for the timeline indicator and some padding
    final contentWidth = (screenWidth / 2) - 30;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: contentWidth,
        ),
        child: Card(
          elevation: 3,
          shadowColor: Theme.of(context).colorScheme.primary.withAlpha(40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
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
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Company name
                Text(
                  controller.careerTimeline[index]['company']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: isFirst
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).textTheme.titleLarge?.color,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines:
                      2, // Allow 2 lines for company name on small screens
                ),
                const SizedBox(height: 4),
                // Role
                Text(
                  controller.careerTimeline[index]['role']!,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Theme.of(context).textTheme.titleMedium?.color,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2, // Allow 2 lines for role on small screens
                ),
                const SizedBox(height: 4),
                // Period
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 12,
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        controller.careerTimeline[index]['period']!,
                        style: TextStyle(
                          fontSize: 11,
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const Divider(height: 12, thickness: 0.5),
                // Description - more concise for mobile
                Text(
                  controller.careerTimeline[index]['description']!,
                  style: TextStyle(
                    fontSize: 11,
                    height: 1.4,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                // Current badge for first item
                if (isFirst)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Current',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Desktop timeline content builder
  Widget _buildTimelineContent(BuildContext context, int index) {
    final isFirst = index == 0;
    final isMobile = MediaQuery.of(context).size.width < 600;

    // Adjust padding based on screen size
    final contentPadding = isMobile ? 12.0 : 16.0;

    return Padding(
      padding: EdgeInsets.all(contentPadding),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth:
              isMobile ? double.infinity : 300, // Control width for desktop
        ),
        child: Card(
          elevation: 4,
          shadowColor: Theme.of(context).colorScheme.primary.withAlpha(40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
            padding: EdgeInsets.all(isMobile ? 16 : 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                              fontSize: isMobile ? 16 : 18,
                            ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
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
                        fontSize: isMobile ? 14 : 16,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
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
                        fontSize: isMobile ? 13 : 14,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: isMobile ? 4 : 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
