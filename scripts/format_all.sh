#!/bin/bash

# Color codes for output
GREEN='\033[0;32m'
BLUE='\033[0;36m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}Running auto-formatter for all Dart files...${NC}"

# Define problematic files that need special attention
PROBLEM_FILES=(
  "test/helpers/google_fonts_test_helper.dart"
  "test/mocks/app_theme_mock.dart"
  "test/mocks/svg_mock.dart"
)

# Format problem files first with extra attention
echo -e "${YELLOW}Formatting problematic files with special attention...${NC}"
for file in "${PROBLEM_FILES[@]}"; do
  if [ -f "$file" ]; then
    echo -e "  ${BLUE}Formatting $file${NC}"
    dart format --line-length 80 "$file"
    if [ $? -eq 0 ]; then
      echo -e "  ${GREEN}✓ Formatted successfully${NC}"
    else
      echo -e "  ${RED}✗ Formatting failed${NC}"
    fi
  else
    echo -e "  ${RED}✗ File not found: $file${NC}"
  fi
done

# Get a list of all Dart files in the project
DART_FILES=$(find lib test -name "*.dart")

if [ -n "$DART_FILES" ]; then
  echo -e "${BLUE}Formatting all remaining Dart files...${NC}"
  
  # Format all Dart files with an 80-character line length
  echo "$DART_FILES" | xargs dart format --line-length 80
  
  echo -e "${GREEN}Dart files formatted successfully.${NC}"
  
  # Count the number of files formatted
  FILE_COUNT=$(echo "$DART_FILES" | wc -l)
  echo -e "${YELLOW}Formatted $FILE_COUNT Dart files${NC}"
else
  echo -e "${YELLOW}No Dart files found to format.${NC}"
fi

# Verify formatting of problematic files as a final check
echo -e "${BLUE}Verifying format of problematic files...${NC}"
VERIFICATION_FAILED=0
for file in "${PROBLEM_FILES[@]}"; do
  if [ -f "$file" ]; then
    echo -e "  ${BLUE}Checking $file${NC}"
    dart format --line-length 80 --output=none --set-exit-if-changed "$file"
    if [ $? -eq 0 ]; then
      echo -e "  ${GREEN}✓ Correctly formatted${NC}"
    else
      echo -e "  ${RED}✗ Still has formatting issues${NC}"
      # Format one more time to be sure
      dart format --line-length 80 "$file"
      VERIFICATION_FAILED=1
    fi
  fi
done

if [ $VERIFICATION_FAILED -eq 1 ]; then
  echo -e "${RED}Warning: Some problem files may still have formatting issues.${NC}"
  echo -e "${YELLOW}Please run this script again or check these files manually.${NC}"
else
  echo -e "${GREEN}All files are properly formatted!${NC}"
fi

# Exit with success code
exit 0