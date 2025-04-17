import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/theme_controller.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';
import 'package:my_portfolio_web/app/routes/app_pages.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        centerTitle: true,
        actions: [
          // Theme toggle button
          IconButton(
            icon: Obx(
              () => Icon(
                Get.find<ThemeController>().isDarkMode
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
            ),
            tooltip: 'Toggle theme',
            onPressed: () => Get.find<ThemeController>().toggleTheme(),
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Show a simple menu
              Get.dialog(
                AlertDialog(
                  title: const Text('Navigation'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.home),
                        title: const Text('Home'),
                        onTap: () {
                          Get.back(); // Close dialog
                          Get.toNamed(Routes.HOME);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: const Text('About'),
                        onTap: () {
                          Get.back(); // Close dialog
                          Get.toNamed(Routes.ABOUT);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.work),
                        title: const Text('Projects'),
                        onTap: () {
                          Get.back(); // Close dialog
                          Get.toNamed(Routes.PROJECTS);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.email),
                        title: const Text('Contact'),
                        onTap: () {
                          Get.back(); // Close dialog
                          Get.toNamed(Routes.CONTACT);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 30, color: Colors.blue),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Saksham Srivastava',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'Flutter Developer',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Get.back(); // Close drawer
                Get.toNamed(Routes.HOME);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('About'),
              onTap: () {
                Get.back(); // Close drawer
                Get.toNamed(Routes.ABOUT);
              },
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text('Projects'),
              onTap: () {
                Get.back(); // Close drawer
                Get.toNamed(Routes.PROJECTS);
              },
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Contact'),
              onTap: () {
                Get.back(); // Close drawer
                Get.toNamed(Routes.CONTACT);
              },
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Determine number of items to show in carousels based on screen width
          final carouselItemCount = constraints.maxWidth >= 1024
              ? 3
              : constraints.maxWidth >= 600
                  ? 2
                  : 1;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero section
                Center(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 70,
                        backgroundColor: Color(0xFF675AF2),
                        child:
                            Icon(Icons.person, size: 70, color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Saksham Srivastava',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Senior Flutter Developer',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        children: [
                          ElevatedButton.icon(
                            onPressed: controller.launchEmail,
                            icon: const Icon(Icons.email),
                            label: const Text('Contact Me'),
                          ),
                          ElevatedButton.icon(
                            onPressed: controller.downloadCV,
                            icon: const Icon(Icons.download),
                            label: const Text('Download CV'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // About Me section
                Text(
                  'About Me',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 16),
                const Text(
                  'I am a passionate Flutter developer with experience in building '
                  'cross-platform mobile applications. I specialize in creating '
                  'beautiful, responsive, and user-friendly interfaces.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 32),

                // Skills section
                Text(
                  'Skills',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 16),
                MouseRegion(
                  onEnter: (_) => controller.toggleCarouselPlay(),
                  onExit: (_) => controller.toggleCarouselPlay(),
                  child: Obx(() {
                    return FlutterCarousel(
                      items: controller.skills.map((skill) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withAlpha(25),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  skill,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 60,
                        autoPlay: controller.isCarouselPlaying.value,
                        autoPlayInterval: const Duration(seconds: 2),
                        enlargeCenterPage: true,
                        viewportFraction: 0.25,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 32),

                // Projects section
                Text(
                  'Projects',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: FlutterCarousel(
                    items: controller.projects.map((project) {
                      return Builder(
                        builder: (BuildContext context) {
                          return _buildProjectCard(
                            project['title']!,
                            project['description']!,
                            project['image']!,
                            project['url']!,
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 300,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      viewportFraction: carouselItemCount == 1
                          ? 0.8
                          : carouselItemCount == 2
                              ? 0.5
                              : 0.33,
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Career Timeline section
                Text(
                  'Career Timeline',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                    itemCount: controller.careerTimeline.length,
                    itemBuilder: (context, index) {
                      final isLeft = index.isEven;
                      return TimelineTile(
                        alignment: TimelineAlign.manual,
                        lineXY: 0.2,
                        isFirst: index == 0,
                        isLast: index == controller.careerTimeline.length - 1,
                        indicatorStyle: IndicatorStyle(
                          indicator: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        startChild: isLeft
                            ? _buildTimelineContent(context, index)
                            : null,
                        endChild: isLeft
                            ? null
                            : _buildTimelineContent(context, index),
                        beforeLineStyle: LineStyle(
                          color: Theme.of(context).colorScheme.primary,
                          thickness: 3,
                        ),
                        afterLineStyle: LineStyle(
                          color: Theme.of(context).colorScheme.primary,
                          thickness: 3,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 32),

                // Contact section
                Text(
                  'Contact',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.email,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          title: const Text('Email'),
                          subtitle: Text(controller.contactInfo['email']!),
                          trailing: IconButton(
                            icon: const Icon(Icons.copy),
                            onPressed: () => controller.copyToClipboard(
                              controller.contactInfo['email']!,
                            ),
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          leading: Icon(
                            Icons.phone,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          title: const Text('Phone'),
                          subtitle: Text(controller.contactInfo['phone']!),
                          trailing: IconButton(
                            icon: const Icon(Icons.copy),
                            onPressed: () => controller.copyToClipboard(
                              controller.contactInfo['phone']!,
                            ),
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          leading: Icon(
                            Icons.location_on,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          title: const Text('Location'),
                          subtitle: Text(controller.contactInfo['location']!),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTimelineContent(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.careerTimeline[index]['company']!,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Text(
                controller.careerTimeline[index]['role']!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              Text(
                controller.careerTimeline[index]['period']!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              Text(
                controller.careerTimeline[index]['description']!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard(
    String title,
    String description,
    String imageUrl,
    String externalUrl,
  ) {
    return Card(
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              // Handle missing images
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 150,
                  color: Theme.of(context).colorScheme.primary.withAlpha(25),
                  child: Center(
                    child: Icon(
                      Icons.image,
                      size: 50,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                );
              },
            ),
          ),
          // Project details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.open_in_new),
                      onPressed: () => Get.find<HomeController>()
                          .launchProjectUrl(externalUrl),
                      tooltip: 'Open project',
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
