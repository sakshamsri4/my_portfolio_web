import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/routes/app_pages.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                  'Senior Flutter Developer',
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
    );
  }
}
