# Activity Log
RULE: Every action taken must be recorded in this file with a timestamp for future reference or sharing.
## [2024-07-10]
- Initial setup of activity log file
- Project structure review

## [2024-07-11]
- Installed GetX CLI using `flutter pub global activate get_cli`
- Created home module using GetX CLI with `get create page:home`
- Added GetX package to dependencies in pubspec.yaml
- Updated app.dart to use GetX routing system
- Customized home view with portfolio content including:
  - Hero section with profile information
  - About Me section
  - Skills section with chip widgets
  - Projects section with card widgets
  - Contact section with contact details

## [2024-07-12]
- Created additional GetX modules using `get create module` command:
  - About module (controller, view, binding, route)
  - Projects module (controller, view, binding, route)
  - Contact module (controller, view, binding, route)
- Routes automatically added to app_pages.dart and app_routes.dart
- Implemented navigation between pages using Get.toNamed() method
- Added drawer and menu navigation in home view
- Customized About page with education and experience sections
- Customized Projects page with project cards
- Customized Contact page with contact information and message form
- Added navigation buttons between all pages

## [2024-07-13]
- Updated pubspec.yaml with new dependencies:
  - carousel_slider for image carousels
  - google_fonts for Montserrat font
  - timelines for career timeline
  - url_launcher for external links
- Created assets directory structure for CV, images, and fonts
- Downloaded Montserrat font files
- Created placeholder CV file
- Implemented app-wide theme with primary color #675AF2 and background #F4F0FF
- Applied Montserrat Bold for headline fonts
- Updated HomeController with methods for:
  - Email launching
  - CV downloading
  - URL launching
  - Clipboard operations
  - Carousel control

## [2024-07-14]
- Created custom theme configuration in app_theme.dart:
  - Set primary swatch to #675AF2
  - Set background color to #F4F0FF
  - Applied Montserrat Bold for headline fonts
  - Configured button, card, and chip themes
- Applied theme in GetMaterialApp
- Added Montserrat font configuration in pubspec.yaml
- Implemented dark theme with complementary colors
- Created ThemeController with theme toggle functionality
- Added theme toggle button in app bar
- Implemented Obx reactive state management for theme changes
- Fixed assets path in pubspec.yaml by adding trailing slashes
- Added fonts directory to assets
- Created placeholder CV file in assets/cv directory
- Added fallback image handling in project cards
- Fixed linting issues in HomeController
- Fixed deprecated color methods in HomeView

## [2024-07-15]
- Fixed package conflicts by replacing carousel_slider with flutter_carousel_widget
- Fixed timelines package errors by replacing with timeline_tile
- Updated HomeView to use the new carousel and timeline packages
- Added _buildTimelineContent method for the career timeline
- Removed unused imports
- Fixed withOpacity deprecation warnings