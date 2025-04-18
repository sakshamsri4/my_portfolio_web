import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

// A cache for project images to avoid rebuilding them
final Map<String, Image> _imageCache = <String, Image>{};

class GlassmorphicProjectCard extends StatefulWidget {
  const GlassmorphicProjectCard({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.tileImageUrl,
    required this.externalUrl,
    super.key,
  });
  final String title;
  final String description;
  final String imageUrl;
  final String tileImageUrl;
  final String externalUrl;

  @override
  State<GlassmorphicProjectCard> createState() =>
      _GlassmorphicProjectCardState();
}

class _GlassmorphicProjectCardState extends State<GlassmorphicProjectCard>
    with SingleTickerProviderStateMixin {
  // Animation controller for hover effects
  late AnimationController _controller;
  late Animation<double> _elevationAnimation;
  late Animation<double> _brightnessAnimation;
  late Animation<double> _arrowSlideAnimation;
  late Animation<double> _blurAnimation;

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
      end: 8,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _brightnessAnimation = Tween<double>(
      begin: 0,
      end: 0.2, // 20% brighter on hover for better image visibility
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

    _blurAnimation = Tween<double>(
      begin: 3, // Reduced blur for better image visibility
      end: 1.5,
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
                  // Dark shadow
                  BoxShadow(
                    color: Colors.black.withAlpha(76), // 0.3 opacity
                    blurRadius: 8 + (_elevationAnimation.value * 2),
                    spreadRadius: 2 + _elevationAnimation.value,
                    offset: Offset(0, 4 + _elevationAnimation.value),
                  ),
                  // Purple glow
                  BoxShadow(
                    color: accentColor.withAlpha(
                      51 + (_brightnessAnimation.value * 25).toInt(),
                    ), // 0.2-0.3 opacity
                    blurRadius: 12 + (_elevationAnimation.value * 3),
                    spreadRadius: -2,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background image
                    _buildBackgroundImage(),

                    // Glassmorphic overlay
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: _blurAnimation.value,
                        sigmaY: _blurAnimation.value,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: const [0.0, 1.0],
                            colors: [
                              Colors.indigo.shade900.withAlpha(
                                100 - (_brightnessAnimation.value * 60).toInt(),
                                // Further reduced opacity
                                //for better image visibility
                              ),
                              Colors.indigo.shade800.withAlpha(
                                120 - (_brightnessAnimation.value * 60).toInt(),
                                // Further reduced opacity
                                //for better image visibility
                              ),
                            ],
                          ),
                          border: Border.all(
                            color: Colors.white.withAlpha(51), // 0.2 opacity
                            width: 1.5,
                          ),
                        ),
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
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                                      .withAlpha(242), // 0.95 opacity
                                  letterSpacing: -0.2,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),

                            // Description
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Text(
                                widget.description,
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white
                                      .withAlpha(204), // 0.8 opacity
                                  height: 1.4,
                                  letterSpacing: 0.1,
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.white
                                            .withAlpha(102), // 0.4 opacity
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'View Project',
                                        style: TextStyle(
                                          color: Colors.white
                                              .withAlpha(230), // 0.9 opacity
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8 + _arrowSlideAnimation.value,
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white
                                            .withAlpha(230), // 0.9 opacity
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Build background image
  Widget _buildBackgroundImage() {
    return SizedBox.expand(
      child: _getCachedImage(
        widget.tileImageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          // Fallback to a gradient if image fails to load
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context)
                      .colorScheme
                      .primary
                      .withAlpha(179), // 0.7 opacity
                  Theme.of(context)
                      .colorScheme
                      .primary
                      .withAlpha(77), // 0.3 opacity
                ],
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
        color: Colors.white.withAlpha(38), // 0.15 opacity
        boxShadow: [
          BoxShadow(
            color: accentColor.withAlpha(77), // 0.3 opacity
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
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(38), // 0.15 opacity
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          tech,
          style: TextStyle(
            color: Colors.white.withAlpha(230), // 0.9 opacity
            fontSize: 10,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
      );
    }).toList();
  }
}
