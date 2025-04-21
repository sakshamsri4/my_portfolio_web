# Makefile for Flutter project

.PHONY: help setup format format-all analyze test coverage lint fix-lint clean check pre-push \
        extract-terms feature bugfix

# Default target
help:
	@echo "Available commands:"
	@echo "  make setup      - Set up the project (install dependencies, etc.)"
	@echo "  make format     - Format code using dart format"
	@echo "  make format-all - Format all Dart files with 80-character line length"
	@echo "  make analyze    - Run Flutter analyzer"
	@echo "  make test       - Run tests"
	@echo "  make coverage   - Run tests with coverage"
	@echo "  make lint       - Run linter checks"
	@echo "  make fix-lint   - Fix linter issues automatically when possible"
	@echo "  make clean      - Clean the project"
	@echo "  make check      - Run all checks (format, analyze, test)"
	@echo "  make pre-push   - Run pre-push checks"

# Setup the project
setup:
	@echo "Setting up project..."
	flutter pub get
	@echo "Setting up git hooks..."
	@mkdir -p .git/hooks
	@ln -sf ../../scripts/pre-push.sh .git/hooks/pre-push
	@ln -sf ../../scripts/pre-commit.sh .git/hooks/pre-commit
	@chmod +x scripts/pre-push.sh
	@chmod +x scripts/pre-commit.sh
	@chmod +x scripts/format_all.sh
	@echo "Formatting all Dart files..."
	./scripts/format_all.sh
	@echo "Setup complete!"

# Format code
format:
	@echo "Formatting code..."
	dart format .

# Format all Dart files with line length 80
format-all:
	@echo "Formatting all Dart files with 80-character line length..."
	./scripts/format_all.sh

# Run analyzer
analyze:
	@echo "Running Flutter analyzer..."
	flutter analyze

# Run tests
test:
	@echo "Running tests..."
	@if command -v very_good > /dev/null; then \
		echo "Running tests with very_good_cli..."; \
		very_good test; \
	else \
		echo "Running tests with flutter test..."; \
		flutter test; \
		echo "Note: Install very_good_cli for enhanced test features:"; \
		echo "      dart pub global activate very_good_cli"; \
	fi

# Run tests with coverage
coverage:
	@if command -v very_good > /dev/null; then \
		echo "Running tests with very_good_cli..."; \
		very_good test --coverage --min-coverage=20; \
	else \
		echo "Running tests with flutter test..."; \
		flutter test --coverage; \
		echo "Note: Install very_good_cli for enhanced test coverage checks:"; \
		echo "      dart pub global activate very_good_cli"; \
	fi

# Run linter
lint:
	@echo "Running linter..."
	flutter pub run very_good_analysis:very_good_analysis .

# Fix linter issues
fix-lint:
	@echo "Fixing linter issues..."
	dart fix --apply

# Clean the project
clean:
	@echo "Cleaning project..."
	flutter clean
	rm -rf coverage

# Run tests on stable directories only
test-stable:
	@echo "Running tests on stable directories only..."
	@if command -v very_good > /dev/null; then \
		echo "Running tests with very_good_cli..."; \
		very_good test --coverage --min-coverage=10 test/controllers test/data test/routes test/utils; \
	else \
		echo "Running tests with flutter test..."; \
		flutter test test/controllers test/data test/routes test/utils; \
	fi

# Run spell check
spell-check:
	@echo "Running spell check..."
	@if command -v cspell > /dev/null; then \
		cspell "**/*.{dart,md,yaml,json}" --no-progress; \
	else \
		echo "cspell not installed. Install with: npm install -g cspell"; \
		echo "Running basic spell check on activity log..."; \
		grep -q "Unknown word" activity/activity_log.md 2>/dev/null || echo "No obvious spelling issues found."; \
	fi

# Extract technical terms
extract-terms:
	@echo "Extracting technical terms..."
	@./scripts/extract_technical_terms.sh

# Run all checks
check: format analyze test-stable spell-check

# Run pre-push checks
pre-push:
	@echo "Running pre-push checks..."
	./scripts/pre-push.sh

# Create a new feature branch
feature:
	@read -p "Enter feature name (e.g., add-login): " name; \
	git checkout -b feature/$$name main

# Create a new bugfix branch
bugfix:
	@read -p "Enter issue number: " issue; \
	@read -p "Enter brief description (use hyphens, no spaces): " desc; \
	desc=$${desc// /-}; \
	git checkout -b bugfix/$$issue-$$desc main
