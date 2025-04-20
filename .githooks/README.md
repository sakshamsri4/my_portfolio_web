# Git Hooks

This directory contains Git hooks for the project.

## Pre-commit Hook

The pre-commit hook automatically formats Dart files before committing. This helps ensure that all code in the repository follows the same formatting standards.

### Installation

To use the pre-commit hook, you need to configure Git to use the hooks in this directory:

```bash
git config core.hooksPath .githooks
chmod +x .githooks/pre-commit
```

### What it does

The pre-commit hook:

1. Identifies all staged Dart files
2. Runs `dart format --line-length 80` on those files
3. Adds the formatted files back to the staging area
4. Allows the commit to proceed

This ensures that all committed code is properly formatted according to the project's standards.

### Manual Formatting

If you prefer to format your code manually before committing, you can run:

```bash
dart format --line-length 80 lib test
```

This will format all Dart files in the `lib` and `test` directories.
