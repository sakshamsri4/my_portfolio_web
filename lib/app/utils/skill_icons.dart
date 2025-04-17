import 'package:flutter/material.dart';

/// A utility class to manage skill category icons
class SkillIcons {
  /// Get icon for a skill category
  static Widget getSvgIcon(String category, {double size = 24, Color? color}) {
    IconData iconData;

    switch (category.toLowerCase()) {
      case 'mobile development':
        iconData = Icons.phone_android;
      case 'state management':
        iconData = Icons.data_usage;
      case 'backend & database':
        iconData = Icons.storage;
      case 'tools & workflow':
        iconData = Icons.build;
      default:
        iconData = Icons.code;
    }

    return Icon(
      iconData,
      size: size,
      color: color,
    );
  }
}
