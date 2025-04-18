import 'package:flutter/material.dart';
import 'package:my_portfolio_web/app/common/utils/responsive_utils.dart';

/// A responsive container for sections with appropriate padding based on screen size
class ResponsiveSectionContainer extends StatelessWidget {
  /// Creates a responsive section container
  const ResponsiveSectionContainer({
    required this.child,
    this.backgroundColor,
    this.padding,
    this.constraints,
    this.alignment = Alignment.center,
    this.margin,
    super.key,
  });

  /// The child widget
  final Widget child;

  /// Optional background color
  final Color? backgroundColor;

  /// Optional padding override (otherwise uses responsive padding)
  final EdgeInsetsGeometry? padding;

  /// Optional constraints
  final BoxConstraints? constraints;

  /// Alignment of the child
  final Alignment alignment;

  /// Optional margin
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      margin: margin,
      padding: padding ?? ResponsiveUtils.getScreenPadding(context),
      constraints: constraints ?? const BoxConstraints(maxWidth: 1200),
      width: double.infinity,
      alignment: alignment,
      child: child,
    );
  }
}
