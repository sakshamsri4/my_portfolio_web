#!/bin/bash

# Color codes for output
GREEN='\033[0;32m'
BLUE='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${BLUE}Running pre-commit hooks...${NC}"

# Get list of staged Dart files
STAGED_DART_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep '\.dart$')

if [ -n "$STAGED_DART_FILES" ]; then
  echo -e "${BLUE}Formatting staged Dart files...${NC}"
  
  # Format all staged Dart files with an 80-character line length
  echo "$STAGED_DART_FILES" | xargs dart format --line-length 80
  
  # Add the formatted files back to the staging area
  echo "$STAGED_DART_FILES" | xargs git add
  
  echo -e "${GREEN}Dart files formatted and staged.${NC}"
fi

# Exit with success code
exit 0