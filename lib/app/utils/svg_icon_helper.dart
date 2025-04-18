import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A utility class to load and display SVG icons
class SvgIconHelper {
  /// Cache for loaded SVG strings
  static final Map<String, String> _svgCache = {};

  /// Load an SVG icon from assets
  static Future<SvgPicture> loadSvgIcon(
    String name, {
    double size = 24,
    Color? color,
  }) async {
    final assetPath = 'assets/tech_icon_svg/$name.svg';
    String svgString;

    // Check if SVG is already in cache
    if (_svgCache.containsKey(assetPath)) {
      svgString = _svgCache[assetPath]!;
    } else {
      try {
        // Load SVG from assets
        svgString = await rootBundle.loadString(assetPath);
        _svgCache[assetPath] = svgString;
      } catch (e) {
        // Return a placeholder if SVG not found
        return SvgPicture.string(
          '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-2h2v2zm0-4h-2V7h2v6z"/></svg>',
          width: size,
          height: size,
          colorFilter:
              color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
        );
      }
    }

    return SvgPicture.string(
      svgString,
      width: size,
      height: size,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }

  /// Get a widget that displays an SVG icon
  static Widget getSvgIcon(
    String name, {
    double size = 24,
    Color? color,
  }) {
    return FutureBuilder<SvgPicture>(
      future: loadSvgIcon(name, size: size, color: color),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return snapshot.data!;
        } else {
          // Return a placeholder while loading
          return SizedBox(
            width: size,
            height: size,
            child: Center(
              child: SizedBox(
                width: size / 2,
                height: size / 2,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: color ?? Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
