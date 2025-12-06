import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/theme_controller.dart';
import 'package:my_portfolio_web/app/modules/home/controllers/home_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 800;

    return AppBar(
      title: GestureDetector(
        onTap: () => homeController.scrollToSection('home'),
        child: const Text('My Portfolio'),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Theme.of(context).colorScheme.onSurface,
      actions: [
        // Navigation links for wide screens
        if (isWideScreen) ..._buildNavigationLinks(homeController),

        // Theme toggle button
        IconButton(
          icon: Obx(
            () => Icon(
              Get.find<ThemeController>().isDarkMode
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
          tooltip: 'Toggle theme',
          onPressed: () => Get.find<ThemeController>().toggleTheme(),
        ),

        // Menu button for narrow screens
        if (!isWideScreen)
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Show a simple menu
              Get.dialog<void>(
                AlertDialog(
                  title: const Text('Navigation'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildNavItem(
                        icon: Icons.home,
                        title: 'Home',
                        onTap: () {
                          Get.back<void>(); // Close dialog
                          homeController.scrollToSection('home');
                        },
                      ),
                      _buildNavItem(
                        icon: Icons.phone_iphone,
                        title: 'Mobile Apps',
                        onTap: () {
                          Get.back<void>(); // Close dialog
                          homeController.scrollToSection('mobile');
                        },
                      ),
                      _buildNavItem(
                        icon: Icons.layers,
                        title: 'Case Study',
                        onTap: () {
                          Get.back<void>(); // Close dialog
                          homeController.scrollToSection('case_study');
                        },
                      ),
                      _buildNavItem(
                        icon: Icons.library_books,
                        title: 'Other Cases',
                        onTap: () {
                          Get.back<void>(); // Close dialog
                          homeController.scrollToSection('other_cases');
                        },
                      ),
                      _buildNavItem(
                        icon: Icons.bolt,
                        title: 'AI Skills',
                        onTap: () {
                          Get.back<void>(); // Close dialog
                          homeController.scrollToSection('ai_skills');
                        },
                      ),
                      _buildNavItem(
                        icon: Icons.person,
                        title: 'About',
                        onTap: () {
                          Get.back<void>(); // Close dialog
                          homeController.scrollToSection('about');
                        },
                      ),
                      _buildNavItem(
                        icon: Icons.email,
                        title: 'Contact',
                        onTap: () {
                          Get.back<void>(); // Close dialog
                          homeController.scrollToSection('contact');
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      ],
    );
  }

  // Helper method to build navigation links for wide screens
  List<Widget> _buildNavigationLinks(HomeController controller) {
    return [
      Obx(
        () => _buildNavLink(
          title: 'Mobile Apps',
          isActive: controller.activeSection.value == 'mobile',
          onTap: () => controller.scrollToSection('mobile'),
        ),
      ),
      Obx(
        () => _buildNavLink(
          title: 'Case Study',
          isActive: controller.activeSection.value == 'case_study',
          onTap: () => controller.scrollToSection('case_study'),
        ),
      ),
      Obx(
        () => _buildNavLink(
          title: 'Other Cases',
          isActive: controller.activeSection.value == 'other_cases',
          onTap: () => controller.scrollToSection('other_cases'),
        ),
      ),
      Obx(
        () => _buildNavLink(
          title: 'AI Skills',
          isActive: controller.activeSection.value == 'ai_skills',
          onTap: () => controller.scrollToSection('ai_skills'),
        ),
      ),
      Obx(
        () => _buildNavLink(
          title: 'About',
          isActive: controller.activeSection.value == 'about',
          onTap: () => controller.scrollToSection('about'),
        ),
      ),
      Obx(
        () => _buildNavLink(
          title: 'Contact',
          isActive: controller.activeSection.value == 'contact',
          onTap: () => controller.scrollToSection('contact'),
        ),
      ),
    ];
  }

  // Helper method to build a navigation link
  Widget _buildNavLink({
    required String title,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: isActive ? null : Colors.grey,
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 20,
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ),
    );
  }

  // Helper method to build a navigation item for the dialog
  Widget _buildNavItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
