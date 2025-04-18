import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// A reusable NeoPOP style social media button following CRED design principles
class NeoPOPSocialButton extends StatelessWidget {
  /// Creates a NeoPOP social button with shadow effect and hover animation
  const NeoPOPSocialButton({
    required this.icon,
    required this.color,
    required this.onPressed,
    this.size = 36,
    this.iconSize = 18,
    super.key,
  });

  /// The icon to display on the button
  final IconData icon;

  /// The background color of the button
  final Color color;

  /// Callback when button is pressed
  final VoidCallback onPressed;

  /// Size of the button container
  final double size;

  /// Size of the icon
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: const Duration(milliseconds: 300),
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, -2 * value),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Shadow container with offset
                  Positioned(
                    left: 3,
                    top: 3,
                    child: Container(
                      width: size,
                      height: size,
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(179),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  // Main container
                  Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: color.withAlpha(40),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Center(
                      child: FaIcon(
                        icon,
                        color: Colors.white,
                        size: iconSize,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
