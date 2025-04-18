import 'package:flutter/material.dart';
import 'package:my_portfolio_web/app/common/styles/app_styles.dart';

/// A reusable social media icon with hover animation
class SocialIcon extends StatefulWidget {
  /// Creates a social icon
  const SocialIcon({
    required this.icon,
    required this.onTap,
    this.color,
    this.size = 24,
    this.backgroundColor,
    super.key,
  });

  /// The icon to display
  final IconData icon;

  /// Callback when icon is tapped
  final VoidCallback onTap;

  /// Color of the icon
  final Color? color;

  /// Size of the icon
  final double size;

  /// Optional background color
  final Color? backgroundColor;

  @override
  State<SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AppAnimations.createHoverController(this);
    _scaleAnimation = AppAnimations.createScaleAnimation(
      _controller,
      end: 1.2,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final iconColor = widget.color ?? Theme.of(context).colorScheme.primary;

    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: GestureDetector(
              onTap: widget.onTap,
              child: Container(
                width: widget.size * 2,
                height: widget.size * 2,
                decoration: widget.backgroundColor != null
                    ? BoxDecoration(
                        color: widget.backgroundColor,
                        shape: BoxShape.circle,
                        boxShadow: AppShadows.cardShadow,
                      )
                    : null,
                child: Center(
                  child: Icon(
                    widget.icon,
                    color: iconColor,
                    size: widget.size,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
