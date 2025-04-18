import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// A reusable NeoPOP style tech icon following CRED design principles
class NeoPOPTechIcon extends StatelessWidget {
  /// Creates a NeoPOP tech icon with shadow effect and hover animation
  const NeoPOPTechIcon({
    required this.icon,
    required this.name,
    required this.color,
    this.size,
    super.key,
  });

  /// The icon to display
  final IconData icon;

  /// The name of the technology
  final String name;

  /// The color associated with the technology
  final Color color;

  /// Optional size override (will use responsive sizing if null)
  final double? size;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final iconSize = size ?? (isMobile ? 60.0 : 70.0);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 300),
        builder: (context, value, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon with NeoPOP effect
              Transform.translate(
                offset: Offset(0, -2 * value),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Shadow container with offset
                    Positioned(
                      left: 3,
                      top: 3,
                      child: Container(
                        width: iconSize,
                        height: iconSize,
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha(150),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    // Main container
                    Container(
                      width: iconSize,
                      height: iconSize,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: color.withAlpha(40),
                            blurRadius: 8,
                            spreadRadius: 1,
                          ),
                        ],
                        border: Border.all(
                          color: color.withAlpha(50),
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: FaIcon(
                          icon,
                          color: color,
                          size: iconSize * 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              // Tech name with CRED-style typography
              Text(
                name,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(200),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
