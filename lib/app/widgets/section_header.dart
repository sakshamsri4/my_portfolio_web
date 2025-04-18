import 'package:flutter/material.dart';
import 'package:my_portfolio_web/app/common/styles/app_styles.dart';

/// A reusable section header with title and optional subtitle
class SectionHeader extends StatelessWidget {
  /// Creates a section header
  const SectionHeader({
    required this.title,
    this.subtitle,
    this.alignment = CrossAxisAlignment.start,
    this.underlineWidth = 80,
    super.key,
  });

  /// The title of the section
  final String title;
  
  /// Optional subtitle for the section
  final String? subtitle;
  
  /// Alignment of the header content
  final CrossAxisAlignment alignment;
  
  /// Width of the underline
  final double underlineWidth;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    
    return Column(
      crossAxisAlignment: alignment,
      children: [
        // Title
        Text(
          title,
          style: AppTextStyles.sectionTitle,
        ),
        
        const SizedBox(height: 8),
        
        // Underline
        Container(
          width: underlineWidth,
          height: 2,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        
        // Subtitle if provided
        if (subtitle != null) ...[
          const SizedBox(height: 16),
          Text(
            subtitle!,
            style: AppTextStyles.sectionSubtitle,
          ),
        ],
      ],
    );
  }
}
