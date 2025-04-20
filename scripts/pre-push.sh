#!/bin/bash

# Pre-push script to run tests and check for issues before pushing

echo "Running pre-push checks..."

# Format code
echo "Formatting code..."
dart format .
if [ $? -ne 0 ]; then
  echo "Error: Code formatting failed"
  exit 1
fi

# Run analyzer
echo "Running Flutter analyzer..."
flutter analyze
if [ $? -ne 0 ]; then
  echo "Error: Flutter analyzer found issues"
  exit 1
fi

# Run tests
echo "Running tests..."
flutter test
if [ $? -ne 0 ]; then
  echo "Error: Tests failed"
  exit 1
fi

# Check for spelling issues
if command -v cspell &> /dev/null; then
  echo "Checking spelling..."
  cspell "**/*.{dart,md,yaml,json}" --no-progress
  if [ $? -ne 0 ]; then
    echo "Error: Spelling issues found"
    exit 1
  fi
else
  echo "Warning: cspell not installed. Skipping spelling check."
  echo "To install: npm install -g cspell"
fi

echo "All pre-push checks passed!"
exit 0
