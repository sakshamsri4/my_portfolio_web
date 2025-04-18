import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/common/styles/app_shadows.dart';
import 'package:my_portfolio_web/app/common/styles/app_text_styles.dart';
import 'package:my_portfolio_web/app/common/ui/tech_chip.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

// A cache for project images to avoid rebuilding them
final Map<String, Image> _imageCache = <String, Image>{};

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.externalUrl,
    super.key,
  });
  final String title;
  final String description;
  final String imageUrl;
  final String externalUrl;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with SingleTickerProviderStateMixin {
  // Animation controller for hover effects
  late AnimationController _controller;
  late Animation<double> _elevationAnimation;
  late Animation<double> _brightnessAnimation;
  late Animation<double> _arrowSlideAnimation;

  // Parallax effect values
  double _parallaxOffset = 0;

  // Get cached image or create a new one
  Widget _getCachedImage(
    String imageUrl, {
    required Widget Function(BuildContext, Object, StackTrace?) errorBuilder,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    // Return from cache if exists
    if (_imageCache.containsKey(imageUrl)) {
      return _imageCache[imageUrl]!;
    }

    // Create and cache new image
    final image = Image.asset(
      imageUrl,
      height: height,
      width: width,
      fit: fit,
      errorBuilder: errorBuilder,
    );

    // Add to cache
    _imageCache[imageUrl] = image;
    return image;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _elevationAnimation = Tween<double>(
      begin: 0,
      end: 4,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _brightnessAnimation = Tween<double>(
      begin: 0,
      end: 0.04, // 4% brighter on hover
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _arrowSlideAnimation = Tween<double>(
      begin: 0,
      end: 8,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    // Generate a random offset for parallax effect
    _parallaxOffset = (math.Random().nextDouble() * 0.1) - 0.05;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // CRED-inspired deep navy gradient colors
    const gradientStart = Color(0xFF1A1F35);
    const gradientEnd = Color(0xFF101528);
    final accentColor = Theme.of(context).colorScheme.primary;

    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, -_elevationAnimation.value),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  ...AppShadows.elevatedShadow(_elevationAnimation.value),
                  AppShadows.coloredGlow(
                    color: accentColor,
                    opacity: 0.2 + (_brightnessAnimation.value * 0.1),
                    blurRadius: 12 + (_elevationAnimation.value * 3),
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.0, 1.0],
                  colors: [
                    Color.lerp(
                      gradientStart,
                      Colors.white,
                      _brightnessAnimation.value,
                    )!,
                    Color.lerp(
                      gradientEnd,
                      Colors.white,
                      _brightnessAnimation.value,
                    )!,
                  ],
                  transform: GradientRotation(
                    _parallaxOffset + (_brightnessAnimation.value * 0.1),
                  ),
                ),
                border: Border.all(
                  color: Colors.white
                      .withAlpha(26), // 0.1 opacity - 10% white inset stroke
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Logo/Icon centered at the top
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: _buildProjectLogo(widget.imageUrl),
                    ),

                    // Project title
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
                      child: Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.cardTitleWithShadow.copyWith(
                          color: Colors.white.withAlpha(222), // 0.87 opacity
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),

                    // Description
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        widget.description,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.cardDescriptionWithShadow.copyWith(
                          color: Colors.white60,
                        ),
                      ),
                    ),

                    // Technology chips
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 8,
                        runSpacing: 8,
                        children: _buildTechChips(),
                      ),
                    ),

                    const Spacer(),

                    // Ghost CTA button
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: InkWell(
                        onTap: () => Get.find<HomeController>()
                            .launchProjectUrl(widget.externalUrl),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.white30,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'View Project',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(width: 8 + _arrowSlideAnimation.value),
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.white70,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Build project logo/icon
  Widget _buildProjectLogo(String imageUrl) {
    final accentColor = Theme.of(context).colorScheme.primary;

    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white10,
        boxShadow: [
          BoxShadow(
            color: accentColor.withAlpha(51), // 0.2 opacity
            blurRadius: 8,
          ),
        ],
      ),
      child: ClipOval(
        child: _getCachedImage(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            // Extract first letter of project title for fallback
            final firstLetter = widget.title.isNotEmpty ? widget.title[0] : 'P';
            return Center(
              child: Text(
                firstLetter,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Build technology chips
  List<Widget> _buildTechChips() {
    // Extract tech keywords from description
    final keywords = ['Flutter', 'Firebase', 'GetX', 'Mobile', 'Web'];

    return keywords.take(3).map((tech) {
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: TechChip(
          label: tech,
          isDarkMode: true,
        ),
      );
    }).toList();
  }
}
