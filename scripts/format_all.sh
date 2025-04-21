#!/bin/bash

# Color codes for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${BLUE}Running auto-formatter for all Dart files...${NC}"

# Problematic files - these require special attention
PROBLEMATIC_FILES=(
  "test/helpers/google_fonts_test_helper.dart"
  "test/mocks/app_theme_mock.dart"
  "test/mocks/svg_mock.dart"
)

# Function to format a specific file
format_file() {
  echo -e "  Formatting $1"
  dart format --line-length 80 "$1"
  
  # Check if formatting was successful
  if [ $? -eq 0 ]; then
    echo -e "  ${GREEN}✓ Formatted successfully${NC}"
  else
    echo -e "  ${RED}✗ Formatting failed${NC}"
    return 1
  fi
  return 0
}

# First handle problematic files with special attention
echo -e "${YELLOW}Formatting problematic files with special attention...${NC}"
for file in "${PROBLEMATIC_FILES[@]}"; do
  if [ -f "$file" ]; then
    format_file "$file"
  else
    echo -e "  ${YELLOW}⚠ File not found: $file${NC}"
  fi
done

# Format all Dart files in the entire project
echo -e "${BLUE}Formatting all Dart files in the project...${NC}"
find . -name "*.dart" -type f | xargs dart format --line-length 80
echo -e "${GREEN}Dart files formatted successfully.${NC}"

# Count how many files were formatted
TOTAL_FORMATTED=$(find . -name "*.dart" -type f | wc -l)
echo -e "${GREEN}Formatted      $TOTAL_FORMATTED Dart files${NC}"

# Special verification for problematic files
echo -e "${YELLOW}Verifying format of problematic files...${NC}"
for file in "${PROBLEMATIC_FILES[@]}"; do
  if [ -f "$file" ]; then
    echo -e "  Checking $file"
    dart format --line-length 80 --set-exit-if-changed "$file"
    if [ $? -eq 0 ]; then
      echo -e "  ${GREEN}✓ Correctly formatted${NC}"
    else
      echo -e "  ${RED}✗ Formatting issues remain${NC}"
      echo -e "${RED}Failed to format $file correctly.${NC}"
      exit 1
    fi
  fi
done

echo -e "${GREEN}All files are properly formatted!${NC}"
exit 0