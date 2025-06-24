#!/usr/bin/env dart
// This is a development script that needs to use print statements for output
// and async I/O operations for file verification
// ignore_for_file: avoid_print, avoid_slow_async_io, avoid_dynamic_calls, directives_ordering

import 'dart:convert';
import 'dart:io';

/// Production Analytics Verification Script
///
/// This script verifies that Firebase Analytics is properly configured
/// and deployed in the production environment.
void main(List<String> args) async {
  print('🔍 Firebase Analytics Production Verification');
  print('=' * 50);

  await verifyFirebaseConfiguration();
  await verifyDeploymentFiles();
  await verifyWebConfiguration();
  await generateTestInstructions();

  print('\n✅ Verification Complete!');
  print('=' * 50);
}

/// Verify Firebase configuration files
Future<void> verifyFirebaseConfiguration() async {
  print('\n📋 Checking Firebase Configuration...');

  // Check firebase_options.dart
  final firebaseOptionsFile = File('lib/firebase_options.dart');
  if (await firebaseOptionsFile.exists()) {
    final content = await firebaseOptionsFile.readAsString();

    print('✅ firebase_options.dart exists');

    // Check for required configuration
    final checks = [
      {'key': 'projectId', 'value': 'saksham-portfolio-ba828'},
      {'key': 'measurementId', 'value': 'G-VVVFQJL1WD'},
      {'key': 'appId', 'value': '1:51439261225:web:bb97fff3613e72ef96ae38'},
    ];

    for (final check in checks) {
      if (content.contains(check['value']!)) {
        print('✅ ${check['key']}: ${check['value']}');
      } else {
        print('❌ ${check['key']}: NOT FOUND');
      }
    }
  } else {
    print('❌ firebase_options.dart not found');
  }

  // Check firebase.json
  final firebaseJsonFile = File('firebase.json');
  if (await firebaseJsonFile.exists()) {
    print('✅ firebase.json exists');

    final content = await firebaseJsonFile.readAsString();
    final config = jsonDecode(content);

    if (config['hosting'] != null) {
      print('✅ Firebase Hosting configured');
      print('   Public directory: ${config['hosting']['public']}');
    }
  } else {
    print('❌ firebase.json not found');
  }

  // Check .firebaserc
  final firebasercFile = File('.firebaserc');
  if (await firebasercFile.exists()) {
    print('✅ .firebaserc exists');

    final content = await firebasercFile.readAsString();
    final config = jsonDecode(content);

    if (config['projects']?['default'] == 'saksham-portfolio-ba828') {
      print('✅ Default project: saksham-portfolio-ba828');
    } else {
      print('❌ Default project mismatch');
    }
  } else {
    print('❌ .firebaserc not found');
  }
}

/// Verify deployment files
Future<void> verifyDeploymentFiles() async {
  print('\n🚀 Checking Deployment Configuration...');

  // Check GitHub Actions workflow
  final workflowFile = File('.github/workflows/firebase-hosting-deploy.yml');
  if (await workflowFile.exists()) {
    print('✅ GitHub Actions workflow exists');

    final content = await workflowFile.readAsString();

    if (content.contains('flutter build web')) {
      print('✅ Flutter web build configured');
    }

    if (content.contains('FirebaseExtended/action-hosting-deploy')) {
      print('✅ Firebase hosting deploy action configured');
    }

    if (content.contains('saksham-portfolio-ba828')) {
      print('✅ Project ID in workflow: saksham-portfolio-ba828');
    }
  } else {
    print('❌ GitHub Actions workflow not found');
  }

  // Check pubspec.yaml dependencies
  final pubspecFile = File('pubspec.yaml');
  if (await pubspecFile.exists()) {
    final content = await pubspecFile.readAsString();

    if (content.contains('firebase_core:')) {
      print('✅ firebase_core dependency found');
    } else {
      print('❌ firebase_core dependency missing');
    }

    if (content.contains('firebase_analytics:')) {
      print('✅ firebase_analytics dependency found');
    } else {
      print('❌ firebase_analytics dependency missing');
    }
  }
}

/// Verify web-specific configuration
Future<void> verifyWebConfiguration() async {
  print('\n🌐 Checking Web Configuration...');

  // Check if build/web directory exists (after build)
  final buildWebDir = Directory('build/web');
  if (await buildWebDir.exists()) {
    print('✅ build/web directory exists');

    // Check for index.html
    final indexFile = File('build/web/index.html');
    if (await indexFile.exists()) {
      print('✅ index.html exists in build');

      final content = await indexFile.readAsString();

      // Check for Firebase SDK
      if (content.contains('firebase-app.js') || content.contains('firebase')) {
        print('✅ Firebase SDK references found in index.html');
      } else {
        print('⚠️  Firebase SDK references not found in index.html');
      }
    }

    // Check for main.dart.js
    final mainJsFile = File('build/web/main.dart.js');
    if (await mainJsFile.exists()) {
      print('✅ main.dart.js exists');
    } else {
      print('❌ main.dart.js not found');
    }
  } else {
    print('⚠️  build/web directory not found (run flutter build web first)');
  }

  // Check web/index.html template
  final webIndexFile = File('web/index.html');
  if (await webIndexFile.exists()) {
    print('✅ web/index.html template exists');

    final content = await webIndexFile.readAsString();

    // Check for Firebase configuration
    if (content.contains('firebase-config') ||
        content.contains('G-VVVFQJL1WD')) {
      print('✅ Firebase configuration in web template');
    } else {
      print('⚠️  Firebase configuration not found in web template');
    }
  }
}

/// Generate testing instructions
Future<void> generateTestInstructions() async {
  print('\n📝 Analytics Testing Instructions');
  print('-' * 40);

  print('''
🔧 IMMEDIATE VERIFICATION STEPS:

1. Build and Deploy:
   flutter build web --release
   firebase deploy --only hosting

2. Test Live Website:
   Visit: https://saksham-portfolio-ba828.web.app/#/home
   
3. Browser Developer Tools Check:
   - Open DevTools (F12)
   - Go to Network tab
   - Filter by "google-analytics" or "analytics"
   - Navigate the site and look for requests to:
     * https://www.google-analytics.com/g/collect
     * https://analytics.google.com/analytics/web/

4. Firebase DebugView (Real-time):
   - Go to: https://console.firebase.google.com/
   - Select: saksham-portfolio-ba828
   - Navigate: Analytics > DebugView
   - Visit: https://saksham-portfolio-ba828.web.app/#/home?debug=1
   - Events should appear in real-time

5. Console Debugging:
   - Add to URL: ?debug=1
   - Open browser console
   - Look for Firebase Analytics logs
   - Check for any error messages

📊 DATA PROCESSING TIMELINE:

- DebugView: Real-time (immediate)
- Standard Reports: 24-48 hours
- Audience Reports: 24-48 hours
- Custom Reports: 24-48 hours

🔍 TROUBLESHOOTING:

If no data appears:
1. Check ad blockers (disable temporarily)
2. Test in incognito/private mode
3. Verify measurement ID: G-VVVFQJL1WD
4. Check browser console for errors
5. Ensure cookies are enabled
6. Test from different devices/browsers

📈 EXPECTED EVENTS:

- screen_view (page navigation)
- button_click (navigation, CTA buttons)
- project_interaction (project cards)
- contact_interaction (contact form)
- file_download (CV download)
- social_media_click (social links)

🎯 SUCCESS CRITERIA:

✅ Events appear in DebugView within 5 minutes
✅ Network requests to Google Analytics
✅ No console errors related to Firebase
✅ Events include correct parameters
✅ User properties are set correctly

📞 SUPPORT:

If issues persist:
1. Check Firebase Console > Analytics > Data streams
2. Verify web stream is active
3. Check enhanced measurement settings
4. Review Firebase project permissions
''');
}

/// Helper function to check if a file contains specific content
Future<bool> fileContains(String filePath, String content) async {
  final file = File(filePath);
  if (!await file.exists()) return false;

  final fileContent = await file.readAsString();
  return fileContent.contains(content);
}
