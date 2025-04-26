#!/bin/bash

# Check if npx is installed
if ! command -v npx &> /dev/null; then
    echo "Error: npx is not installed. Please install Node.js and npm."
    exit 1
fi

echo "Running spell check..."

# Run cspell on specific file types in the repository
npx cspell "**/*.{dart,md,yaml,json,txt}" --config .cspell.json

# Check the exit code
if [ $? -eq 0 ]; then
    echo "✅ Spell check passed!"
    exit 0
else
    echo "❌ Spell check failed. Please fix the spelling issues before committing."
    exit 1
fi
