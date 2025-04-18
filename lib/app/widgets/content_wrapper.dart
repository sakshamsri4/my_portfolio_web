import 'package:flutter/material.dart';
import 'package:my_portfolio_web/app/common/utils/responsive_utils.dart';

/// A wrapper for content with responsive width constraints
class ContentWrapper extends StatelessWidget {
  /// Creates a content wrapper
  const ContentWrapper({
    required this.child,
    this.maxWidth = 1200,
    this.horizontalPadding,
    this.alignment = Alignment.center,
    super.key,
  });

  /// The child widget
  final Widget child;
  
  /// Maximum width of the content
  final double maxWidth;
  
  /// Optional horizontal padding override
  final double? horizontalPadding;
  
  /// Alignment of the child
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final padding = horizontalPadding ?? 
        ResponsiveUtils.getResponsiveValue<double>(
          context: context,
          mobile: 16,
          tablet: 32,
          desktop: 64,
        );

    return Container(
      width: double.infinity,
      alignment: alignment,
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
