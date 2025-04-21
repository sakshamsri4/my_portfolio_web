#!/bin/bash

# Color codes for output
GREEN='\033[0;32m'
BLUE='\033[0;36m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}Running auto-formatter for all Dart files...${NC}"

# Get a list of all Dart files in the project
DART_FILES=$(find lib test -name "*.dart")

if [ -n "$DART_FILES" ]; then
  echo -e "${BLUE}Formatting all Dart files...${NC}"
  
  # Format all Dart files with an 80-character line length
  echo "$DART_FILES" | xargs dart format --line-length 80
  
  echo -e "${GREEN}Dart files formatted successfully.${NC}"
  
  # Count the number of files formatted
  FILE_COUNT=$(echo "$DART_FILES" | wc -l)
  echo -e "${YELLOW}Formatted $FILE_COUNT Dart files${NC}"
else
  echo -e "${YELLOW}No Dart files found to format.${NC}"
fi

# Exit with success code
exit 0