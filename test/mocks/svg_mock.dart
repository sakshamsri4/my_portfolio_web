import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';

/// Mock implementation for SVG functionality in tests
class SvgMock {
  /// Create a mock SVG picture for testing
  static SvgPicture createMockSvg({
    required String assetName,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Color? color,
  }) {
    return SvgPicture.string(
      '''
      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
        <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2z"/>
      </svg>
      ''',
      width: width,
      height: height,
      fit: fit,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }

  /// Setup SVG mocking for the test environment
  static void setupSvgMocking() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMessageHandler('plugins.flutter.io/svg', (message) async {
      return null;
    });
  }

  /// Cleanup SVG mocking after tests
  static void cleanupSvgMocking() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMessageHandler('plugins.flutter.io/svg', null);
  }
}
