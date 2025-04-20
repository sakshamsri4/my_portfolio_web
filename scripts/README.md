# Scripts

This directory contains utility scripts for the project.

## Pre-Push Script

The `pre-push.sh` script runs before pushing code to the remote repository to catch issues early.

### What it does:

1. Formats code using `dart format`
2. Runs Flutter analyzer to check for code issues
3. Runs tests to ensure all tests pass
4. Checks for spelling issues using cspell (if installed)

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
- cspell (optional, for spell checking)
  - Install with: `npm install -g cspell`
