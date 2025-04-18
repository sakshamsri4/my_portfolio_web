import 'package:flutter/material.dart';

/// A reusable container for sections with consistent styling
class SectionContainer extends StatelessWidget {
  /// Creates a section container with optional title and subtitle
  const SectionContainer({
    required this.child,
    this.title,
    this.subtitle,
    this.padding = const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
    this.gradient,
    super.key,
  });

  /// The main content of the section
  final Widget child;

  /// Optional section title
  final String? title;

  /// Optional section subtitle
  final String? subtitle;

  /// Padding for the container
  final EdgeInsetsGeometry padding;

  /// Optional gradient for the background
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withAlpha(15),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          if (title != null) ...[
            Text(
              title!,
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 2,
                fontWeight: FontWeight.w700,
                color: primaryColor,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                subtitle!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
            ] else
              const SizedBox(height: 16),
          ],
          child,
        ],
      ),
    );
  }
}
