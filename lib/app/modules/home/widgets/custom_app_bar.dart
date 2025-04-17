import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/controllers/theme_controller.dart';
import 'package:my_portfolio_web/app/routes/app_pages.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
