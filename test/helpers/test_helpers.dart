import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

/// Setup test environment for all tests
void setupTestEnvironment() {
  TestWidgetsFlutterBinding.ensureInitialized();
  
  // Disable Google Fonts for tests
  GoogleFonts.config.allowRuntimeFetching = false;
  
  // Mock asset bundle
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
    const MethodChannel('flutter/assets'),
    (MethodCall methodCall) async {
      if (methodCall.method == 'loadString') {
        if (methodCall.arguments.toString().contains('.svg')) {
          // Return a simple SVG string for any SVG file
          return '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2z"/></svg>';
        }
        // Return empty string for other asset types
        return '{}';
      } else if (methodCall.method == 'getAssetBundlePathsInDirectory') {
        // Return empty list for directory listing
        return <String>[];
      }
      return null;
    },
  );
}

/// Clean up test environment after tests
void cleanupTestEnvironment() {
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
    const MethodChannel('flutter/assets'),
    null,
  );
}

/// Build a test widget with proper theme and size
Widget buildTestWidget({
  required Widget child,
  Size size = const Size(800, 600),
}) {
  return MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.light(
        primary: Colors.purple,
        secondary: Colors.purpleAccent,
      ),
      textTheme: const TextTheme(
        displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(fontSize: 16),
      ),
    ),
    home: Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: child,
        ),
      ),
    ),
  );
}

/// Set up screen size for tests
void setScreenSize(WidgetTester tester, Size size) {
  tester.binding.window.physicalSizeTestValue = size;
  tester.binding.window.devicePixelRatioTestValue = 1.0;
  addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
}
