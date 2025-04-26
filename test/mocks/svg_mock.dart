import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    TestWidgetsFlutterBinding.ensureInitialized();

    // Mock the SVG plugin channel
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMessageHandler('plugins.flutter.io/svg', (message) async {
      return null;
    });

    // Also mock the asset bundle to handle asset loading in tests
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('flutter/assets'),
            (MethodCall methodCall) async {
      if (methodCall.method == 'loadString') {
        // Return a simple SVG string for any asset
        return '''
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
          <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2z"/>
        </svg>
        ''';
      }
      return null;
    });
  }

  /// Cleanup SVG mocking after tests
  static void cleanupSvgMocking() {
    // Clean up the SVG plugin channel
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMessageHandler('plugins.flutter.io/svg', null);

    // Clean up the asset bundle mock
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('flutter/assets'), null);
  }
}
