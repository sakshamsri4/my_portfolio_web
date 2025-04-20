import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Sets up mocks for SVG loading in tests
void mockSvgLoading() {
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
    const MethodChannel('flutter/assets'),
    (MethodCall methodCall) async {
      if (methodCall.method == 'loadString') {
        final path = methodCall.arguments as String;

        // Return a simple SVG string for any SVG path
        if (path.endsWith('.svg')) {
          return _getMockSvg(path);
        }
      }
      return null;
    },
  );
}

/// Cleans up SVG mocks after tests
void cleanupSvgMock() {
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
    const MethodChannel('flutter/assets'),
    null,
  );
}

/// Returns a mock SVG string based on the path
String _getMockSvg(String path) {
  // Extract the file name from the path
  final fileName = path.split('/').last.split('.').first;

  // Return different SVGs based on the file name
  switch (fileName) {
    case 'flutter':
      return '''
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
          <path d="M12 2L2 12h4l6-6 6 6h4L12 2z"/>
        </svg>
      ''';
    case 'dart':
      return '''
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
          <path d="M4 4h16v16H4z"/>
        </svg>
      ''';
    case 'nonexistent':
      throw Exception('File not found');
    default:
      return '''
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
          <circle cx="12" cy="12" r="10"/>
        </svg>
      ''';
  }
}
