import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// A reusable NeoPOP style button following CRED design principles
class NeoPOPButton extends StatelessWidget {
  /// Creates a NeoPOP button with shadow effect
  const NeoPOPButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    this.isPrimary = true,
    this.size = NeoPOPButtonSize.medium,
    super.key,
  });

  /// The text label to display on the button
  final String label;

  /// The icon to display on the button
  final IconData icon;

  /// Callback when button is pressed
  final VoidCallback onPressed;

  /// Whether this is a primary (colored) or secondary (outlined) button
  final bool isPrimary;

  /// Size variant of the button
  final NeoPOPButtonSize size;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    // Determine padding based on size and screen width
    final horizontalPadding = _getHorizontalPadding(isMobile);
    final verticalPadding = _getVerticalPadding(isMobile);
    final iconSize = _getIconSize(isMobile);
    final fontSize = _getFontSize(isMobile);

    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Shadow container with offset
          Positioned(
            left: 4,
            top: 4,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(
                    icon,
                    color: Colors.transparent,
                    size: iconSize,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.transparent,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Main container
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            decoration: BoxDecoration(
              color: isPrimary ? primaryColor : Colors.white,
              borderRadius: BorderRadius.circular(4),
              border:
                  isPrimary ? null : Border.all(color: primaryColor, width: 2),
              boxShadow: isPrimary
                  ? [
                      BoxShadow(
                        color: primaryColor.withAlpha(40),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ]
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  icon,
                  color: isPrimary ? Colors.white : primaryColor,
                  size: iconSize,
                ),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    color: isPrimary ? Colors.white : primaryColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper methods to determine sizing based on button size and screen
  double _getHorizontalPadding(bool isMobile) {
    switch (size) {
      case NeoPOPButtonSize.small:
        return isMobile ? 16 : 20;
      case NeoPOPButtonSize.medium:
        return isMobile ? 20 : 28;
      case NeoPOPButtonSize.large:
        return isMobile ? 24 : 32;
    }
  }

  double _getVerticalPadding(bool isMobile) {
    switch (size) {
      case NeoPOPButtonSize.small:
        return isMobile ? 8 : 12;
      case NeoPOPButtonSize.medium:
        return isMobile ? 12 : 16;
      case NeoPOPButtonSize.large:
        return isMobile ? 16 : 20;
    }
  }

  double _getIconSize(bool isMobile) {
    switch (size) {
      case NeoPOPButtonSize.small:
        return isMobile ? 14 : 16;
      case NeoPOPButtonSize.medium:
        return isMobile ? 18 : 20;
      case NeoPOPButtonSize.large:
        return isMobile ? 20 : 24;
    }
  }

  double _getFontSize(bool isMobile) {
    switch (size) {
      case NeoPOPButtonSize.small:
        return isMobile ? 12 : 14;
      case NeoPOPButtonSize.medium:
        return isMobile ? 14 : 16;
      case NeoPOPButtonSize.large:
        return isMobile ? 16 : 18;
    }
  }
}

/// Size variants for NeoPOP buttons
enum NeoPOPButtonSize {
  /// Small button for compact spaces
  small,

  /// Medium button for standard usage
  medium,

  /// Large button for primary actions
  large,
}
