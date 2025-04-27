#!/bin/bash

# Script to generate app icons using flutter_launcher_icons package

# Ensure the script exits if any command fails
set -e

echo "Generating app icons..."

# Run flutter_launcher_icons
flutter pub run flutter_launcher_icons

echo "App icons generated successfully!"

# Verify the generated files
echo "Verifying generated files..."

# Check for Android icons
if [ -d "android/app/src/main/res/mipmap-hdpi" ]; then
  echo "✅ Android icons generated"
else
  echo "❌ Android icons not found"
fi

# Check for iOS icons
if [ -d "ios/Runner/Assets.xcassets/AppIcon.appiconset" ]; then
  echo "✅ iOS icons generated"
else
  echo "❌ iOS icons not found"
fi

# Check for web icons
if [ -f "web/icons/Icon-192.png" ] && [ -f "web/icons/Icon-512.png" ]; then
  echo "✅ Web icons generated"
else
  echo "❌ Web icons not found"
fi

echo "Icon generation complete!"
