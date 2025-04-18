import 'package:flutter/material.dart';
import 'package:my_portfolio_web/app/common/styles/app_styles.dart';

/// A reusable animated button with hover effects
class AnimatedButton extends StatefulWidget {
  /// Creates an animated button
  const AnimatedButton({
    required this.label,
    required this.onPressed,
    this.icon,
    this.style = AnimatedButtonStyle.primary,
    this.width,
    this.height = 48,
    super.key,
  });

  /// The label text for the button
  final String label;
  
  /// Callback when button is pressed
  final VoidCallback onPressed;
  
  /// Optional icon to display before the label
  final IconData? icon;
  
  /// Style of the button
  final AnimatedButtonStyle style;
  
  /// Optional fixed width for the button
  final double? width;
  
  /// Height of the button
  final double height;

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AppAnimations.createHoverController(this);
    _scaleAnimation = AppAnimations.createScaleAnimation(
      _controller,
      begin: 1.0,
      end: 1.03,
    );
    _elevationAnimation = AppAnimations.createElevationAnimation(
      _controller,
      begin: 0,
      end: 4,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    
    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: _buildButtonByStyle(primaryColor),
          );
        },
      ),
    );
  }
  
  Widget _buildButtonByStyle(Color primaryColor) {
    switch (widget.style) {
      case AnimatedButtonStyle.primary:
        return _buildPrimaryButton(primaryColor);
      case AnimatedButtonStyle.ghost:
        return _buildGhostButton(primaryColor);
      case AnimatedButtonStyle.neoPOP:
        return _buildNeoPOPButton(primaryColor);
    }
  }
  
  Widget _buildPrimaryButton(Color primaryColor) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: AppShadows.elevatedShadow(_elevationAnimation.value),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.icon != null) ...[
                  Icon(
                    widget.icon,
                    color: Colors.white,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  widget.label,
                  style: AppTextStyles.button,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildGhostButton(Color primaryColor) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: primaryColor,
              width: 1.5,
            ),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.icon != null) ...[
                  Icon(
                    widget.icon,
                    color: primaryColor,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  widget.label,
                  style: AppTextStyles.button.copyWith(
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildNeoPOPButton(Color primaryColor) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Shadow container with offset
          Positioned(
            left: 4,
            top: 4,
            child: Container(
              width: widget.width,
              height: widget.height,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.icon != null) ...[
                    Icon(
                      widget.icon,
                      color: Colors.transparent,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    widget.label,
                    style: AppTextStyles.button.copyWith(
                      color: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Main container
          Container(
            width: widget.width,
            height: widget.height,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: primaryColor, width: 2),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.icon != null) ...[
                  Icon(
                    widget.icon,
                    color: primaryColor,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  widget.label,
                  style: AppTextStyles.button.copyWith(
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Styles for the animated button
enum AnimatedButtonStyle {
  /// Filled button with primary color
  primary,
  
  /// Outlined button with transparent background
  ghost,
  
  /// NeoPOP style button with shadow offset
  neoPOP,
}
