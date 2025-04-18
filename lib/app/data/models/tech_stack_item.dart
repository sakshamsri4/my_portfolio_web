import 'package:flutter/material.dart';

/// Enum for icon types
enum IconType {
  /// Font Awesome icon
  fontAwesome,

  /// SVG icon
  svg,
}

/// Model class for tech stack items
class TechStackItem {
  /// Creates a tech stack item
  const TechStackItem({
    required this.name,
    required this.color,
    this.icon,
    this.svgName,
    this.iconType = IconType.fontAwesome,
  }) : assert(
          (iconType == IconType.fontAwesome && icon != null) ||
              (iconType == IconType.svg && svgName != null),
          'Either icon or svgName must be provided based on iconType',
        );

  /// The name of the technology
  final String name;

  /// The icon representing the technology (for FontAwesome)
  final IconData? icon;

  /// The SVG icon name (for SVG icons)
  final String? svgName;

  /// The brand color of the technology
  final Color color;

  /// The type of icon (FontAwesome or SVG)
  final IconType iconType;
}
