import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:my_portfolio_web/app/modules/home/widgets/project_card.dart';

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

class _ProjectsSectionState extends State<ProjectsSection> {
  // Current page for carousel dots
  int _currentPage = 0;
  // Scroll controller for mobile snap-scroll
  final ScrollController _scrollController = ScrollController();
  // Page controller for desktop grid pagination
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
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
              "Here are some of my favorite projects that showcase my skills "
              "and passion for creating exceptional mobile experiences. Each "
              "project represents a unique challenge that I've tackled with "
              "creativity and technical expertise.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.87),
              ),
            ),
          ),

          // Projects display - different layouts for mobile and desktop
          isMobile
              ? _buildMobileSnapScrollProjects()
              : _buildDesktopGridProjects(),

          // Carousel dots for mobile
          if (isMobile)
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  math.min(6, widget.controller.projects.length),
                  (index) => _buildCarouselDot(index),
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

  // Mobile snap-scroll list of projects
  Widget _buildMobileSnapScrollProjects() {
    return SizedBox(
      height: 450, // Fixed height for mobile cards
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollEndNotification) {
            final page = (_scrollController.offset / 300).round();
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
          itemCount: widget.controller.projects.length,
          itemBuilder: (context, index) {
            final project = widget.controller.projects[index];
            return Container(
              width: MediaQuery.of(context).size.width * 0.85,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ProjectCard(
                title: project['title']!,
                description: project['description']!,
                imageUrl:
                    widget.controller.getImageWithFallback(project['image']!),
                externalUrl: project['url']!,
              ),
            );
          },
        ),
      ),
    );
  }

  // Desktop 3-column grid of projects
  Widget _buildDesktopGridProjects() {
    final projectsPerPage = 3; // 3 columns per row
    final totalPages =
        (widget.controller.projects.length / projectsPerPage).ceil();

    return Column(
      children: [
        SizedBox(
          height: 450, // Fixed height for desktop cards
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: totalPages,
            itemBuilder: (context, pageIndex) {
              final startIndex = pageIndex * projectsPerPage;
              final endIndex = math.min(startIndex + projectsPerPage,
                  widget.controller.projects.length);

              return Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var i = startIndex; i < endIndex; i++)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ProjectCard(
                          title: widget.controller.projects[i]['title']!,
                          description: widget.controller.projects[i]
                              ['description']!,
                          imageUrl: widget.controller.getImageWithFallback(
                              widget.controller.projects[i]['image']!),
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

        // Pagination dots for desktop
        if (totalPages > 1)
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                totalPages,
                (index) => _buildCarouselDot(index),
              ),
            ),
          ),
      ],
    );
  }

  // Carousel dot indicator
  Widget _buildCarouselDot(int index) {
    final isActive = index == _currentPage;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 6, // 6px minimalist dots as requested
      width: isActive ? 18 : 6,
      decoration: BoxDecoration(
        color: isActive ? primaryColor : Colors.grey.withOpacity(0.3),
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
