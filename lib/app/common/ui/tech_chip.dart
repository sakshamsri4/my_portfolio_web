import 'package:flutter/material.dart';

/// A reusable chip for displaying technology names
class TechChip extends StatelessWidget {
  /// Creates a tech chip
  const TechChip({
    required this.label,
    this.isDarkMode = false,
    this.customColor,
    super.key,
  });

  /// The text to display in the chip
  final String label;

  /// Whether the chip is displayed on a dark background
  final bool isDarkMode;

  /// Optional custom color for the chip
  final Color? customColor;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    // Determine text color based on theme and isDarkMode flag
    final textColor = isDarkMode || isDarkTheme ? Colors.white70 : primaryColor;

    // Determine background color based on theme and isDarkMode flag
    final backgroundColor = isDarkMode
        ? Colors.white.withAlpha(26) // 0.1 opacity for dark mode
        : primaryColor.withAlpha(isDarkTheme ? 40 : 20);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: customColor ?? backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: isDarkMode
            ? null
            : Border.all(
                color: primaryColor.withAlpha(isDarkTheme ? 70 : 50),
              ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
