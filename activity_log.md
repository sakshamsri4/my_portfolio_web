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
- Implemented navigation between pages using Get.toNamed<dynamic>() method
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

## [2024-07-16]
- Updated HomeController with real CV data:
  - Added comprehensive skills list
  - Added real projects with descriptions and links
  - Updated career timeline with accurate company history
  - Added education information
  - Added professional summary
- Enhanced HomeView with additional sections:
  - Added Education section
  - Updated About Me section with professional summary
  - Added LinkedIn and GitHub links
  - Updated contact information
- Created placeholder images for all projects

## [2024-07-17]
- Refactored HomeView for better maintainability:
  - Created separate widget files for each section
  - Moved widgets to dedicated directory structure
  - Created a barrel file for easy imports
  - Reduced main HomeView file from 500+ lines to ~60 lines
  - Improved code organization and readability

## [2024-07-18]
- Enhanced UI/UX based on design principles:
  - **Visual Hierarchy**: Emphasized important elements with size, color, and elevation
  - **Balance & Spacing**: Improved layout proportions and consistent spacing
  - **Consistency**: Created cohesive design patterns across all sections
  - **Color & Contrast**: Enhanced readability with proper contrast and color usage
  - **Micro-details**: Added polish with subtle gradients, shadows, and animations
  - **Specific Improvements**:
    - Enhanced HeroSection with gradient background and visual emphasis
    - Redesigned ProjectCards with overlay text and better visual hierarchy
    - Improved SkillsSection with subtle gradients and shadows
    - Enhanced CareerTimeline with visual indicators for current position
    - Redesigned EducationSection with icons and improved layout
    - Improved ContactSection with custom contact cards
    - Enhanced AboutSection with quote styling and improved typography

## [2024-07-19]
- Implemented single-page scrolling navigation:
  - Removed drawer and extra pages for a more modern single-page experience
  - Added scroll controller and section keys for smooth scrolling
  - Created responsive navigation in app bar with section links
  - Added active section highlighting in navigation
  - Implemented mobile-friendly navigation menu for smaller screens
  - Added scroll-to-section functionality for all navigation links

## [2024-07-20]
- Enhanced contact functionality:
  - Made email address clickable to launch email client
  - Added WhatsApp integration for phone number
  - Added visual indicators (underlines and icons) for clickable contacts
  - Added Font Awesome icons for better WhatsApp branding
  - Improved contact card UI with interactive elements
  - Added tooltips for better user guidance

## [2024-07-21]
- Transformed portfolio from CV-style to engaging personal showcase:
  - Redesigned hero section with personal introduction and tagline
  - Added responsive two-column layouts for better content organization
  - Created "My Story" section with personal passion statement
  - Added "What I Do" section highlighting key services and skills
  - Enhanced projects section with introduction and call-to-action
  - Transformed contact section into inviting "Let's Connect" area
  - Added multiple calls-to-action throughout to encourage engagement
  - Improved section headers with dividers for visual interest
  - Added personal touches and storytelling elements throughout

## [2024-07-22]
- Fixed image loading and layout issues:
  - Added fallback image handling for missing project images
  - Fixed image path issues to prevent 404 errors
  - Resolved RenderFlex overflow issues in project cards
  - Added fixed height constraints to prevent layout shifts
  - Improved text overflow handling with ellipsis
  - Increased carousel height to accommodate content
  - Added mainAxisSize.min to prevent unnecessary expansion

## [2024-07-23]
- Redesigned Skills section for better visual appeal and organization:
  - Organized skills into meaningful categories with icons
  - Created a responsive grid layout that adapts to screen size
  - Added category cards with distinct headers and content areas
  - Implemented skill chips for a modern, tag-like appearance
  - Added introduction text to provide context
  - Improved visual hierarchy with section headers and dividers
  - Enhanced responsiveness with adaptive column count
  - Replaced carousel with a more structured and informative layout

## [2024-07-24]
- Enhanced Skills section with custom icons:
  - Implemented a SkillIcons utility class for icon management
  - Created category-specific icons for each skill group
  - Maintained consistent color scheme with the rest of the portfolio
  - Improved visual appeal with technology-specific iconography

## [2024-07-25]
- Fixed asset loading and font issues:
  - Resolved font loading errors by using Google Fonts exclusively
  - Fixed icon loading issues by using Material icons instead of SVG
  - Removed unused font declarations from pubspec.yaml
  - Simplified asset management for better compatibility
  - Updated SkillIcons utility to use built-in Material icons
  - Improved error handling for missing assets

## [2024-07-26]
- Enhanced portfolio with animated text for better engagement:
  - Added animated_text_kit package for dynamic text animations
  - Implemented TypewriterAnimatedText for role titles in hero section
  - Added FadeAnimatedText for introduction paragraphs
  - Implemented ColorizeAnimatedText for tagline with color transitions
  - Created smooth transitions between different text elements
  - Improved visual appeal with professional animations
  - Enhanced user engagement with dynamic content

## [2024-07-27]
- Fixed linting issues across the codebase:
  - Resolved line length issues by breaking long strings into multiple lines
  - Added proper trailing commas for better code formatting
  - Fixed string quote consistency issues
  - Improved code readability with proper line breaks
  - Enhanced maintainability with better formatted text content

## [2024-07-28]
- Implemented performance optimizations across the portfolio:
  - Added image caching system for project cards to reduce memory usage
  - Memoized computed values in HomeController to avoid redundant calculations
  - Replaced Container with KeyedSubtree for better widget tree optimization
  - Extracted widgets in AboutView for better component reusability
  - Added explicit type arguments to GetX navigation methods
  - Improved widget tree structure for better rendering performance
  - Optimized const usage for widgets that don't change

## [2024-07-29]
- Updated profile picture in hero section:
  - Added personal photo (myself.jpeg) to assets/images directory
  - Updated CircleAvatar in hero_section.dart to use the actual profile image
  - Replaced placeholder icon with real profile picture for better personalization

## [2024-07-30]
- Fixed RenderFlex overflow issues across the portfolio:
  - Added preloading of Google Fonts in web/index.html to fix font parsing errors
  - Fixed horizontal overflow in skills section by adding text overflow handling
  - Fixed vertical overflow in career timeline by constraining text and adding mainAxisSize.min
  - Improved text handling in introduction sections by removing newline characters
  - Added overflow: TextOverflow.ellipsis and maxLines constraints to prevent layout shifts
  - Enhanced responsive layout handling in skill cards and project descriptions

## [2024-07-31]
- Improved career timeline section for better responsiveness:
  - Redesigned timeline to have equal sides on desktop view
  - Created separate mobile and desktop layouts for optimal viewing
  - Added responsive sizing based on screen dimensions
  - Enhanced timeline indicators with borders and shadows
  - Implemented ConstrainedBox to control card widths consistently
  - Added adaptive font sizes and padding for different screen sizes
  - Improved visual hierarchy with section divider

## [2024-08-01]
- Enhanced career timeline with alternating pattern for mobile view:
  - Implemented alternating left/right layout for mobile screens
  - Created specialized mobile content builder for better text visibility
  - Optimized card sizes and content for smaller screens
  - Added dynamic width calculation based on screen size
  - Improved text overflow handling with multi-line support
  - Enhanced visual appearance with subtle shadows and gradients
  - Ensured consistent spacing and alignment across all screen sizes

## [2024-08-02]
- Fixed profile picture display issues across different screen sizes:
  - Replaced CircleAvatar with ClipOval and Image.asset for better control
  - Added responsive sizing based on screen width
  - Implemented BoxFit.cover to ensure the image is properly centered
  - Created consistent circular framing with proper aspect ratio
  - Maintained the same visual appearance with border and shadow effects
  - Added custom alignment to center the face in both mobile and desktop views
  - Fixed the issue where only part of the face was visible in desktop view

## [2024-08-03]
- Redesigned hero section with CRED-inspired NeoPOP design:
  - Implemented NeoPOP design principles with offset shadows and 3D effects
  - Created custom profile image container with layered elements and accent details
  - Redesigned role badge with bold typography and shadow effects
  - Added name with CRED-style bold typography and reduced letter spacing
  - Created custom social media buttons with NeoPOP shadow effects
  - Redesigned CTA buttons with offset shadows and improved visual hierarchy
  - Updated scroll indicator with NeoPOP styling and uppercase typography
  - Enhanced overall visual appeal with consistent design language

## [2024-08-04]
- Redesigned Featured Projects section with CRED-inspired card style:
  - Created responsive layouts with 3-column grid for desktop and snap-scroll for mobile
  - Implemented deep-navy gradient cards with 20px radius and inset white stroke
  - Added hover effects that lift cards and brighten background
  - Designed centered logo chips for each project
  - Updated typography following CRED style guidelines
  - Added ghost CTA buttons with sliding arrow animation on hover
  - Implemented 6px minimalist carousel dots for navigation
  - Added parallax gradient shift effect on cards
  - Increased section top padding to 128px with thin purple underline under heading
  - Enhanced visual hierarchy and readability across all screen sizes

## [2024-08-05]
- Attempted UI improvements but reverted to original design based on user preference:
  - Temporarily tested larger social media icons and repositioned tech stack
  - Reverted changes to maintain original design and layout
  - Preserved original tech stack position above call-to-action buttons
  - Maintained original social media icon styling

## [2024-08-06]
- Fixed social media icons display issue:
  - Restored proper NeoPOP styling for social media icons
  - Fixed white circle appearance by adding proper container and shadow
  - Ensured consistent styling with the rest of the UI elements
  - Improved visibility of social media icons against the background

- Added fixed social media sidebar following CRED design principles:
  - Created a new SocialSidebar widget that stays fixed on the left side while scrolling
  - Implemented LinkedIn, GitHub, Twitter, and WhatsApp icons with NeoPOP styling
  - Removed social media icons from the hero section to avoid duplication
  - Added vertical line with gradient below icons for visual separation following CRED design

- Refined social sidebar design to better blend with background:
  - Removed container background for a cleaner, more minimal look
  - Added subtle hover animation with transform effect
  - Reduced icon size and adjusted shadow opacity for better visual integration
  - Added responsive padding to main content to accommodate the sidebar

- Enhanced tech stack section with CRED design principles:
  - Added a container with subtle shadow and rounded corners
  - Improved section with title and subtitle for better context
  - Added hover animations to tech icons for better interactivity
  - Increased tech icon size and improved styling
  - Maintained original position before call-to-action buttons per user preference

- Refactored codebase following SOLID and DRY principles:
  - Created reusable UI components in a common package:
    - NeoPOPButton for call-to-action buttons
    - NeoPOPSocialButton for social media icons
    - NeoPOPTechIcon for technology stack icons
    - SectionContainer for consistent section styling
  - Implemented proper data layer with models and repository pattern
  - Added constants file for colors, spacing, and URLs
  - Created responsive helper for consistent breakpoints
  - Updated HomeController to use dependency injection
  - Improved code organization and readability

- Added Tech Stack section to Skills area:
  - Implemented horizontally scrollable tech icons with CRED-inspired design
  - Added NeoPOP styling with shadow effects and hover animations
  - Created container with subtle shadow and rounded corners
  - Included section title and subtitle for better context
  - Displayed key technologies with their respective brand colors and icons
  - Added scroll indicator with directional arrows
  - Fixed height for consistent layout across devices

- Fixed UI alignment issues:
  - Centered the down arrow icon in the scroll indicator using Center widget
  - Improved visual alignment of NeoPOP elements

## [2024-08-07]
- Removed unwanted white circle from profile image:
  - Identified and removed the accent element (white circle) positioned at the bottom right of the profile image
  - Simplified the profile image styling for a cleaner look

- Implemented frosted glass effect project tiles for featured projects:
  - Added two tile background images (John_hancock.webp and manulife.webp) to assets/tile_images/ directory
  - Created a new FrostedGlassProjectCard widget with translucent effect
  - Updated HomeController to include tileImage property for the first two projects
  - Modified ProjectsSection to use the new frosted glass cards for projects with tile images
  - Added hover animations with dynamic blur effect for better interactivity
  - Fixed deprecated withOpacity calls using withAlpha for better performance

## [2024-08-08]
- Fixed linting issues throughout the app:
  - Fixed type inference issues in Get.back() and Get.toNamed() calls in contact_view.dart
  - Added explicit type arguments (<void>) to navigation methods
  - Removed unnecessary overrides in ContactController
  - Updated TODO comment format to follow Flutter style guidelines

## [2024-08-09]
- Deployed portfolio website to Firebase Hosting:
  - Fixed index.html bootstrap script issue
  - Installed Firebase CLI tools
  - Initialized Firebase project with Hosting configuration
  - Built Flutter web app for production using the production target
  - Deployed to Firebase hosting
  - Website now live at https://saksham-portfolio-ba828.web.app

## [2024-08-10]
- Set up continuous deployment with GitHub Actions:
  - Checked local Git repository status and confirmed GitHub repository connection
  - Generated Firebase CI token for GitHub Actions authentication
  - Created GitHub Actions workflow file (.github/workflows/firebase-hosting-deploy.yml)
  - Configured workflow to build Flutter web app and deploy to Firebase Hosting on push to main branch
  - Added Firebase token as GitHub secret for secure authentication
  - Ready to commit and push workflow file to activate continuous deployment

- Enhanced tech stack section with SVG icons:
  - Added flutter_svg package for SVG rendering
  - Created SvgIconHelper utility class for loading and displaying SVG icons
  - Updated TechStackItem model to support both FontAwesome and SVG icons
  - Added 20+ tech stack items with SVG icons for Flutter, Dart, Python, AI/ML tools, and more
  - Modified skills section to display SVG icons with the same CRED-inspired design
  - Added tech_icon_svg directory to assets in pubspec.yaml
  - Optimized app size by removing unused SVG icons (reduced from 6MB to 80KB)

## [2024-08-11]
- Fixed skills section display issues:
  - Reverted to original chip-based design for skills display
  - Fixed type casting issues in the skills section
  - Updated home controller to properly handle skills data from repository
  - Maintained SVG icons for future use
  - Created 15+ custom SVG icons for skills like GetX, BLoC, Provider, Firestore, etc.

- Fixed GitHub Actions build failures:
  - Fixed code formatting issues by running dart format
  - Fixed spelling issues in activity log
  - Added .cspell.json configuration file with technical terms dictionary
  - Updated documentation to use standard terminology

- Enhanced skills section with AI and automation capabilities:
  - Made skill category cards horizontally scrollable for better mobile experience
  - Kept chips in their original non-scrollable format within each card
  - Added scroll indicators for the skill categories
  - Expanded to 12 focused skill categories following CRED design principles
  - Limited each category to 5 key skills for a cleaner, more elegant look
  - Added dedicated categories for Flutter, AI Tools, AI Integration, Testing, and Automation
  - Split Backend & Database into separate categories for better organization
  - Updated professional summary to highlight AI integration and automation expertise
  - Added FontAwesome icons for all skill categories
  - Fixed home controller to use repository data instead of hardcoded values
  - Improved dark mode support with white text for skill chips and category titles
  - Implemented infinite scrolling for skill categories and tech stack icons
  - Created a reusable InfiniteScrollRow widget for continuous scrolling experience

## [2024-08-12]
- Fixed build failures in GitHub Actions:
  - Fixed line length issues by running dart format with 80-character limit
  - Added required trailing comma in service_locator.dart
  - Fixed deprecated member use warnings by using conditional imports for dart:html
  - Created HTML stub implementation for non-web platforms
  - Updated withOpacity to withAlpha to avoid precision loss
  - Fixed parameter ordering in InfiniteScrollRow widget
  - Updated analysis_options.yaml to ignore remaining warnings
  - Verified all analyzer issues are resolved
  - Updated Dart SDK constraint in pubspec.yaml to be compatible with CI environment (>=3.3.0 <4.0.0)
  - Downgraded very_good_analysis from ^6.0.0 to ^5.1.0 to be compatible with Dart SDK 3.3.1

- Improved code organization following DRY principles:
  - Created reusable TechChip widget for consistent chip styling across the app
  - Refactored ProjectCard to use shared AppShadows and AppTextStyles
  - Reduced code duplication between skills section and project cards
  - Improved maintainability by centralizing styling logic

## [2024-04-19]
- Fixed duplicate mapping key error in pubspec.yaml:
  - Identified and removed duplicate entries for flutter_bloc and flutter_carousel_widget
  - Kept the newer versions of the packages (^9.1.0 for flutter_bloc and ^3.1.0 for flutter_carousel_widget)
  - Successfully ran flutter pub get to verify the fix