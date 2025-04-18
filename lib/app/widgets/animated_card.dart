import 'package:flutter/material.dart';
import 'package:my_portfolio_web/app/common/styles/app_styles.dart';

/// A reusable animated card with hover effects
class AnimatedCard extends StatefulWidget {
  /// Creates an animated card
  const AnimatedCard({
    required this.child,
    this.onTap,
    this.borderRadius = 16,
    this.elevation = 2,
    this.color = Colors.white,
    this.padding = const EdgeInsets.all(16),
    this.accentColor,
    super.key,
  });

  /// The content of the card
  final Widget child;

  /// Optional callback when card is tapped
  final VoidCallback? onTap;

  /// Border radius of the card
  final double borderRadius;

  /// Base elevation of the card
  final double elevation;

  /// Background color of the card
  final Color color;

  /// Padding inside the card
  final EdgeInsetsGeometry padding;

  /// Optional accent color for glow effect
  final Color? accentColor;

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _elevationAnimation;
  late final Animation<double> _brightnessAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AppAnimations.createHoverController(this);
    _elevationAnimation = AppAnimations.createElevationAnimation(
      _controller,
      begin: widget.elevation,
      end: widget.elevation + 6,
    );
    _brightnessAnimation = AppAnimations.createBrightnessAnimation(
      _controller,
      end: 0.3,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accentColor =
        widget.accentColor ?? Theme.of(context).colorScheme.primary;

    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, -_elevationAnimation.value / 2),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.onTap,
                borderRadius: BorderRadius.circular(widget.borderRadius),
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    boxShadow: [
                      ...AppShadows.elevatedShadow(_elevationAnimation.value),
                      AppShadows.coloredGlow(
                        color: accentColor,
                        opacity: 0.1 + (_brightnessAnimation.value * 0.2),
                        blurRadius: 12 + (_elevationAnimation.value * 3),
                      ),
                    ],
                  ),
                  padding: widget.padding,
                  child: widget.child,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
