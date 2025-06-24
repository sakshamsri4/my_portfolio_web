# My Portfolio Web

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

A professional portfolio website built with Flutter, showcasing my skills, projects, and experience as a Flutter developer.

## Features 🌟

- **Modern UI Design**: CRED-inspired NeoPOP design with 3D effects and custom styling
- **Responsive Layout**: Works seamlessly on mobile, tablet, and desktop devices
- **Single-Page Experience**: Smooth scrolling navigation between sections
- **Interactive Elements**: Animated text, hover effects, and interactive components
- **Skills Showcase**: Categorized skills with custom icons and styling
- **Project Gallery**: Featured projects with detailed descriptions and links
- **Career Timeline**: Visual representation of professional experience
- **Contact Information**: Easy access to email, phone, and social media profiles
- **Dark Mode Support**: Toggle between light and dark themes

## Tech Stack 💻

- **Framework**: Flutter Web
- **State Management**: GetX
- **Analytics**: Firebase Analytics with comprehensive event tracking
- **Animations**: animated_text_kit
- **Icons**: font_awesome_flutter, flutter_svg
- **Navigation**: Single-page scrolling with section keys
- **Deployment**: Firebase Hosting with GitHub Actions CI/CD
- **Code Quality**: very_good_analysis, GitHub Actions workflows

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*My Portfolio Web works on iOS, Android, Web, and Windows._

## Deployment 🚀

The portfolio is automatically deployed to Firebase Hosting using GitHub Actions when changes are pushed to the main branch. The live site is available at:

https://saksham-portfolio-ba828.web.app/#/home

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

## Firebase Analytics 📊

The portfolio includes comprehensive Firebase Analytics integration to track user engagement and interactions:

### Tracked Events
- **Page Views**: Automatic tracking of section navigation
- **User Interactions**: Button clicks, project views, contact actions
- **Downloads**: CV/Resume download tracking
- **Social Media**: Social platform link clicks
- **Theme Changes**: Light/dark mode toggle tracking
- **Error Events**: Failed operations and error handling

### Analytics Architecture
- **Service Layer**: `AnalyticsService` for Firebase integration
- **Controller Layer**: `AnalyticsController` for GetX integration
- **Event Tracking**: Comprehensive user journey analytics

For detailed analytics documentation, see:
- [Firebase Analytics Integration Guide](docs/firebase_analytics_integration.md)
- [Analytics Testing Guide](docs/analytics_testing_guide.md)

## Project Structure 📁

- `lib/app/modules/` - Feature modules (home, about, projects, contact)
- `lib/app/data/` - Data layer with repositories and models
- `lib/app/common/` - Shared components, constants, and utilities
- `lib/app/routes/` - Application routing configuration
- `lib/app/theme/` - Theme configuration and styling
- `lib/app/services/` - Core services including analytics
- `lib/app/controllers/` - GetX controllers and business logic
- `scripts/` - Utility scripts for development and deployment
- `docs/` - Documentation and guides

## App Icons 🎨

This project uses `flutter_launcher_icons` to generate app icons for all platforms. The icon configuration is defined in `flutter_launcher_icons.yaml`.

### Generating App Icons

To generate app icons for all platforms, run:

```sh
# Using the provided script
./scripts/generate_app_icons.sh

# Or directly using flutter_launcher_icons
flutter pub run flutter_launcher_icons
```

This will generate icons for Android, iOS, web, macOS, and Windows based on the configuration in `flutter_launcher_icons.yaml`.

## Contributing 🤝

Contributions, issues, and feature requests are welcome! See the [CONTRIBUTING.md](CONTRIBUTING.md) file for guidelines.

## Code Formatting and Spell Checking 📝

This project uses `dart format` with a line length of 80 characters and spell checking to ensure code quality.

### Code Formatting

To ensure your code is properly formatted before committing, you can:

#### Option 1: Use the Pre-commit Hook (Recommended)

Set up the pre-commit hook to automatically format your code before each commit:

```sh
# Configure Git to use the hooks in the .githooks directory
git config core.hooksPath .githooks
chmod +x .githooks/pre-commit
```

#### Option 2: Format Manually

Run the formatter manually before committing:

```sh
dart format --line-length 80 lib test
```

### Spell Checking

This project uses cspell for spell checking to ensure documentation and code comments are free of spelling errors.

#### Option 1: Use the Pre-push Hook (Recommended)

The pre-push hook will automatically check spelling before pushing:

```sh
# Set up the project with all hooks
make setup
```

#### Option 2: Check Spelling Manually

Run the spell checker manually:

```sh
# Using make
make spell-check

# Using npm
npm run spell-check
```

#### Adding Words to the Dictionary

If you need to add technical terms or other valid words to the dictionary:

1. Add them to `.cspell.json` in the `words` array
2. Or use inline comments in markdown files:
   ```
   <!-- cspell:ignore term1 term2 -->
   ```

Proper formatting and spell checking are enforced in the CI pipeline to maintain code quality.

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
