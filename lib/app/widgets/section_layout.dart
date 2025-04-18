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

  /// Creates an about section
  const SectionLayout.about({
    required this.content,
    this.sectionKey,
    super.key,
  })  : title = AppStrings.aboutMeTitle,
        subtitle = AppStrings.aboutMeSubtitle,
        backgroundColor = null,
        headerAlignment = CrossAxisAlignment.start,
        contentPadding = null;

  /// Creates a skills section
  const SectionLayout.skills({
    required this.content,
    this.sectionKey,
    super.key,
  })  : title = AppStrings.skillsTitle,
        subtitle = AppStrings.skillsSubtitle,
        backgroundColor = null,
        headerAlignment = CrossAxisAlignment.start,
        contentPadding = null;

  /// Creates a projects section
  const SectionLayout.projects({
    required this.content,
    this.sectionKey,
    super.key,
  })  : title = AppStrings.projectsTitle,
        subtitle = AppStrings.projectsSubtitle,
        backgroundColor = null,
        headerAlignment = CrossAxisAlignment.start,
        contentPadding = null;

  /// Creates a career section
  const SectionLayout.career({
    required this.content,
    this.sectionKey,
    super.key,
  })  : title = AppStrings.careerTitle,
        subtitle = AppStrings.careerSubtitle,
        backgroundColor = null,
        headerAlignment = CrossAxisAlignment.start,
        contentPadding = null;

  /// Creates a contact section
  const SectionLayout.contact({
    required this.content,
    this.sectionKey,
    super.key,
  })  : title = AppStrings.contactTitle,
        subtitle = AppStrings.contactSubtitle,
        backgroundColor = null,
        headerAlignment = CrossAxisAlignment.center,
        contentPadding = null;

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
}
