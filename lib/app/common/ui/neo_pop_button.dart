import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// A reusable NeoPOP style button following CRED-inspired design principles
/// with accessible focus/hover states and a tactile press animation.
class NeoPOPButton extends StatefulWidget {
  /// Creates a NeoPOP button with shadow effect.
  const NeoPOPButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    this.isPrimary = true,
    this.size = NeoPOPButtonSize.medium,
    this.isEnabled = true,
    this.isLoading = false,
    this.semanticLabel,
    this.borderRadius,
    super.key,
  });

  /// The text label to display on the button.
  final String label;

  /// The icon to display on the button.
  final IconData icon;

  /// Callback when button is pressed.
  final VoidCallback onPressed;

  /// Whether this is a primary (filled) or secondary (outlined) button.
  final bool isPrimary;

  /// Size variant of the button.
  final NeoPOPButtonSize size;

  /// Whether the button can be interacted with.
  final bool isEnabled;

  /// Whether to show a loading indicator and block interaction.
  final bool isLoading;

  /// Optional semantic label override for accessibility.
  final String? semanticLabel;

  /// Optional shape override; falls back to a friendly default radius.
  final BorderRadius? borderRadius;

  @override
  State<NeoPOPButton> createState() => _NeoPOPButtonState();
}

class _NeoPOPButtonState extends State<NeoPOPButton> {
  static const _animationDuration = Duration(milliseconds: 140);

  bool _isPressed = false;
  bool _isFocused = false;
  bool _isHovered = false;

  bool get _isInteractive => widget.isEnabled && !widget.isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final primaryColor = colorScheme.primary;
    final onPrimaryColor = colorScheme.onPrimary;
    final surfaceColor = colorScheme.surface;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    final horizontalPadding = _getHorizontalPadding(isMobile);
    final verticalPadding = _getVerticalPadding(isMobile);
    final iconSize = _getIconSize(isMobile);
    final fontSize = _getFontSize(isMobile);
    final gapSize = _getGapSize(isMobile);
    final borderRadius = widget.borderRadius ?? BorderRadius.circular(8);

    final mainColor = widget.isPrimary ? primaryColor : surfaceColor;
    final onMainColor = widget.isPrimary ? onPrimaryColor : primaryColor;
    final outlineColor = widget.isPrimary ? Colors.transparent : primaryColor;
    final shadowOffset = _isPressed ? 2.0 : 4.0;

    return Semantics(
      button: true,
      enabled: _isInteractive,
      label: widget.semanticLabel ?? widget.label,
      child: FocusableActionDetector(
        enabled: _isInteractive,
        onShowFocusHighlight: (value) => setState(() => _isFocused = value),
        onShowHoverHighlight: (value) => setState(() => _isHovered = value),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              AnimatedPositioned(
                duration: _animationDuration,
                curve: Curves.easeOut,
                left: shadowOffset,
                top: shadowOffset,
                child: ExcludeSemantics(
                  child: IgnorePointer(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: verticalPadding,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(
                          widget.isPrimary ? 0.18 : 0.12,
                        ),
                        borderRadius: borderRadius,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            widget.icon,
                            color: Colors.transparent,
                            size: iconSize,
                          ),
                          SizedBox(width: gapSize),
                          Text(
                            widget.label,
                            style: TextStyle(
                              color: Colors.transparent,
                              fontSize: fontSize,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: _isPressed ? const Offset(1.5, 1.5) : Offset.zero,
                child: Material(
                  color: Colors.transparent,
                  borderRadius: borderRadius,
                  child: InkWell(
                    borderRadius: borderRadius,
                    onTap: _isInteractive ? widget.onPressed : null,
                    onHighlightChanged: (value) =>
                        setState(() => _isPressed = value),
                    onHover: (value) {
                      if (_isInteractive) setState(() => _isHovered = value);
                    },
                    enableFeedback: _isInteractive,
                    splashColor: onMainColor.withOpacity(0.16),
                    highlightColor: onMainColor.withOpacity(0.1),
                    child: AnimatedContainer(
                      duration: _animationDuration,
                      curve: Curves.easeOut,
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: verticalPadding,
                      ),
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: borderRadius,
                        border: Border.all(
                          color: outlineColor,
                          width: widget.isPrimary ? 0 : 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withOpacity(
                              widget.isPrimary
                                  ? (_isHovered ? 0.3 : 0.24)
                                  : (_isHovered ? 0.16 : 0.12),
                            ),
                            blurRadius: _isPressed ? 6 : 10,
                            offset: Offset(0, _isPressed ? 3 : 6),
                          ),
                        ],
                        gradient: widget.isPrimary
                            ? LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  mainColor,
                                  primaryColor.withOpacity(0.92),
                                ],
                              )
                            : null,
                      ),
                      foregroundDecoration: _isFocused
                          ? BoxDecoration(
                              borderRadius: borderRadius,
                              border: Border.all(
                                color: onMainColor.withOpacity(0.3),
                                width: 2,
                              ),
                            )
                          : null,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (widget.isLoading)
                            SizedBox(
                              width: iconSize,
                              height: iconSize,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(onMainColor),
                              ),
                            )
                          else
                            FaIcon(
                              widget.icon,
                              color: onMainColor,
                              size: iconSize,
                            ),
                          SizedBox(width: gapSize),
                          Text(
                            widget.label,
                            style: theme.textTheme.labelLarge?.copyWith(
                                  color: onMainColor,
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: widget.isPrimary ? 0.5 : 0.2,
                                ) ??
                                TextStyle(
                                  color: onMainColor,
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: widget.isPrimary ? 0.5 : 0.2,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper methods to determine sizing based on button size and screen.
  double _getHorizontalPadding(bool isMobile) {
    switch (widget.size) {
      case NeoPOPButtonSize.small:
        return isMobile ? 16 : 20;
      case NeoPOPButtonSize.medium:
        return isMobile ? 20 : 28;
      case NeoPOPButtonSize.large:
        return isMobile ? 24 : 32;
    }
  }

  double _getVerticalPadding(bool isMobile) {
    switch (widget.size) {
      case NeoPOPButtonSize.small:
        return isMobile ? 10 : 12;
      case NeoPOPButtonSize.medium:
        return isMobile ? 12 : 16;
      case NeoPOPButtonSize.large:
        return isMobile ? 16 : 20;
    }
  }

  double _getIconSize(bool isMobile) {
    switch (widget.size) {
      case NeoPOPButtonSize.small:
        return isMobile ? 16 : 18;
      case NeoPOPButtonSize.medium:
        return isMobile ? 18 : 20;
      case NeoPOPButtonSize.large:
        return isMobile ? 20 : 24;
    }
  }

  double _getFontSize(bool isMobile) {
    switch (widget.size) {
      case NeoPOPButtonSize.small:
        return isMobile ? 13 : 14;
      case NeoPOPButtonSize.medium:
        return isMobile ? 14 : 16;
      case NeoPOPButtonSize.large:
        return isMobile ? 16 : 18;
    }
  }

  double _getGapSize(bool isMobile) {
    switch (widget.size) {
      case NeoPOPButtonSize.small:
        return isMobile ? 6 : 8;
      case NeoPOPButtonSize.medium:
        return isMobile ? 8 : 10;
      case NeoPOPButtonSize.large:
        return isMobile ? 10 : 12;
    }
  }
}

/// Size variants for NeoPOP buttons.
enum NeoPOPButtonSize {
  /// Small button for compact spaces.
  small,

  /// Medium button for standard usage.
  medium,

  /// Large button for primary actions.
  large,
}
