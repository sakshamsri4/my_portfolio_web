#!/bin/bash

# Script to extract potential technical terms from the codebase
# and suggest additions to .cspell.json

echo "Extracting potential technical terms from the codebase..."

# Create a temporary file to store potential terms
TEMP_FILE=$(mktemp)

# Extract camelCase and PascalCase identifiers from Dart files
find . -name "*.dart" -type f | xargs grep -o '\b[A-Z][a-z]\+[A-Za-z0-9]*\b' | sort | uniq > "$TEMP_FILE"

# Extract words that might be technical terms from markdown files
find . -name "*.md" -type f | xargs grep -o '\b[a-z]\+[A-Z][A-Za-z0-9]*\b' | sort | uniq >> "$TEMP_FILE"

# Extract words surrounded by backticks from markdown files (likely code terms)
find . -name "*.md" -type f | grep -o '`[^`]\+`' | sed 's/`//g' | sort | uniq >> "$TEMP_FILE"

# Get current words from .cspell.json
CURRENT_WORDS=$(grep -o '"[^"]\+"' .cspell.json | sed 's/"//g' | sort | uniq)

# Find words that are not already in .cspell.json
echo "Potential technical terms to add to .cspell.json:"
echo "================================================"
cat "$TEMP_FILE" | sort | uniq | while read -r word; do
  if ! echo "$CURRENT_WORDS" | grep -q "^$word$"; then
    echo "$word"
  fi
done

# Clean up
rm "$TEMP_FILE"

echo ""
echo "To add these terms to .cspell.json, edit the file and add them to the 'words' array."
echo "Example:"
echo "  \"words\": ["
echo "    \"existingWord\","
echo "    \"newTechnicalTerm\""
echo "  ],"
