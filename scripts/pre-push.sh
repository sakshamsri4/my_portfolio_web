#!/bin/bash

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${BLUE}Running pre-push checks...${NC}"

# Define protected branches as an array
readonly PROTECTED_BRANCHES=("main" "master")

# Get the current branch
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Check if the current branch is a protected branch
for branch in "${PROTECTED_BRANCHES[@]}"; do
  if [ "$CURRENT_BRANCH" = "$branch" ]; then
    echo -e "${RED}You're attempting to push directly to $CURRENT_BRANCH branch, which is not allowed.${NC}"
    echo -e "${YELLOW}Please create a feature branch and submit a pull request instead.${NC}"
    echo -e "${YELLOW}See docs/git_workflow.md for more information.${NC}"
    exit 1
  fi
done

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
      echo -e "${RED}There was an issue formatting $file. This will cause CI to fail.${NC}"
      echo -e "${YELLOW}Please fix the formatting issues manually and try again.${NC}"
      exit 1
    fi
  fi
done

# Format the code using dart format
echo -e "${BLUE}Formatting all code...${NC}"
dart format --line-length 80 .
FORMAT_EXIT_CODE=$?
if [ $FORMAT_EXIT_CODE -ne 0 ]; then
  echo -e "${RED}Code formatting failed. Please fix the issues and try again.${NC}"
  exit 1
fi
echo -e "${GREEN}Code formatting successful.${NC}"

# Verify formatting of problematic files as a final check
echo -e "${BLUE}Verifying format of problematic files...${NC}"
for file in "${PROBLEM_FILES[@]}"; do
  if [ -f "$file" ]; then
    echo -e "  ${BLUE}Checking $file${NC}"
    dart format --line-length 80 --output=none --set-exit-if-changed "$file"
    if [ $? -ne 0 ]; then
      echo -e "  ${RED}✗ $file still has formatting issues!${NC}"
      echo -e "${RED}This will cause CI to fail. Running format one more time...${NC}"
      dart format --line-length 80 "$file"
      # Verify again
      dart format --line-length 80 --output=none --set-exit-if-changed "$file"
      if [ $? -ne 0 ]; then
        echo -e "${RED}CRITICAL: Cannot fix formatting issues in $file${NC}"
        echo -e "${YELLOW}Please fix this file manually before pushing.${NC}"
        exit 1
      fi
    else
      echo -e "  ${GREEN}✓ Correctly formatted${NC}"
    fi
  fi
done

# Run the Flutter analyzer
echo -e "${BLUE}Running Flutter analyzer...${NC}"
flutter analyze
ANALYZE_EXIT_CODE=$?
if [ $ANALYZE_EXIT_CODE -ne 0 ]; then
  echo -e "${RED}Flutter analyzer found issues. Please fix them and try again.${NC}"
  exit 1
fi
echo -e "${GREEN}Flutter analyzer ran successfully.${NC}"

# Run the tests
echo -e "${BLUE}Running tests...${NC}"
flutter test
TEST_EXIT_CODE=$?
if [ $TEST_EXIT_CODE -ne 0 ]; then
  echo -e "${RED}Tests failed. Please fix the failing tests and try again.${NC}"
  exit 1
fi
echo -e "${GREEN}Tests passed successfully.${NC}"

# Check if changes have been made to the codebase but not to the activity log
echo -e "${BLUE}Checking activity log updates...${NC}"

# Get list of changed files excluding the activity log
CHANGED_FILES=$(git diff --cached --name-only | grep -v "docs/activity/activity_log.md")

# Check if activity log was updated
ACTIVITY_LOG_UPDATED=$(git diff --cached --name-only | grep "docs/activity/activity_log.md")

# If there are code changes but no activity log update, warn the user
if [ -n "$CHANGED_FILES" ] && [ -z "$ACTIVITY_LOG_UPDATED" ]; then
  echo -e "${RED}WARNING: You've made code changes but didn't update the activity log.${NC}"
  echo -e "${YELLOW}Please update docs/activity/activity_log.md with your changes before pushing.${NC}"
  echo -e ""
  echo -e "${BLUE}Changes detected in:${NC}"
  git diff --cached --name-only | grep -v "docs/activity/activity_log.md" | sed 's/^/  /'
  
  # Ask the user if they want to continue anyway
  read -p "Do you want to proceed without updating the activity log? (y/N): " response
  if [[ ! "$response" =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Push cancelled. Please update the activity log and try again.${NC}"
    exit 1
  fi
  
  echo -e "${YELLOW}Proceeding without activity log update. Please remember to update it later.${NC}"
fi

echo -e "${GREEN}All pre-push checks passed!${NC}"
exit 0
