import 'package:flutter/material.dart';

/// Model class for tech stack items
class TechStackItem {
  /// Creates a tech stack item
  const TechStackItem({
    required this.name,
    required this.icon,
    required this.color,
  });

  /// The name of the technology
  final String name;

  /// The icon representing the technology
  final IconData icon;

  /// The brand color of the technology
  final Color color;
}
