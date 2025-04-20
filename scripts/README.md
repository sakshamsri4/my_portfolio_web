# Scripts

This directory contains utility scripts for the project.

## Pre-Push Script

The `pre-push.sh` script runs before pushing code to the remote repository to catch issues early.

### What it does:

1. Formats code using `dart format`
2. Runs Flutter analyzer to check for code issues
3. Runs tests with very_good_cli (with minimum 10% coverage check)
   - Requires very_good_cli to be installed
   - Runs tests only on stable directories to avoid known failures
   - Enforces minimum 10% code coverage
4. Checks for spelling issues using cspell (if installed)
5. Checks for unused dependencies
6. Checks for outdated dependencies

### How to use:

#### Manual execution:

```bash
./scripts/pre-push.sh
```

#### Set up as a Git hook:

1. Create a symbolic link to the script in the `.git/hooks` directory:

```bash
ln -sf ../../scripts/pre-push.sh .git/hooks/pre-push
```

2. Make sure the script is executable:

```bash
chmod +x scripts/pre-push.sh
```

Now the script will run automatically before each `git push` command.

### Requirements:

- Flutter SDK
- Dart SDK
- very_good_cli (required, for enhanced test coverage checks)
  - Install with: `dart pub global activate very_good_cli`
- cspell (optional, for spell checking)
  - Install with: `npm install -g cspell`

### Troubleshooting:

If you encounter issues with the pre-push hook:

1. Make sure very_good_cli is installed and accessible in your PATH:
   ```bash
   dart pub global activate very_good_cli
   ```

2. If tests are failing but you need to push anyway (e.g., to share work in progress):
   ```bash
   git push --no-verify
   ```
   Note: Use this sparingly and only when necessary.

3. To run only the stable tests manually:
   ```bash
   make test-stable
   ```

### Benefits of using very_good_cli:

- Automatically generates coverage reports
- Enforces minimum coverage thresholds
- Provides better test output formatting
- Supports test filtering by tags
- Optimizes test performance
