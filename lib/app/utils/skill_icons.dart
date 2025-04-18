import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// A utility class to manage skill category icons
class SkillIcons {
  /// Get icon for a skill category
  static Widget getSvgIcon(String category, {double size = 24, Color? color}) {
    IconData iconData;

    switch (category.toLowerCase()) {
      case 'flutter':
        iconData = FontAwesomeIcons.f;
      case 'mobile development':
        iconData = FontAwesomeIcons.mobileScreen;
      case 'state management':
        iconData = FontAwesomeIcons.cubes;
      case 'backend':
        iconData = FontAwesomeIcons.server;
      case 'database':
        iconData = FontAwesomeIcons.database;
      case 'ui/ux design':
        iconData = FontAwesomeIcons.penRuler;
      case 'ai integration':
        iconData = FontAwesomeIcons.brain;
      case 'ai tools':
        iconData = FontAwesomeIcons.robot;
      case 'devops':
        iconData = FontAwesomeIcons.gears;
      case 'testing':
        iconData = FontAwesomeIcons.vial;
      case 'performance':
        iconData = FontAwesomeIcons.gauge;
      case 'automation':
        iconData = FontAwesomeIcons.wandMagicSparkles;
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
