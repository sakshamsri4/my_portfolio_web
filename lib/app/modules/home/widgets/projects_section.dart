import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:my_portfolio_web/app/modules/home/widgets/glassmorphic_project_card.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({
    required this.controller,
    required this.carouselItemCount,
    super.key,
  });
  final HomeController controller;
  final int carouselItemCount;

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection>
    with SingleTickerProviderStateMixin {
  // Current page for carousel dots
  int _currentPage = 0;
  // Scroll controller for mobile snap-scroll
  final ScrollController _scrollController = ScrollController();
  // Page controller for desktop grid pagination
  late PageController _pageController;
  // Timer for auto-rotation
  Timer? _autoRotateTimer;
  // Animation controller for smooth transitions
  late AnimationController _animationController;
  // Whether user is currently interacting with the carousel
  bool _userInteracting = false;
  // Total number of pages for desktop view
  int _totalPages = 0;
  // Track if scroll has been initialized for mobile view
  bool _scrollInitialized = false;
  // Track if page view has been initialized for desktop view
  bool _pageInitialized = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Start auto-rotation timer
    _startAutoRotation();
  }

  void _startAutoRotation() {
    // Cancel any existing timer
    _autoRotateTimer?.cancel();

    // Create a new timer that rotates the carousel every 5 seconds
    _autoRotateTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!_userInteracting && mounted) {
        final isMobile = MediaQuery.of(context).size.width < 768;

        if (isMobile) {
          // For mobile view
          final nextPage =
              (_currentPage + 1) % widget.controller.projects.length;
          _scrollToPage(nextPage);
        } else {
          // For desktop view
          if (_totalPages > 0) {
            final nextPage = (_currentPage + 1) % _totalPages;
            _pageController.animateToPage(
              nextPage,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
            );
          }
        }
      }
    });
  }

  void _scrollToPage(int page) {
    // Calculate the target offset
    final targetOffset = page * 300.0;

    // Animate to the target offset
    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    _autoRotateTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Padding(
      padding:
          const EdgeInsets.only(top: 128), // 128px top padding as requested
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header with thin purple underline
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Featured Projects',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 8),
              Container(
                width: 80,
                height: 2,
                color: primaryColor,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Introduction text
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Text(
              'Here are some of my favorite projects that showcase my skills '
              'and passion for creating exceptional mobile experiences. Each '
              "project represents a unique challenge that I've tackled with "
              'creativity and technical expertise.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withAlpha(222), // 0.87 opacity
              ),
            ),
          ),

          // Projects display - different layouts for mobile and desktop
          if (isMobile)
            _buildMobileSnapScrollProjects()
          else
            _buildDesktopGridProjects(),

          // Carousel dots for mobile
          if (isMobile)
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  math.min(6, widget.controller.projects.length),
                  _buildCarouselDot,
                ),
              ),
            ),

          // Call to action with CRED-inspired design
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 24),
            child: Center(
              child: _buildNeoPOPCTA(
                label: 'View More Projects on GitHub',
                icon: Icons.code,
                onPressed: () => widget.controller
                    .launchProjectUrl('https://github.com/sakshamsri4'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Mobile snap-scroll list of projects with infinite scrolling
  Widget _buildMobileSnapScrollProjects() {
    final projectCount = widget.controller.projects.length;
    // Use a large number for infinite scrolling effect
    const virtualItemCount = 10000;

    return SizedBox(
      height: 450, // Fixed height for mobile cards
      child: Listener(
        onPointerDown: (_) {
          _userInteracting = true;
        },
        onPointerUp: (_) {
          _userInteracting = false;
          _startAutoRotation(); // Restart auto-rotation when user stops interacting
        },
        onPointerCancel: (_) {
          _userInteracting = false;
          _startAutoRotation();
        },
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            if (notification is ScrollStartNotification) {
              _userInteracting = true;
            } else if (notification is ScrollEndNotification) {
              _userInteracting = false;
              _startAutoRotation();

              final cardWidth = MediaQuery.of(context).size.width * 0.85 +
                  24; // Width + padding
              final page =
                  (_scrollController.offset / cardWidth).round() % projectCount;
              if (page != _currentPage) {
                setState(() {
                  _currentPage = page;
                });
              }
            }
            return true;
          },
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            physics: const PageScrollPhysics(),
            itemCount:
                virtualItemCount, // Very large number for infinite scrolling
            itemBuilder: (context, index) {
              // Map the virtual index to actual project index
              final projectIndex = index % projectCount;
              final project = widget.controller.projects[projectIndex];

              // Start in the middle of the virtual list for better infinite scrolling
              if (index == virtualItemCount ~/ 2 && !_scrollInitialized) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _scrollController.jumpTo(
                    index * (MediaQuery.of(context).size.width * 0.85 + 24),
                  );
                  _scrollInitialized = true;
                });
              }

              return Container(
                width: MediaQuery.of(context).size.width * 0.85,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GlassmorphicProjectCard(
                  title: project['title']!,
                  description: project['description']!,
                  imageUrl:
                      widget.controller.getImageWithFallback(project['image']!),
                  tileImageUrl: project['tileImage']!,
                  externalUrl: project['url']!,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // Desktop 3-column grid of projects with infinite scrolling
  Widget _buildDesktopGridProjects() {
    const projectsPerPage = 3; // 3 columns per row
    final actualPages =
        (widget.controller.projects.length / projectsPerPage).ceil();
    _totalPages = actualPages;
    // Use a large number for infinite scrolling effect
    const virtualPageCount = 10000;

    return Column(
      children: [
        SizedBox(
          height: 450, // Fixed height for desktop cards
          child: Listener(
            onPointerDown: (_) {
              _userInteracting = true;
            },
            onPointerUp: (_) {
              _userInteracting = false;
              _startAutoRotation(); // Restart auto-rotation when user stops interacting
            },
            onPointerCancel: (_) {
              _userInteracting = false;
              _startAutoRotation();
            },
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page % actualPages;
                });
              },
              itemCount:
                  virtualPageCount, // Very large number for infinite scrolling
              itemBuilder: (context, virtualPageIndex) {
                // Map virtual page index to actual page index
                final pageIndex = virtualPageIndex % actualPages;

                // Start in the middle of the virtual list for better infinite scrolling
                if (virtualPageIndex == virtualPageCount ~/ 2 &&
                    !_pageInitialized) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _pageController.jumpToPage(virtualPageIndex);
                    _pageInitialized = true;
                  });
                }
                final startIndex = pageIndex * projectsPerPage;
                final endIndex = math.min(
                  startIndex + projectsPerPage,
                  widget.controller.projects.length,
                );

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var i = startIndex; i < endIndex; i++)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: GlassmorphicProjectCard(
                            title: widget.controller.projects[i]['title']!,
                            description: widget.controller.projects[i]
                                ['description']!,
                            imageUrl: widget.controller.getImageWithFallback(
                              widget.controller.projects[i]['image']!,
                            ),
                            tileImageUrl: widget.controller.projects[i]
                                ['tileImage']!,
                            externalUrl: widget.controller.projects[i]['url']!,
                          ),
                        ),
                      ),

                    // Add empty placeholders if needed to maintain 3 columns
                    if (endIndex - startIndex < projectsPerPage)
                      for (var i = 0;
                          i < projectsPerPage - (endIndex - startIndex);
                          i++)
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Container(), // Empty placeholder
                          ),
                        ),
                  ],
                );
              },
            ),
          ),
        ),

        // Pagination dots for desktop
        Visibility(
          visible: _totalPages > 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _totalPages,
                _buildCarouselDot,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Carousel dot indicator
  Widget _buildCarouselDot(int index) {
    final isActive = index == _currentPage % _totalPages;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 6, // 6px minimalist dots as requested
      width: isActive ? 18 : 6,
      decoration: BoxDecoration(
        color:
            isActive ? primaryColor : Colors.grey.withAlpha(76), // 0.3 opacity
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  // CRED-inspired CTA button
  Widget _buildNeoPOPCTA({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Shadow container with offset
          Positioned(
            left: 4,
            top: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    color: Colors.transparent,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: const TextStyle(
                      color: Colors.transparent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Main container
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: primaryColor, width: 2),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: primaryColor,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
