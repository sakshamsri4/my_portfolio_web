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
      end: 0.5, // 30% brighter on hover for maximum image visibility
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );
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

                    // Clickable container for the entire card
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => Get.find<HomeController>()
                            .launchProjectUrl(widget.externalUrl),
                        splashColor: Colors.white.withAlpha(30),
                        highlightColor: Colors.white.withAlpha(20),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white.withAlpha(51), // 0.2 opacity
                              width: 1.5,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Spacer(),
                              // Semi-transparent background for text
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black.withAlpha(0),
                                      Colors.black.withAlpha(150),
                                    ],
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    // Project title
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        16,
                                        0,
                                        16,
                                        8,
                                      ),
                                      child: Text(
                                        widget.title,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          letterSpacing: -0.2,
                                          shadows: [
                                            Shadow(
                                              color:
                                                  Color.fromARGB(200, 0, 0, 0),
                                              offset: Offset(0, 1),
                                              blurRadius: 4,
                                            ),
                                          ],
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),

                                    // View Project button
                                    Center(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8,
                                          horizontal: 16,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withAlpha(30),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: Colors.white.withAlpha(100),
                                          ),
                                        ),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'View Project',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.5,
                                                shadows: [
                                                  Shadow(
                                                    color: Color.fromARGB(
                                                      200,
                                                      0,
                                                      0,
                                                      0,
                                                    ),
                                                    offset: Offset(0, 1),
                                                    blurRadius: 3,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
}
