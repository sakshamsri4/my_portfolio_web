import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// A utility class to manage skill category icons
class SkillIcons {
  /// Get icon for a skill category
  static Widget getSvgIcon(String category, {double size = 24, Color? color}) {
    IconData iconData;

    switch (category.toLowerCase()) {
      case 'mobile development':
        iconData = FontAwesomeIcons.mobileScreen;
      case 'state management':
        iconData = FontAwesomeIcons.cubes;
      case 'backend & database':
        iconData = FontAwesomeIcons.database;
      case 'tools & workflow':
        iconData = FontAwesomeIcons.screwdriverWrench;
      case 'ai & machine learning':
        iconData = FontAwesomeIcons.brain;
      case 'ai tools & agents':
        iconData = FontAwesomeIcons.robot;
      case 'automation & devops':
        iconData = FontAwesomeIcons.gears;
      default:
        iconData = FontAwesomeIcons.code;
    }

    return FaIcon(
      iconData,
      size: size,
      color: color,
    );
  }
}
