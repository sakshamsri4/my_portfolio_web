import 'package:flutter/material.dart';
import 'package:my_portfolio_web/app/common/constants/string_constants.dart';
import 'package:my_portfolio_web/app/common/utils/responsive_utils.dart';
import 'package:my_portfolio_web/app/widgets/content_wrapper.dart';
import 'package:my_portfolio_web/app/widgets/section_header.dart';

/// A standard section layout with header and content
class SectionLayout extends StatelessWidget {
  /// Creates a section layout
  const SectionLayout({
    required this.title,
    required this.content,
    this.subtitle,
    this.backgroundColor,
    this.headerAlignment = CrossAxisAlignment.start,
    this.contentPadding,
    this.sectionKey,
    super.key,
  });

  /// The title of the section
  final String title;

  /// Optional subtitle for the section
  final String? subtitle;

  /// The content of the section
  final Widget content;

  /// Optional background color
  final Color? backgroundColor;

  /// Alignment of the header
  final CrossAxisAlignment headerAlignment;

  /// Optional padding override for the content
  final EdgeInsetsGeometry? contentPadding;

  /// Optional key for scrolling to this section
  final Key? sectionKey;

  @override
  Widget build(BuildContext context) {
    final verticalSpacing = ResponsiveUtils.getResponsiveSpacing(
      context,
      mobile: 32,
      desktop: 48,
    );

    return Container(
      key: sectionKey,
      color: backgroundColor,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: verticalSpacing),
      child: ContentWrapper(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(
              title: title,
              subtitle: subtitle,
              alignment: headerAlignment,
            ),
            SizedBox(height: verticalSpacing),
            Padding(
              padding: contentPadding ?? EdgeInsets.zero,
              child: content,
            ),
          ],
        ),
      ),
    );
  }

  /// Create an about section
  static SectionLayout about({
    required Widget content,
    Key? sectionKey,
  }) {
    return SectionLayout(
      title: AppStrings.aboutMeTitle,
      subtitle: AppStrings.aboutMeSubtitle,
      content: content,
      sectionKey: sectionKey,
    );
  }

  /// Create a skills section
  static SectionLayout skills({
    required Widget content,
    Key? sectionKey,
  }) {
    return SectionLayout(
      title: AppStrings.skillsTitle,
      subtitle: AppStrings.skillsSubtitle,
      content: content,
      sectionKey: sectionKey,
    );
  }

  /// Create a projects section
  static SectionLayout projects({
    required Widget content,
    Key? sectionKey,
  }) {
    return SectionLayout(
      title: AppStrings.projectsTitle,
      subtitle: AppStrings.projectsSubtitle,
      content: content,
      sectionKey: sectionKey,
    );
  }

  /// Create a career section
  static SectionLayout career({
    required Widget content,
    Key? sectionKey,
  }) {
    return SectionLayout(
      title: AppStrings.careerTitle,
      subtitle: AppStrings.careerSubtitle,
      content: content,
      sectionKey: sectionKey,
    );
  }

  /// Create a contact section
  static SectionLayout contact({
    required Widget content,
    Key? sectionKey,
  }) {
    return SectionLayout(
      title: AppStrings.contactTitle,
      subtitle: AppStrings.contactSubtitle,
      content: content,
      headerAlignment: CrossAxisAlignment.center,
      sectionKey: sectionKey,
    );
  }
}
