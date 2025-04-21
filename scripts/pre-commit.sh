#!/bin/bash

# Enable immediate exit on error
set -e

# Color codes for output
GREEN='\033[0;32m'
BLUE='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}Running pre-commit hooks...${NC}"

# Get list of staged Dart files
STAGED_DART_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep '\.dart$')

if [ -n "$STAGED_DART_FILES" ]; then
  echo -e "${BLUE}Formatting staged Dart files...${NC}"
  
  # Format all staged Dart files with an 80-character line length
  echo "$STAGED_DART_FILES" | xargs dart format --line-length 80
  
  # If dart format fails, abort the commit
  RET=$?
  if [ $RET -ne 0 ]; then
    echo -e "${RED}Dart formatting error. Commit aborted.${NC}"
    exit $RET
  fi
  
  # Add the formatted files back to the staging area
  echo "$STAGED_DART_FILES" | xargs git add
  
  echo -e "${GREEN}Dart files formatted and staged.${NC}"
fi

# Exit with success code
exit 0