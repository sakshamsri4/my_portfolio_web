import 'package:flutter/material.dart';
import 'package:my_portfolio_web/app/common/utils/responsive_utils.dart';

/// A responsive grid layout that adjusts columns based on screen size
class ResponsiveGrid extends StatelessWidget {
  /// Creates a responsive grid
  const ResponsiveGrid({
    required this.children,
    this.mobileColumns = 1,
    this.tabletColumns = 2,
    this.desktopColumns = 3,
    this.spacing = 16,
    this.runSpacing = 16,
    this.childAspectRatio = 1.0,
    super.key,
  });

  /// The children to display in the grid
  final List<Widget> children;
  
  /// Number of columns on mobile
  final int mobileColumns;
  
  /// Number of columns on tablet
  final int tabletColumns;
  
  /// Number of columns on desktop
  final int desktopColumns;
  
  /// Spacing between items
  final double spacing;
  
  /// Run spacing between rows
  final double runSpacing;
  
  /// Child aspect ratio
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = ResponsiveUtils.getResponsiveValue<int>(
      context: context,
      mobile: mobileColumns,
      tablet: tabletColumns,
      desktop: desktopColumns,
    );

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: runSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }
}
